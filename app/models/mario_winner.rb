class MarioWinner < ActiveRecord::Base
  belongs_to :winner, :class_name => 'User'
end
