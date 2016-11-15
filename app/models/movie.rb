class Movie < ActiveRecord::Base
  # director_id: must be present
  validates :director_id, :presence=> true
  # title: must be present; must be unique in combination with year
  validates :title, :presence=> true, :uniqueness => {:scope =>[:year, :duration]}
  # year: must be integer between 1870 and 2050
validates :year, :numericality=> {only_integer: true, :grater_than_or_equal_to =>1870 ,:less_than_or_equal_to => 2015}
  # duration: must be integer between 0 and 2764800
validates :year, :numericality=> {only_integer: true, :grater_than_or_equal_to =>0 ,:less_than_or_equal_to => 2764800}
  # description: no rules

  # image_url: no rules

  belongs_to(:director, :class_name => "Director", :foreign_key => "director_id")
  has_many(:characters, :class_name=>"Character", :foreign_key=>"movie_id")
end
