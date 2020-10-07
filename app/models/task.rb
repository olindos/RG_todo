class Task < ApplicationRecord
  belongs_to :project
  validates :name, presence: :true, uniqueness: { scope: :project_id, length: { maximum: 150 } }
end
