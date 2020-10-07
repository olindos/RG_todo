class Project < ApplicationRecord
  has_many :tasks, dependent: :delete_all
  belongs_to :user
  validates :name, presence: :true, uniqueness: { scope: :user_id , length: { maximum: 50 } }
end
