# frozen_string_literal: true

json.extract! blog, :id, :title, :text, :created_at, :updated_at
json.url blog_url(blog, format: :json)
