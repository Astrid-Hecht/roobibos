class SubscriptionTeasController < ApplicationController
  before_action :set_create_subscription_tea, only: [:show, :update, :destroy]

  # GET /create_subscription_teas
  def index
    @create_subscription_teas = CreateSubscriptionTea.all

    render json: @create_subscription_teas
  end

  # GET /create_subscription_teas/1
  def show
    render json: @create_subscription_tea
  end

  # POST /create_subscription_teas
  def create
    @create_subscription_tea = CreateSubscriptionTea.new(create_subscription_tea_params)

    if @create_subscription_tea.save
      render json: @create_subscription_tea, status: :created, location: @create_subscription_tea
    else
      render json: @create_subscription_tea.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /create_subscription_teas/1
  def update
    if @create_subscription_tea.update(create_subscription_tea_params)
      render json: @create_subscription_tea
    else
      render json: @create_subscription_tea.errors, status: :unprocessable_entity
    end
  end

  # DELETE /create_subscription_teas/1
  def destroy
    @create_subscription_tea.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_create_subscription_tea
      @create_subscription_tea = CreateSubscriptionTea.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def create_subscription_tea_params
      params.require(:create_subscription_tea).permit(:tea_id, :subscription_id)
    end
end
