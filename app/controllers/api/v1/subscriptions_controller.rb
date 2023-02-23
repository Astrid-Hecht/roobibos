module Api
  module V1
    class SubscriptionsController < V1Controller
      before_action :set_subscription, only: [:show, :update, :destroy]

      # PATCH/PUT /subscriptions/1
      def update
        return render_id_not_found unless set_subscription.present?
        return render_bad_request unless valid_status?

        @subscription.update(subscription_params)
        render json: SubscriptionSerializer.new(@subscription)
      end

      def update_zero_knowledge
        return render_bad_request unless params[:id].present?
        return render_id_not_found unless set_subscription.present?
        return render_bad_request unless valid_status?

        @subscription.update(subscription_params)
        render json: SubscriptionSerializer.new(@subscription)
      end


      private
        # Use callbacks to share common setup or constraints between actions.
        def set_subscription
          return false unless Subscription.all.map(&:id).include?(params[:id].to_i)

          @subscription = Subscription.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def subscription_params
          params.require(:subscription).permit(:status)
        end

        def valid_status?
          (params[:status] == 0 || params[:status] == 1) || (params[:subscription][:status] == 0 || params[:subscription][:status] == 1 )
        end
    end
  end
end
