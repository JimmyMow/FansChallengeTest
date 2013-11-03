class Call < ActiveRecord::Base
  #BELONGS TO
  belongs_to :game

  #HAS MANY
  has_many :comments


end
