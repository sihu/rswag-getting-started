# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'blogs/new' do
  before do
    assign(:blog, Blog.new(
                    title: 'MyString',
                    text: 'MyText'
                  ))
  end

  it 'renders new blog form' do
    render

    assert_select 'form[action=?][method=?]', blogs_path, 'post' do
      assert_select 'input[name=?]', 'blog[title]'

      assert_select 'textarea[name=?]', 'blog[text]'
    end
  end
end
