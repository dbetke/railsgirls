class Task < ActiveRecord::Base
  belongs_to :idea
  attr_accessible :completed, :idea_id, :name, :notes, :team_members
end
