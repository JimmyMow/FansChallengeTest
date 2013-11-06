class Foul < ActiveRecord::Base
  belongs_to :game
  belongs_to :commit_player, :class_name => 'Player', :foreign_key => :commit_player_id
  belongs_to :fouled_player, :class_name => 'Player', :foreign_key => :fouled_player_id
  belongs_to :ref
  belongs_to :user

  has_many :comments
end
