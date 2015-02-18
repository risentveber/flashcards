class Card < ActiveRecord::Base
  validates :original_text,   presence: true
  validates :translated_text, presence: true
  validates :review_date, presence: true
  validate :different_words

  def different_words
    errors.add(:original_text, "Тексты совпадают") if 
    UnicodeUtils.downcase(self.original_text) == UnicodeUtils.downcase(self.translated_text)  
  end
end
