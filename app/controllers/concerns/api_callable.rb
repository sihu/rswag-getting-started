# frozen_string_literal: true

module ApiCallable
  extend ActiveSupport::Concern

  private

  def ensure_api_token_for_json
    return unless requesting_json?

    render json: { error: 'Invalid API token' }, status: :unauthorized unless api_token_valid?
  end

  def requesting_json?
    request.format.json?
  end

  def api_token_valid?
    @api_token_valid ||= request.headers['X-API-TOKEN'].eql?(ENV.fetch('API_TOKEN'))
  end
end
