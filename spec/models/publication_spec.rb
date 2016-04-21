require 'spec_helper'

describe Publication do
  describe 'Publication Model Test' do
    context "Happy path: Non-empty event" do
      before(:each) do
        @e1 = FactoryGirl.create(:publication, name: "S",abstract: "helfp", keywords: "hall")
        @e1.save
        @e2 = FactoryGirl.create(:publication, name: "W", abstract: "lol1", keywords: "uu")
        @e3 = FactoryGirl.create(:publication, name:  "R",abstract: "lol2", keywords: "dd")
       # @e4 = FactoryGirl.create(:event, name:  "R", desc: nil, date: "12-23-43", venue: "Bryan")
      end

      it 'with abstract field non-empty' do 
        expect(@e1.abstract).not_to be_nil
        expect(@e2.abstract).not_to be_nil
        expect(@e3.abstract).not_to be_nil
        
      end
      
      it 'with name field non-empty' do 
        expect(@e1.name).to eq("S")
        expect(@e2.name).to eq("W")
        expect(@e3.name).to  eq("R")
      end
      
     
    
      it 'should not consider incomplete entry' do
         #expect(@e4.desc).to be_nil
      end
      
    end
    
  end

end

#require 'spec_helper'

RSpec.describe PublicationsController, :type => :controller do

    describe 'NEW/UPDATE EVENT' do
   
    it 'should call update_attributes and redirect' do
        
      @publication = FactoryGirl.create(:publication)
      put :update, id: @publication, 
        publication: FactoryGirl.attributes_for(:publication, name: "Larry")
      @publication.reload
      @publication.name.should eq("Larry")
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
        
       e2=FactoryGirl.create(:publication,:name => "US23", :abstract => "CSCE", :keywords => "12345", :id =>'3' )
      allow(Publication).to receive(:find).with('3').and_return(e2)
      expect(e2).to receive(:destroy)
  
      delete :destroy, :id => e2.id
    end
    it 'CREATE' do
      expect{
        post :create, publication: FactoryGirl.attributes_for(:publication)
      }.to change(Publication,:count).by(1)
    end
    
  end



end



