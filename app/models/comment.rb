class Comment < ActiveRecord::Base
  belongs_to :violation
  belongs_to :user
  belongs_to :foul

end
