class Ref < ActiveRecord::Base

  belongs_to :game

  has_many :violations
end
