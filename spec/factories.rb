FactoryGirl.define do
  factory :resume do
    name "MyString"
    attachment "MyString"
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
<<<<<<< HEAD
  factory :research_interest do
        name "SSS"
  end 
=======
end

FactoryGirl.define do
  factory :resume do
    name "MyString"
    attachment "MyString"
  end
>>>>>>> helper-test
  factory :student do
    name "Sagar"
    dept "CSCE"
    desc "help"
    email "ss@ss.com"
    uin "1234".to_i
    password "new12345"
    password_confirmation "new12345"
  end 
<<<<<<< HEAD
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
=======
end

FactoryGirl.define do
  factory :resume do
    name "MyString"
    attachment "MyString"
  end
    factory :publication do
        name "SSS"
        abstract "key"
        keywords "key"
   end 
end

FactoryGirl.define do
  factory :resume do
    name "MyString"
    attachment "MyString"
  end
    factory :project do
        name "SSS"
        sponsor "spsr"
        desc "abcd"
   end 
end

FactoryGirl.define do
  factory :resume do
    name "MyString"
    attachment "MyString"
  end
    factory :event do
>>>>>>> helper-test
        name "SSS"
        date "1234"
        desc "sdsd"
        venue "asas"
  end 
end
<<<<<<< HEAD
=======

FactoryGirl.define do
  factory :resume do
    name "MyString"
    attachment "MyString"
  end
    factory :education do
        courses_offered "SSS"
        course_number "1234"
        semester_offered "sdsd"
        course_category "asas"
   end 
end


FactoryGirl.define do
  factory :resume do
    name "MyString"
    attachment "MyString"
  end
    factory :research_interest do
        name "SSS"
        
   end 
end
>>>>>>> helper-test
