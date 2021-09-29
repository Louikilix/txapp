class ImageElement < ApplicationRecord
  belongs_to :writing_definition
  has_one_attached :image
end
