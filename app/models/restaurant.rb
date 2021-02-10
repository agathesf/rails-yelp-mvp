class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  @allowed_category = ['chinese', 'italian', 'japanese', 'french', 'belgian']

  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true, inclusion: { in: @allowed_category }

end
