require 'rails_helper'

feature "Homepage" do
  context "homepage has some buttons" do

    before :all do
      create :user
      create :card
    end

    before :each do
      visit login_path
      fill_in :email, with: "boris@gmail.com"
      fill_in :password, with: "secret"
      click_button "Войти"
      visit root_path
    end

    it 'should authorize' do
      expect(page).to have_content "Профиль"
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

  end

end
