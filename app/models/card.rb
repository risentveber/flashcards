class Card < ActiveRecord::Base
  after_initialize :set_date

  validates :original_text, :translated_text, :review_date, presence: true
  validate :texts_is_different

  def texts_is_different
    if UnicodeUtils.downcase(self.original_text) == UnicodeUtils.downcase(self.translated_text)
      errors.add(:original_text, "Тексты совпадают") 
    end  
  end

  private
    def set_date
      if self.new_record?
        self.review_date = Time.now + 3.days
      end
    end

end
