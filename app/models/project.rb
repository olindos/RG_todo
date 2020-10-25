class Project < ApplicationRecord
  has_many :tasks, dependent: :delete_all
  belongs_to :user
  validates :name, presence: :true, uniqueness: { scope: :user_id , length: { maximum: 50 } }

  def percent_complete
    return 0 if total_tasks == 0
    ( 100 * completed_tasks.to_f / total_tasks ).round
  end

  def completed_tasks
    @completed_tasks ||= tasks.completed.count
  end

  def total_tasks
    @total_tasks ||= tasks.count
  end

  def progress
    case percent_complete.to_i
    when 0
      'Not started'
    when 100
      'Complete'
    else
      'In progress'
    end
  end

  def badge_color
    case percent_complete.to_i
    when 0
      'dark'
    when 100
      'info'
    else
      'primary'
    end
  end
end
