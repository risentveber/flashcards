class ReviewsController < ApplicationController
  def new
    @card = Card.for_review.first
  end

  def create
    @card = Card.find(params[:id])
    if @card.check_translation(translated_text)
      flash[:success] = "Успех"
    else
      flash[:warning] = "Ошибка"
    end
    redirect_to root_path
  end

  private
    def translated_text
      params.require(:card).permit(:translated_text)[:translated_text]
    end
end
