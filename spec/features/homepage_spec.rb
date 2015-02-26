require 'rails_helper'

feature "Homepage" do
  context "homepage has some buttons" do

    before :all do
      @card = Card.create original_text: 'Home', translated_text: 'Дом', review_date: Time.now
    end

    after :all do
      @card.destroy!
    end

    it "show that answer is wrong" do
      visit root_path
      fill_in :translation, with: "что-то там"
      click_button "Проверить"
      expect(page).to have_content "Ошибка"
    end

     it "show that answer is right" do
      visit root_path
      fill_in :translation, with: "дом"
      click_button "Проверить"
      expect(page).to have_content "Успех"
    end

    it "has all cards button" do
      visit root_path
      expect(page).to have_content "Все карточки"
    end

    it "has new card button" do
      visit root_path
      expect(page).to have_content "Добавить карточку"
    end

    it "has new logo button" do
      visit root_path
      expect(page).to have_content "Флэшкарточкер"
    end

  end

end
