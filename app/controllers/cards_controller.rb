class CardsController < ApplicationController
  before_action :find_card, only: [:edit, :show, :update, :destroy, :review]

  def review
    if @card.check_translation(translated_text)
      flash[:success] = "Успех"
    else
      flash[:warning] = "Ошибка"
    end
    redirect_to root_path
  end

  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to cards_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @card.update_attributes(card_params)
      redirect_to @card
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @card.destroy
    redirect_to cards_path
  end

  private
    def find_card
      @card = Card.find(params[:id])
    end

    def card_params
      params.require(:card).permit(:original_text, :translated_text)
    end

    def translated_text
      params.require(:card).permit(:translated_text)[:translated_text]
    end

end
