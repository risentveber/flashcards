class CardsController < ApplicationController
  before_action :find_card, only: [:edit, :show, :update, :destroy]

  def check_new
    @card = Card.get_random
    @card.translated_text = nil if @card
  end

  def check
    @card = Card.find(params[:card][:id])
    if (@card.check params[:card][:translated_text])
      flash[:success] = "Успех"
      @card.review_date = Time.now + 3.days
      @card.save
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

end
