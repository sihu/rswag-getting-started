# frozen_string_literal: true

RSpec.shared_examples 'an api-token protected resource' do
  response '401', 'Unauthenticated' do
    context 'without api key' do
      let(:'X-API-TOKEN') { '' }

      run_test! do |response|
        expect(response.body).to eq({ error: 'Invalid API token' }.to_json)
        expect(response).to have_http_status :unauthorized
      end
    end

    context 'with wrong api key' do
      let(:'X-API-TOKEN') { 'nonsense' }

      run_test! do |response|
        expect(response.body).to eq({ error: 'Invalid API token' }.to_json)
        expect(response).to have_http_status :unauthorized
      end
    end
  end
end
