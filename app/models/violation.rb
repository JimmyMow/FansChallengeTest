class Violation < ActiveRecord::Base
  belongs_to :game
  belongs_to :player
  belongs_to :ref
  belongs_to :user

  has_many :comments

end
