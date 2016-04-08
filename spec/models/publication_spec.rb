require 'spec_helper'

describe Publication do
  describe 'Publication Model Test' do
    context "Happy path: Non-empty event" do
      before(:each) do
        @e1 = FactoryGirl.create(:event, name: "S",abstract: "helfp", keyword: "hall")
        @e1.save
        @e2 = FactoryGirl.create(:event, name: "W", abstract: "lol1", keyword: "uu")
        @e3 = FactoryGirl.create(:event, name:  "R",abstract: "lol2", keyword: "dd")
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
        expect(@e1.abstract).to eq("helpf")
        expect(@e2.abstract).to eq("lol1")
        expect(@e3.abstract).to  eq("lol2")
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
        
      @e1 = double('Publication', :name => "US", :abstract => "elfp", :keyword => "lll",:id =>'9')
      allow(Event).to receive(:find).with('9').and_return(@e1)
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
        
      e1 = double('Publication', :name => "S", :abstract => "hfp", :keyword => "halll",:id =>'3' )
      allow(Event).to receive(:find).with('3').and_return(e1)
      expect(e1).to receive(:destroy)
      delete :destroy, {:id => '3'}
    end
    it 'CREATE' do
      e12 = double('Publication', :name => "SSS", :abstract => "helfp", :keyword => "hall" ,:id =>'2' )
      allow(Event).to receive(:create).with('2').and_return(e12)
      #post :create, {:id => '2'}
    end
    
  end


end



