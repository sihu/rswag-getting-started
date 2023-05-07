# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'blogs/edit' do
  let(:blog) do
    Blog.create!(
      title: 'MyString',
      text: 'MyText'
    )
  end

  before do
    assign(:blog, blog)
  end

  it 'renders the edit blog form' do
    render

    assert_select 'form[action=?][method=?]', blog_path(blog), 'post' do
      assert_select 'input[name=?]', 'blog[title]'

      assert_select 'textarea[name=?]', 'blog[text]'
    end
  end
end
