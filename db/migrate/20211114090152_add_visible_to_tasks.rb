class AddVisibleToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :visible, :boolean, default: :true
  end
end
