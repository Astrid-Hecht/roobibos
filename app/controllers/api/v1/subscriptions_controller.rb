class Api::V1::SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :update, :destroy]

  # PATCH/PUT /subscriptions/1
  def update
    if @subscription.update(subscription_params)
      render json: SubscriptionSerializer.new(@subscription)
    else
      render json: @subscription.errors, status: :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subscription_params
      params.require(:subscription).permit(:title, :price, :status, :frequency)
    end
end
