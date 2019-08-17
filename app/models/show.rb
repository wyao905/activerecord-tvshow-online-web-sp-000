class Show < ActiveRecord::Base
  def self.highest_rating
    self.maximum(:rating)
  end
  
  def self.lowest_rating
    self.minimum(:rating)
  end
  
  def self.most_popular_show
    self.where("rating = ?", self.highest_rating).first
  end
  
  def self.least_popular_show
    self.where("rating = ?", self.lowest_rating).first
  end
  
  def ratings_sum
    self.sum(:rating)
  end
  
  def popular_shows
    self.where("rating > ?", 5)
  end
  
  def shows_by_alphabetical_order
    self.order(:title)
end