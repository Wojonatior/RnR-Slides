class Slide < ApplicationRecord
  belongs_to :slideshow
  has_many :contents, dependent: :destroy
  
  validates_presence_of :title, :slide_type
end
