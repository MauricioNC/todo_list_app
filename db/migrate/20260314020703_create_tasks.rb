class CreateTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :tasks, id: :uuid do |t|
      t.string :title, null: false
      t.text :details, null: true

      t.timestamps
    end
  end
end
