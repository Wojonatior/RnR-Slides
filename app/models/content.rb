class Content < ApplicationRecord
  belongs_to :slide, touch: true
end
