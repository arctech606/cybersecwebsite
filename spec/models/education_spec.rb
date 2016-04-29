#require 'spec_helper'

RSpec.describe EducationsController, :type => :controller do

  

  describe 'NEW/UPDATE EDUCATION' do
   
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
  end
  
  describe 'HOMEPAGE' do
    it 'render HOMEPAGE' do
      get :index
      expect(response).to render_template('index')
    end
  end
  
  describe 'CREATE/DELETE' do
    it 'DELETE' do
        
      e1 = double('Education', :courses_offered => "S", :course_number => "CSCE30", :semester_offered => "FALL 2015" , :course_category => "Cybersec",:id =>'3' )
      allow(Education).to receive(:find).with('3').and_return(e1)
      expect(e1).to receive(:destroy)
      delete :destroy, {:id => '3'}
    end
    it 'CREATE' do
      expect{
        post :create, education: FactoryGirl.attributes_for(:education)
      }.to change(Education,:count).by(1)
    end
    
  end
 

end
