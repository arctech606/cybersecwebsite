FactoryGirl.define do
  factory :cdtopic do
    name "MyString"
  end
  factory :focusarea do
    name "MyString"
  end
  factory :faculty do
    name "Sagar"
    dept "CSCE"
    desc "help"
    office "CSCE"
    phone_no "1234"
    email "ss@ss.com"
    password "new12345"
    password_confirmation "new12345"
  end 
  factory :research_interest do
        name "SSS"
  end 
  factory :student do
    name "Sagar"
    dept "CSCE"
    desc "help"
    email "ss@ss.com"
    uin "1234".to_i
    password "new12345"
    password_confirmation "new12345"
  end 
  factory :publication do
        name "SSS"
        abstract "key"
        keywords "key"
  end 
  factory :event do
        name "SSS"
        date "1234"
        desc "sdsd"
        venue "asas"
  end 
end
