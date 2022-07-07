# frozen_string_literal: true

class Skill < ApplicationRecord
  include Placeholder
  validates :title, :percent_utilized, presence: true
  after_initialize :set_defaults

  def set_defaults
    self.badge ||= Placeholder.image_generator(height: 150, width: 150)
  end
end
