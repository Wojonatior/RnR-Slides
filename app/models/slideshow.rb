class Slideshow < ApplicationRecord
  has_many :slides, dependent: :destroy

  validates_presence_of :title
end
