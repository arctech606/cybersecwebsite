require 'spec_helper'

describe Event do
  describe 'Event Model Test' do
    context "Happy path: Non-empty event" do
      before(:each) do
        @e1 = FactoryGirl.create(:event, name: "S", desc: "help", date: "12-23-43", venue: "Bryan")
        @e1.save
        @e2 = FactoryGirl.create(:event, name: "W", desc: "help", date: "12-23-43", venue: "Bryan")
        @e3 = FactoryGirl.create(:event, name:  "R", desc: "h22elp", date: "12-23-43", venue: "Bryan")
       # @e4 = FactoryGirl.create(:event, name:  "R", desc: nil, date: "12-23-43", venue: "Bryan")
      end

      it 'with desc field non-empty' do 
        expect(@e1.desc).not_to be_nil
        expect(@e2.desc).not_to be_nil
        expect(@e3.desc).not_to be_nil
        
      end
      
      it 'with name field non-empty' do 
        expect(@e1.name).to eq("S")
        expect(@e2.name).to eq("W")
        expect(@e3.name).to  eq("R")
      end
      
      it 'with date field non-empty' do 
        expect(@e1.date).to eq("12-23-43")
        expect(@e2.date).to eq("12-23-43")
        expect(@e3.date).to  eq("12-23-43")
      end
    
      it 'should not consider incomplete entry' do
         #expect(@e4.desc).to be_nil
      end
      
      
      
    end
    
  end

end

#require 'spec_helper'

RSpec.describe EventsController, :type => :controller do

  

  describe 'NEW/UPDATE EVENT' do
   
    it 'should call update_attributes and redirect' do
     @e1 = FactoryGirl.create(:event, name: "S", desc: "help", date: "12-23-43", venue: "Bryan")
      allow(Event).to receive(:find).with('1').and_return(@e1)
      expect(@e1).to receive(:update_attributes!).and_return(true)
      put :update, {:id => '1', :event => @e1}
      expect(response).to redirect_to(edit_event_path)
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
      e1 = FactoryGirl.create(:event, name: "S", desc: "help", date: "12-23-43", venue: "Bryan")
      allow(Event).to receive(:find).with('3').and_return(e1)
      expect(e1).to receive(:destroy)
      delete :destroy
    end
    it 'CREATE' do
      e12 = FactoryGirl.create(:event, name: "S", desc: "help", date: "12-23-43", venue: "Bryan")
      allow(Event).to receive(:create).and_return(e12)
      post :create
    end
    
  end


end



