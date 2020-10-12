class ChengeDefaultValueStatus < ActiveRecord::Migration[5.2]
  def up
    change_column :tasks, :status, :boolean, default: false
  end

  def down
    change_column :tasks, :status, :boolean, default: nil
  end
end
