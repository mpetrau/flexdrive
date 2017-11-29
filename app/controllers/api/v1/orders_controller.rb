class Api::V1::OrdersController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index ]
  before_action :set_order, only: [:show, :update]

  def index
    @orders = policy_scope(Order)
  end

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
    @order = Order.new(order_params)
    authorize @order
    if @order.save(order_params)
      render :show
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
    params.require(:order).permit(:vehicle_id, :person_id)
  end

  def render_error
    render json: { errors: @order.errors.full_messages },
      status: :unprocessable_entity
  end
end
