class Team < ActiveRecord::Base

  has_many :games
  # def self.game
  #   Game.find_by_team_id(self.id)
  # end

  has_many :players
end
