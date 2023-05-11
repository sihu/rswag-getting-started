# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'blogs/index' do
  before do
    assign(:blogs, [
             Blog.create!(
               title: 'Title',
               text: 'MyText'
             ),
             Blog.create!(
               title: 'Title',
               text: 'MyText'
             )
           ])
  end

  it 'renders a list of blogs' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
  end
end
