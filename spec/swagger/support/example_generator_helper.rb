
module ExampleGeneratorHelper
  def self.init(config)
    config.after(:each, operation: true) do |example|
      content = example.metadata[:response][:content] || {}
      if response&.body&.present?
        example_spec = {
          'application/json' => {
            examples: {
              example.metadata[:example_group][:description] => {
                value: JSON.parse(response.body, symbolize_names: true)
              }
            }
          }
        }
        example.metadata[:response][:content] = content.deep_merge(example_spec)
      end
    end

    config.after(:each, operation: true, use_as_request_example: true) do |spec|
      spec.metadata[:operation][:request_examples] ||= []

      example = {
        value: JSON.parse(request.body.string, symbolize_names: true),
        name: 'request_example_1',
        summary: 'A request example'
      }

      spec.metadata[:operation][:request_examples] << example
    end
  end
end
