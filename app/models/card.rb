class Card < ActiveRecord::Base
  before_validation :set_date
  before_validation :remove_whitespaces

  scope :for_review, -> { where("review_date <= ?", Time.now).order("RANDOM()") }

  validates :original_text, :translated_text, :review_date,
    presence: {message: "Не может быть пустым"}
  validate :texts_are_different

  def texts_are_different
    if UnicodeUtils.downcase(self.original_text.to_s) == UnicodeUtils.downcase(self.translated_text.to_s)
      errors.add(:original_text, "Тексты совпадают")
    end
  end

  def check_translation(text)
    text = text.to_s.squish
    if UnicodeUtils.downcase(self.translated_text.to_s) == UnicodeUtils.downcase(text)
      update_attribute :review_date, Time.now + 3.days
      return true
    else
      return false
    end
  end

  private
    def set_date
      self.review_date ||= Time.now + 3.days
    end

    def remove_whitespaces
      self.translated_text = translated_text.to_s.squish
      self.original_text = original_text.to_s.squish
    end

end
