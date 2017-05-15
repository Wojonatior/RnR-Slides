class Slide < ApplicationRecord
  belongs_to :slideshow, touch: true
  has_many :contents, dependent: :destroy
  
  VALID_TYPES = %w(title content two-column)
  validates_presence_of :title, :slide_type
  validates_inclusion_of :slide_type, :in => VALID_TYPES
end
