# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe BlogsController, type: :request do
  path '/blogs' do
    before do
      Blog.create(title: 'Blog 1', text: 'Text 1')
      Blog.create(title: 'Blog 2', text: 'Text 2')
    end

    get 'Blogs' do
      security [{ api_key: [] }]
      operationId 'getBlogs'
      tags 'Blog'
      parameter name: :query, in: :query, type: :string, required: false

      description <<~DESC
        This endpoint returns all blogs in json.

        ### A better description

        And even with interpolation: Text length will be maximum #{Blog::TITLE_MAX_LENGTH}
      DESC

      # For long descriptions you could also use a ERB template file:
      # description ERBHelper.erb_to_string('spec/swagger/external-descriptions/sample_description.erb')

      consumes 'application/json'
      produces 'application/json'

      response '200', 'successful' do
        let(:'X-API-TOKEN') { ENV.fetch('API_TOKEN') }

        context 'when not using a query' do
          let(:query) { 'John Doe' }

          schema type: :array,
                 items: { '$ref' => '#/components/schemas/blog_item' }
          run_test! do |_response|
            # test something specific
          end
        end

        context 'using a query' do
          let(:query) { 'John Doe' }

          schema type: :array,
                 items: { '$ref' => '#/components/schemas/blog_item' }
          run_test! do |_response|
            # test something specific
          end
        end
      end

      it_behaves_like 'an api-token protected resource'
    end
  end
end
