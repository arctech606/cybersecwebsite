require 'spec_helper'

describe Faculty do
  describe 'Faculty Model Test' do
    context "Happy path: Non-empty faculty faculty" do
      before(:each) do
        @fac1 = FactoryGirl.create(:faculty, name: "S", desc: "help", office: "CSCE", phone_no: "1234",email: "ss@ss.com", password: "new1234")
        @fac1.save
        @fac2 = FactoryGirl.create(:faculty, name: "W", desc: "help", office: "CSCE", phone_no: "1234",email: "ss@ss2.com", password: "new1234")
        @fac3 = FactoryGirl.create(:faculty, name:  "R", desc: "h22elp", office: "CSCE", phone_no: "1234",email: "ss@ss1.com", password: "new1234")
      end

      it 'with desc field non-empty' do 
        expect(@fac1.desc).not_to be_nil
        expect(@fac2.desc).not_to be_nil
        expect(@fac3.desc).not_to be_nil
        expect
      end
      
      it 'with name field non-empty' do 
        expect(@fac1.name).to eq("S")
        expect(@fac2.name).to eq("W")
        expect(@fac3.name).to  eq("R")
      end
      
      it 'with email field non-empty' do 
        expect(@fac1.email).to eq("ss@ss.com")
        expect(@fac2.email).to eq("ss@ss2.com")
        expect(@fac3.email).to  eq("ss@ss1.com")
      end
    
      it 'should not consider incomplete entry' do
         expect(@fac4).to be_nil
      end
      
      it 'checks for correct common entry for phonenumber and department listing' do
         
        Movie.all.each do |m|
            m.office.should eq("CSCE")
            m.office.should_not eq("ECEN")
        end
        Movie.all.each do |m|
            m.phone.should_not eq("123456")
            m.director.should eq("1234")
        end
        
      end
      
    end
    
  end

end

#require 'spec_helper'

RSpec.describe FacultiesController, :type => :controller do

  

  describe 'NEW/UPDATE FACULTY' do
   
    it 'should call update_attributes and redirect' do
      @fac1 = FactoryGirl.create(:faculty, name: "S", desc: "help", office: "CSCE", phone_no: "1232324",email: "ss@ss.com", id: "1", password: "new1234")
      allow(Faculty).to receive(:find).with('1').and_return(@fac1)
      expect(@fac1).to receive(:update_attributes!).and_return(true)
      put :update, {:id => '1', :faculty => @fac1}
      expect(response).to redirect_to(edit_faculty(@fac1))
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
      fac2 = FactoryGirl.create(:faculty, name: "W", desc: "help", office: "CSCE", phone_no: "1234",email: "ss@ss2.com", id: "3", password: "new1234")
      allow(Faculty).to receive(:find).with('3').and_return(fac2)
      expect(fac2).to receive(:destroy)
      delete :destroy, {:id => '3'}
    end
    it 'CREATE' do
      fac1 = FactoryGirl.create(:faculty, name: "S", desc: "help", office: "CSCE", phone_no: "1234",email: "ss@ss.com", id: "2", password: "new1234")
      allow(Faculty).to receive(:create).and_return(fac1)
      post :create, {:id => '2'}
    end
    
  end


end



