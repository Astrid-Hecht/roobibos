class CustomerSubscriptionsController < ApplicationController
  before_action :set_customer_subscription, only: [:show, :update, :destroy]

  # GET /customer_subscriptions
  def index
    @customer_subscriptions = CustomerSubscription.all

    render json: @customer_subscriptions
  end

  # GET /customer_subscriptions/1
  def show
    render json: @customer_subscription
  end

  # POST /customer_subscriptions
  def create
    @customer_subscription = CustomerSubscription.new(customer_subscription_params)

    if @customer_subscription.save
      render json: @customer_subscription, status: :created, location: @customer_subscription
    else
      render json: @customer_subscription.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customer_subscriptions/1
  def update
    if @customer_subscription.update(customer_subscription_params)
      render json: @customer_subscription
    else
      render json: @customer_subscription.errors, status: :unprocessable_entity
    end
  end

  # DELETE /customer_subscriptions/1
  def destroy
    @customer_subscription.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_subscription
      @customer_subscription = CustomerSubscription.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def customer_subscription_params
      params.require(:customer_subscription).permit(:customer_id, :subscription_id)
    end
end
