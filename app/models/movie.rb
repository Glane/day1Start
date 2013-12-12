class Movie < ActiveRecord::Base
  has_many :showtimes
  has_many :roles
  has_many :stars, through: :roles

  validates :title, presence: true

  def rotten_finder
    RottenMovie.find(title: title, limit: 1)
  end

  def audience_rating
  	if rotten_finder == []
  		nil
  	else
  		rotten_finder.ratings.audience_score
  	end
  end
  
  def snippet
    description.to_s.truncate 50
  end
end
