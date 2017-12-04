class Api::V1::OrdersController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index ]
  before_action :set_order, only: [:show, :update]

  # def index
  #   @orders = policy_scope(Order)
  # end

  def show
  end

  def update
    if @order.update(order_params)
      render :show
    else
      render_error
    end
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @person = Person.new(person_params)
    # byebug
    if @vehicle.save && @person.save
      @order = Order.new(vehicle: @vehicle, person: @person)
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

  def person_params
    params.require(:Person).require(:Name).permit(:firstName,:surName)
    # params.require(:person).permit(name: [:firstName, :surname])
    # params.require(:person).permit({email_attributes: [:emailAddress, :id]}, name: [:firstName, :surname])
  end

  # def email_params
  #   params.require(:person).permit( { email: [] } )
  # end

  def render_error
    render json: { errors: @order.errors.full_messages },
      status: :unprocessable_entity
  end
end
