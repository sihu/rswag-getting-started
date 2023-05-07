# frozen_string_literal: true

class Blog < ApplicationRecord
  validates :title, :text, presence: true
end
