class Ref < ActiveRecord::Base

  has_many :game_refs
  has_many :games, through: :game_refs

  has_many :violations
end
