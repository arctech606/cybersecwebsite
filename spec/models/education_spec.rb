# #require 'spec_helper'

# RSpec.describe EducationsController, :type => :controller do

  

#   describe 'NEW/UPDATE EDUCATION' do
   
#     it 'should call update_attributes and redirect' do
        
#       #@e1 = double('Education', :courses_offered => "S", :course_number => "CSCE30", :semester_offered => "FALL 2015" , :course_category => "Cybersec",:id =>'9')
#       #allow(Education).to receive(:find).with('9').and_return(@e1)
#       #expect(@e1).to receive(:update_attributes!).and_return(true)
#       #put :update, {:id => '9', :education => @e1}
#       #expect(response).to redirect_to(educations_url(@e1))
#       @e1 = FactoryGirl.create(:education)
#       put :update, id: @e1, 
#       education: FactoryGirl.attributes_for(:education, courses_offered: "Larry")
#       @e1.reload
#       @e1.courses_offered.should eq("Larry")
      
#     end
#   end
  
#   describe 'HOMEPAGE' do
#     it 'render HOMEPAGE' do
#       get :index
#       expect(response).to render_template('index')
#     end
#   end
  
 
#   describe 'DELETE' do
#     before :each do
#       @f2 = FactoryGirl.create(:education, :courses_offered => "S", :course_number => "CSCE30", :semester_offered => "FALL 2015" , :course_category => "Cybersec",:id =>'3' )
#     end
  
#     it "deletes the education" do
#       expect{
#         delete :destroy, id: @f2      
#       }.to change(Education,:count).by(-1)
#     end
    
#   end
    
#   describe 'CREATE' do
#     it "creates a new education" do
#       expect{
#         post :create, education: FactoryGirl.attributes_for(:education)
#       }.to change(Education,:count).by(1)
#     end
#   end  
 

# end
#require 'spec_helper'

RSpec.describe EducationsController, :type => :controller do

  

  describe 'NEW/UPDATE EDUCATION' do
    it "education should be new" do
      @e1 = FactoryGirl.build(:education)
      Education.stub(:new).and_return(@e1)
      get :new
      assigns(:education).should == @e1
    end
   
    it 'should call update_attributes and redirect' do
        
      #@e1 = double('Education', :courses_offered => "S", :course_number => "CSCE30", :semester_offered => "FALL 2015" , :course_category => "Cybersec",:id =>'9')
      #allow(Education).to receive(:find).with('9').and_return(@e1)
      #expect(@e1).to receive(:update_attributes!).and_return(true)
      #put :update, {:id => '9', :education => @e1}
      #expect(response).to redirect_to(educations_url(@e1))
       @e1 = FactoryGirl.create(:education)
      put :update, id: @e1, 
      education: FactoryGirl.attributes_for(:education, courses_offered: "Larry")
      @e1.reload
      @e1.courses_offered.should eq("Larry")
      
      
    end
    
  
    it "does not save the new contact" do
       @e1 = FactoryGirl.create(:education)
      put :update, id: @e1, 
      education: FactoryGirl.attributes_for(:education, courses_offered: "")
      @e1.reload
      @e1.courses_offered.should eq("SSS")
      
      
    end
   
   
  end
  
  describe 'HOMEPAGE' do
    it 'render HOMEPAGE' do
      get :index
      expect(response).to render_template('index')
    end
  end
  
 
  describe 'DELETE' do
    before :each do
      @f2 = FactoryGirl.create(:education, :courses_offered => "S", :course_number => "CSCE30", :semester_offered => "FALL 2015" , :course_category => "Cybersec",:id =>'3' )
    end
  
    it "deletes the education" do
      expect{
        delete :destroy, id: @f2      
      }.to change(Education,:count).by(-1)
    end
    
  end
    
  describe 'CREATE' do
    it "creates a new education" do
      expect{
        post :create, education: FactoryGirl.attributes_for(:education)
      }.to change(Education,:count).by(1)
    end
    it "does not creates a new education" do
      expect{
        post :create, education: FactoryGirl.attributes_for(:education, courses_offered: "")
      }.to change(Education,:count).by(0)
    end
  end  
 

end
