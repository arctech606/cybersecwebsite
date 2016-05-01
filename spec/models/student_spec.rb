require 'spec_helper'

describe Student do
  describe 'Student Model Test' do
    context "Happy path: Non-empty event" do
      before(:each) do
        @e1 = FactoryGirl.create(:student, name: "S", dept: "CSCE", desc: "CSCE",:email => 'ss@ss.com',:password =>'RGVKIAAG',:password_confirmation => 'RGVKIAAG')
       
      # @e4 = FactoryGirl.create(:student, name:  "R", desc: nil, date: "12-23-43", venue: "Bryan")
      end

      it 'with desc field non-empty' do 
        expect(@e1.desc).not_to be_nil
       
        
      end
      
      it 'with name field non-empty' do 
        expect(@e1.name).to eq("S")
      
      end
      
      it 'with date field non-empty' do 
        expect(@e1.dept).to eq("CSCE")
       
      end
    
      it 'should not consider incomplete entry' do
         #expect(@e4.desc).to be_nil
      end
      
      
      
    end
    
  end

end

#require 'spec_helper'

RSpec.describe StudentsController, :type => :controller do

  

  describe 'NEW/UPDATE EVENT' do
   
    it 'should call update_attributes and redirect' do
        
      @student = FactoryGirl.create(:student, name: "Sagar", dept: "CSCE",:password =>'RGVKIAAG',:password_confirmation => 'RGVKIAAG')
      put :update, id: @student, 
        student: FactoryGirl.attributes_for(:student, name: "Sagar")
      @student.reload
      @student.name.should eq("Sagar")
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
      @f1 = FactoryGirl.create(:student, name: "Larry", dept: "CSCE", desc: "abc", :password =>'RGVKIAAG',:password_confirmation => 'RGVKIAAG')
    end
  
    it "deletes the contact" do
      expect{
        delete :destroy, id: @f1        
      }.to change(Student,:count).by(-1)
    end
    
  end
    
  describe 'CREATE' do
    it "creates a new faculty" do
      expect{
        post :create, student: FactoryGirl.attributes_for(:student)
      }.to change(Student,:count).by(1)
    end
  end  

end



