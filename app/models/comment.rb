class Comment < ActiveRecord::Base
  belongs_to :fortune
  belongs_to :user
  validates :body, :presence => true
  validates_length_of :body, :minimum => 2
end
