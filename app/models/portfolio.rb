# frozen_string_literal: true

class Portfolio < ApplicationRecord
  validates :title, :body, :main_image, :thumb_image, presence: true
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }
  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= 'https://via.placeholder.com/600x300'
    self.thumb_image ||= 'https://via.placeholder.com/150x75'
  end
end
