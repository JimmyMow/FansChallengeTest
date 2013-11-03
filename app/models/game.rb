class Game < ActiveRecord::Base
  has_many :violations
  has_many :refs
  has_many :fouls
  has_many :teams
end
