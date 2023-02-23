require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/subscriptions', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # CustomerSubscription. As you add validations to CustomerSubscription, be sure to
  # adjust the attributes here as well.

  let(:invalid_attributes) do
    { title: 2334,
      price: 'hello',
      status: "f",
      frequency: 'twice' }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # CustomerSubscriptionsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    { 'CONTENT_TYPE' => 'application/json' }
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      it "can't update anything other than status" do
        customer = create(:customer)
        customer2 = create(:customer)
        subscription = create(:subscription, customer: customer, status: 0)
        expect(subscription.status).to eq('inactive')
        initial_values = { title: subscription.title, frequency: subscription.frequency }
        patch api_v1_subscription_url(subscription),
              params: { id: subscription.id, customer_id: customer2.id, title: 'let me in', price: 100000, frequency: (subscription.frequency + 1), status: 1 }, headers: valid_headers, as: :json
        subscription.reload
        expect(subscription.status).to eq('active')

        expect(subscription.customer_id).to eq(customer.id)
        expect(subscription.title).to eq(initial_values[:title])
        expect(subscription.frequency).to eq(initial_values[:frequency])

        expect(subscription.customer_id).not_to eq(customer2.id)
        expect(subscription.title).not_to eq('let me in')
        expect(subscription.price).not_to eq(100000)
      end

      context 'subscribing' do
        it 'updates the requested subscription' do
          customer = create(:customer)
          subscription = create(:subscription, customer: customer, status: 0)
          expect(subscription.status).to eq('inactive')
          patch api_v1_subscription_url(subscription),
                params: { id: subscription.id, status: 1 }, headers: valid_headers, as: :json
          subscription.reload
          expect(subscription.status).to eq('active')
        end

        it 'renders a JSON response with the subscription' do
          customer = create(:customer)
          subscription = create(:subscription, customer: customer, status: 0)
          patch api_v1_subscription_url(subscription),
                params: { id: subscription.id, status: 1 }, headers: valid_headers, as: :json
          expect(response).to have_http_status(:ok)
          expect(response.content_type).to match(a_string_including('application/json'))
        end
      end

      context 'unsubscribing' do
        it 'updates the requested subscription' do
          customer = create(:customer)
          subscription = create(:subscription, customer: customer, status: 1)
          expect(subscription.status).to eq('active')
          patch api_v1_subscription_url(subscription),
                params: { id: subscription.id, status: 0 }, headers: valid_headers, as: :json
          subscription.reload
          expect(subscription.status).to eq('inactive')
        end

        it 'renders a JSON response with the subscription' do
          customer = create(:customer)
          subscription = create(:subscription, customer: customer, status: 1)
          patch api_v1_subscription_url(subscription),
                params: { id: subscription.id, status: 0 }, headers: valid_headers, as: :json
          expect(response).to have_http_status(:ok)
          expect(response.content_type).to match(a_string_including('application/json'))
        end
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the subscription' do
        customer = create(:customer)
        subscription = create(:subscription, customer: customer)
        patch api_v1_subscription_url(subscription),
              params: { subscription: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'without id in url' do
      it 'updates the requested subscription with valid params' do
        customer = create(:customer)
        subscription = create(:subscription, customer: customer, status: 0)
        expect(subscription.status).to eq('inactive')
        patch api_v1_subscriptions_url,
              params: { id: subscription.id, status: 1 }, headers: valid_headers, as: :json
        subscription.reload
        expect(subscription.status).to eq('active')
      end

      it 'renders a 404 if sub with id isnt found' do
        customer = create(:customer)
        subscription = create(:subscription, customer: customer, status: 0)
        expect(subscription.status).to eq('inactive')
        patch api_v1_subscriptions_url,
              params: { id: subscription.id + 1, status: 1 }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:not_found)
        expect(response.content_type).to match(a_string_including('application/json'))
        body = JSON.parse(response.body, symbolize_names: true)
        expect(body).to be_a Hash
        expect(body.keys).to eq([:error])
        expect(body[:error]).to be_a Array
        expect(body[:error][0].keys).to eq(%i[status message code])
        expect(body[:error][0][:status]).to eq('NOT FOUND')
        expect(body[:error][0][:message]).to eq('Object with matching id not found')
        expect(body[:error][0][:code]).to eq(404)
      end

      it 'renders a 400 if no id is passed in' do
        customer = create(:customer)
        subscription = create(:subscription, customer: customer, status: 0)
        expect(subscription.status).to eq('inactive')
        patch api_v1_subscriptions_url,
              params: { status: 1 }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:bad_request)
        expect(response.content_type).to match(a_string_including('application/json'))
        body = JSON.parse(response.body, symbolize_names: true)
        expect(body).to be_a Hash
        expect(body.keys).to eq([:error])
        expect(body[:error]).to be_a Array
        expect(body[:error][0].keys).to eq(%i[status message code])
        expect(body[:error][0][:status]).to eq('BAD REQUEST')
        expect(body[:error][0][:message]).to eq('Missing or invalid item paramters')
        expect(body[:error][0][:code]).to eq(400)
      end

      it 'renders a JSON response with errors for the subscription if invalid params' do
        customer = create(:customer)
        subscription = create(:subscription, customer: customer)
        patch api_v1_subscriptions_url,
              params: { subscription: invalid_attributes, id: subscription.id }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:bad_request)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end
end
