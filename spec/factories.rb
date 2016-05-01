FactoryGirl.define do
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
  factory :resume do
    name "MyString"
    attachment "MyString"
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
        publication_type "Books and Chapters"
        cdtopics {[]}
        focusareas {[]}
  end 
  factory :cdtopic do
    name "Security Mechanisms/Functionality"
    publications {[]}
  end
  factory :focusarea do
    name "Critical Infrastructure Protection"
    publications {[]}
  end
  factory :event do
        name "SSS"
        date "1234"
        desc "sdsd"
        venue "asas"
  end 
  factory :education do
        courses_offered "SSS"
        course_number "1234"
        semester_offered "sdsd"
        course_category "asas"
   end 
   factory :project do
        name "SSS"
        sponsor "spsr"
        desc "abcd"
   end 
   factory :research_interest do
        name "SSS"
        
   end 
end
