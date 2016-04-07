FactoryGirl.define do
  factory :faculty do
    name "Sagar"
    dept "CSCE"
    desc "help"
    office "CSCE"
    phone_no "1234"
    email "ss@ss.com"
    password "new12345"
  end 
end

FactoryGirl.define do
  factory :student do
    name "Sagar"
    dept "CSCE"
    desc "help"
  end 
end

FactoryGirl.define do
    factory :publication do
        name "SSS"
        abstract "key"
        keywords "key"
   end 
end

FactoryGirl.define do
    factory :Event do
        name "SSS"
        date "1234"
        desc "sdsd"
        venue "asas"
   end 
end

