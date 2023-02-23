class Api::V1::CustomersController < ApplicationController
  before_action :set_customer, only: [:show]

  # GET /customers/1
  def show
    # options = {
    #   include: [:subscriptions]
    # }
    render json: CustomerSerializer.new(@customer)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end
end
