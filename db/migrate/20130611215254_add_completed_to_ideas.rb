class AddCompletedToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :completed, :boolean
  end
end
