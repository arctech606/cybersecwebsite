require 'spec_helper'

describe Faculty do
  describe 'Faculty Model Test' do
    context "Happy path: Non-empty event" do
      before(:each) do
        @e1 = FactoryGirl.create(:faculty, name: "S", dept: "CSCE", desc: "CSCE", phone_no: "12345", office: "abcd",:password =>'RGVKIAAG',:password_confirmation => 'RGVKIAAG')
       
       # @e4 = FactoryGirl.create(:faculty, name:  "R", desc: nil, date: "12-23-43", venue: "Bryan")
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

RSpec.describe FacultiesController, :type => :controller do

  

  describe 'NEW/UPDATE EVENT' do
   
    it 'should call update_attributes and redirect' do
        
      @faculty = FactoryGirl.create(:faculty, name: "Larry", dept: "CSCE", desc: "CSCE", phone_no: "12345", office: "abcd",:password =>'RGVKIAAG',:password_confirmation => 'RGVKIAAG')
      put :update, id: @faculty, 
        faculty: FactoryGirl.attributes_for(:faculty, name: "Larry")
      @faculty.reload
      @faculty.name.should eq("Larry")
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
      @f1 = FactoryGirl.create(:faculty, name: "Larry", dept: "CSCE", desc: "CSCE", phone_no: "12345", office: "abcd",:password =>'RGVKIAAG',:password_confirmation => 'RGVKIAAG')
    end
  
    it "deletes the contact" do
      expect{
        delete :destroy, id: @f1        
      }.to change(Faculty,:count).by(-1)
    end
    
  end
    
  describe 'CREATE' do
    it "creates a new faculty" do
      expect{
        post :create, faculty: FactoryGirl.attributes_for(:faculty)
      }.to change(Faculty,:count).by(1)
    end
    
  
  end
    
    
  


end



