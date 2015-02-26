FactoryGirl.define do
  factory :card do
    original_text "House"
    translated_text "Дом"
    review_date Time.now
  end
end
