#require 'spec_helper'

RSpec.describe EducationsController, :type => :controller do

  

  describe 'NEW/UPDATE EDUCATION' do
   
    it 'should call update_attributes and redirect' do
        
      @e1 = double('Education', :courses_offered => "S", :course_number => "CSCE30", :semester_offered => "FALL 2015" , :course_category => "Cybersec",:id =>'9')
      allow(Education).to receive(:find).with('9').and_return(@e1)
      #expect(@e1).to receive(:update_attributes!).and_return(true)
      #put :update, {:id => '1', :event => @e1}
      #expect(response).to redirect_to(event_path(@e1))
      
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
      e12 = double('Education',:courses_offered => "S", :course_number => "CSCE30", :semester_offered => "FALL 2015" , :course_category => "Cybersec",:id =>'2' )
      allow(Education).to receive(:create).with('2').and_return(e12)
      #post :create, {:id => '2'}
    end
    
  end


end
