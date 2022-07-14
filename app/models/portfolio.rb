# frozen_string_literal: true

class Portfolio < ApplicationRecord
  has_many :technologies, dependent: nil
  accepts_nested_attributes_for :technologies, reject_if: ->(attrs) { attrs['name'].blank? }
  validates :title, :body, presence: true
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }
  scope :by_position, -> {     order('position ASC') }

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader
end
