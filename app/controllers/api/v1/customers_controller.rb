module Api
  module V1
    class CustomersController < V1Controller

      # GET /customers/1
      def show
        return render_id_not_found unless set_customer.present?

        render json: CustomerSerializer.new(@customer)
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_customer
          return false unless Customer.all.map(&:id).include?(params[:id].to_i)

          @customer = Customer.find(params[:id])
        end
    end
  end
end
