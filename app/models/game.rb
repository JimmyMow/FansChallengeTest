class Game < ActiveRecord::Base
  has_many :violations
  has_many :game_refs
  has_many :refs, through: :game_refs
  has_many :fouls

  belongs_to :away_team, :class_name => 'Team', :foreign_key => :away_team_id
  belongs_to :home_team, :class_name => 'Team', :foreign_key => :home_team_id

  # def self.away_team
  #   Team.find_by_id(self.away_team_id)
  # end

  # def self.home_team
  #   Team.find_by_id(self.home_team_id)
  # end
end
