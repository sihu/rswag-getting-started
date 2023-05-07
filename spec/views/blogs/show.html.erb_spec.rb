# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'blogs/show' do
  before do
    assign(:blog, Blog.create!(
                    title: 'Title',
                    text: 'MyText'
                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
