# frozen_string_literal: true

class Portfolio < ApplicationRecord
  include Placeholder
  has_many :technologies, dependent: nil
  accepts_nested_attributes_for :technologies, reject_if: ->(attrs) { attrs['name'].blank? }
  validates :title, :body, :main_image, :thumb_image, presence: true
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }
  scope :by_position, -> {     order('position ASC')  }
  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: 600, width: 300)
    self.thumb_image ||= Placeholder.image_generator(height: 150, width: 75)
  end
end
