class Fortune < ActiveRecord::Base

  # atrybut: body
  validates :body, :presence => true
  # validates_presence_of :body
  validates_length_of :body, :in => 2..256
  # validates_length_of :body, :minimum => 2, :maximum => 128
  validates_uniqueness_of :body, :case_sensitive => false

  # atrybut: source
  validates_length_of :source, :in => 2..128, :allow_blank => true

    has_many :comments, :dependent => :destroy
end