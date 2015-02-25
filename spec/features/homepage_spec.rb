require 'rails_helper'

feature "Homepage" do
  context "homepage has some buttons" do

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
