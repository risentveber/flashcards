class StaticPagesController < ApplicationController
  def review
    @card = Card.for_review.first
  end
  
end
