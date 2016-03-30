Given "I am on the homepage of cyber security center" do
    visit root_path
end

When "I click research page button" do
    #assert page.current_path == publications_path
    visit publications_path
end

Then "I should see $arg1 publications"  do |arg1|
    page.all('#publications tr').count.should == arg1
    #188 == arg1
    #assert rows == Publication.all.count()
    #assert rows == 189
    #assert page.current_path == publications_path
    #assert rows == Publication.all.count()
    #assert arg1 == 188
    
    #page.should have_select("table tr.number_of_publication", :count => number_of_publication.to_i)
    #assert all("table#publications tr").count == number_of_publication
end    
