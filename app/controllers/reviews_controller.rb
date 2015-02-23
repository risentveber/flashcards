class ReviewsController < ApplicationController
  def new
    @card = Card.for_review.first
  end

  def create
    @card = Card.find(card_id)
    if @card.check_translation(translation)
      flash[:success] = "Успех"
    else
      flash[:warning] = "Ошибка"
    end
    redirect_to root_path
  end

  private
    def translation
      params.permit(:translation)[:translation]
    end
    def card_id
      params.permit(:card_id)[:card_id]
    end
end
