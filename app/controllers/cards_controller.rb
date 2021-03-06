class CardsController < ApplicationController
  before_action :find_card, only: [:edit, :show, :update, :destroy]

  def index
    @cards = current_user.cards
  end

  def new
    @card = current_user.cards.new
  end

  def create
    @card = current_user.cards.new(card_params)
    if @card.save
      redirect_to @card
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

end
