class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(article_params)
    @card.save
    redirect_to cards_path
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update

  end

  def show
    
  end
  private
    def article_params
      params.require(:card).permit(
      :original_text, :translated_text)
    end
end
