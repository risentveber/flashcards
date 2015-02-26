require 'rails_helper'

feature "Homepage" do
  context "homepage has some buttons" do

    before :all do
      create :card
    end

    before :each do
      visit root_path
    end

    it "show that answer is wrong" do
      fill_in :translation, with: "что-то там"
      click_button "Проверить"
      expect(page).to have_content "Ошибка"
    end

    it "show that answer is right" do
      fill_in :translation, with: "дом"
      click_button "Проверить"
      expect(page).to have_content "Успех"
    end

    it "has all cards button" do
      expect(page).to have_content "Все карточки"
    end

    it "has new card button" do
      expect(page).to have_content "Добавить карточку"
    end

    it "has new logo button" do
      expect(page).to have_content "Флэшкарточкер"
    end

  end

end
