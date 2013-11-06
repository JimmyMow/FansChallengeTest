class Player < ActiveRecord::Base

  belongs_to :team
  # def self.away_team
  #   return Team.find_by_player_id(self.id)
  # end

  has_many :violations
  has_many :fouls

end
