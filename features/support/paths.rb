# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^my|the homepage$/
      students_path
      
    when /^the login page as a student$/
      student_login_path
      
      
    when /^the "(.*)" page/
      if $1 =='Students'
        students_path
      end
      
      if $1== 'Publications'
        publications_path
      end
    when /^the faculty signup page/
      new_faculty_path
    when /^the student signup page/
      new_student_path
    when /^the faculty profile page/
      faculty_path(Faculty.find_by_name('Sagar'))
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
