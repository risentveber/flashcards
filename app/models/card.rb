class Card < ActiveRecord::Base
  before_validation :set_date

  validates :original_text, :translated_text, :review_date,
    presence: {message: "Не может быть пустым"}
  validate :texts_is_different

  def texts_is_different
    if UnicodeUtils.downcase(self.original_text) == UnicodeUtils.downcase(self.translated_text)
      errors.add(:original_text, "Тексты совпадают") 
    end  
  end

  def check(text)
    UnicodeUtils.downcase(self.translated_text) == UnicodeUtils.downcase(text) 
  end

  def self.get_random
    self.where("review_date <= ?", Time.now).order("RANDOM()").first
  end

  private
    def set_date
      self.review_date ||= Time.now + 3.days
    end

end
