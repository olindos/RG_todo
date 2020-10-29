# frozen_string_literal: true

class ExampleReflex < ApplicationReflex

  def mark_complete
    task = Task.find(element.dataset.id)
    task.update( status: true, completed_at: Time.now )
  end

  def mark_incomplete
    task = Task.find(element.dataset.id)
    task.update( status: false, completed_at: nil )
  end

end
