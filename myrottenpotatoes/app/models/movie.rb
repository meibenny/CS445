class Movie < ActiveRecord::Base
  attr_accessible :title, :rating, :desription, :release_date
end
