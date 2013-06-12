class AddRangeToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :range, :integer
  end
end
