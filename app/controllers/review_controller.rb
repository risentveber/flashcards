class ReviewController < ApplicationController
  skip_before_action :require_login, only: :new

  def new
    if current_user
      @card = Card.for_review.first
    else
      redirect_to '/home'
    end
  end

  def create
    @card = Card.find(review_params[:card_id])
    if @card.check_translation(review_params[:translation])
      flash[:success] = "Успех"
    else
      flash[:warning] = "Ошибка"
    end
    redirect_to root_path
  end

  private
    def review_params
      params.permit(:translation, :card_id)
    end
end
