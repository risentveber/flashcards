class Card < ActiveRecord::Base
  before_validation :set_date

  scope :for_review, -> { where("review_date <= ?", Time.now).order("RANDOM()") }

  validates :original_text, :translated_text, :review_date,
    presence: {message: "Не может быть пустым"}
  validate :texts_is_different

  def texts_is_different
    if UnicodeUtils.downcase(self.original_text.to_s) == UnicodeUtils.downcase(self.translated_text.to_s)
      errors.add(:original_text, "Тексты совпадают")
    end
  end

  def check_translation(text)
    if UnicodeUtils.downcase(self.translated_text.to_s) == UnicodeUtils.downcase(text.to_s)
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

end
