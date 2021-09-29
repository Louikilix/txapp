class WritingDefinition < ApplicationRecord
  belongs_to :user
  validates :definition, presence: true

  has_many :image_elements, dependent: :destroy
end
