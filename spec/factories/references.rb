FactoryGirl.define do
  factory :reference do
    referee_first_name "Graham"
    referee_last_name "Pengelly"
    referee_email
    referee_email_text "Hello, can I have a reference"
  end

  sequence :referee_email do |n|
    "#{n}test@example.com"
  end

end
