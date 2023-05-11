# frozen_string_literal: true

class Blog < ApplicationRecord
  TITLE_MAX_LENGTH = 100
  validates :title, presence: true, length: { maximum: TITLE_MAX_LENGTH }
  validates :text, presence: true
end
