class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description, :null => false
      t.timestamp :due_date

      t.timestamps
    end
  end
end
