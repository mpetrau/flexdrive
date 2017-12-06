class Api::V1::OrdersController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index ]
  before_action :set_order, only: [:show, :update]

  # def index
  #   @orders = policy_scope(Order)
  # end

  def show
  end

  def update
    @vehicle = @order.vehicle.update(vehicle_params) if params[:Vehicle]
    @person = @order.person.update(person_params) if params[:Person]
    if @vehicle || @person
      render :show
    else
      render_error
    end
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @person = Person.new(person_params)
    p '-------------------------------'
    p person_params
    # byebug
    @bank_account = BankAccount.new(bank_account_params)

    if @vehicle.save && @person.save && @bank_account.save
      @order = Order.new(vehicle: @vehicle, person: @person, bank_account: @bank_account)
      authorize @order
      if @order.save
        render :show
      else
        render_error
      end
    else
      render_error
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
    authorize @order
  end

  def order_params
    params.require(:Order).permit(:vehicle_id, :person_id)
  end

  def vehicle_params
    params.require(:Vehicle).permit(:make, :modelVariant, :modelRange, :colour)
  end

  def bank_account_params
    params.require(:BankAccount).permit(:IBAN, :BIC, :BAN)
  end

  def person_params
    # params.require(:Person).permit(:Name, :Email).tap do |whitelisted|
    #   whitelisted[:firstName, :surName] = params[:Person][:Name]
    # end

    # each works individually, but still cannot create a contract. Something breaks when trying to create Email.
    whitelisted = params.require(:Person).require(:Name).permit(:firstName,:surName)
    params[:Person][:emails_attributes] = params[:Person][:Email]
    params[:Person].merge!(whitelisted)
    params.require(:Person).permit(:firstName, :surName, emails_attributes: [:id,:emailAddress, :_destroy])


  end

  # def email_params
  #   params.require(:person).permit( { email: [] } )
  # end

  def render_error
    render json: { errors: @order.errors.full_messages },
      status: :unprocessable_entity
  end
end
