class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :team_members
      t.text :notes
      t.integer :idea_id
      t.boolean :completed

      t.timestamps
    end
  end
end
