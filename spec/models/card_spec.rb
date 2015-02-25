require 'rails_helper'

RSpec.describe Card do
  let(:card) { Card.new(original_text: "hause", translated_text: "дом") }
  let(:ecard) { Card.new }

  it "should make correct check translation" do
    expect(card.check_translation("Дим")).to be false
  end

  it "should make correct check translation" do
    expect(card.check_translation("Дом")).to be true
  end

  it "should make correct check translation" do
    expect(card.check_translation("дом")).to be true
  end

  it "should make correct check translation" do
    expect(card.check_translation(nil)).to be false
  end

  it "should make correct check translation" do
    expect(card.check_translation("доМ")).to be true
  end

  it "valid card is valid" do
    expect(card.valid?).to be true
  end

  it "should make correct validation" do
    expect(ecard.valid?).to be false
  end

  it "should make correct validation" do
    ecard.translated_text = "new text"
    expect(ecard.valid?).to be false
  end

end
