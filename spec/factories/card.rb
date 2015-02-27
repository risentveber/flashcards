FactoryGirl.define do

  factory :card do
    original_text "House"
    translated_text "Дом"
    user_id 1
    review_date Time.now
  end

end
