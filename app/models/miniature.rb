class Miniature < ApplicationRecord
  belongs_to :user
  acts_as_votable
  has_many_attached :pictures

  def picture_urls
    urls= []
    self.pictures.each do |p|
      urls << Rails.application.routes.url_helpers.url_for(p) 
    end
    return urls
  end

  def currentUserVoted
    current_user.voted_for? self
  end

end
