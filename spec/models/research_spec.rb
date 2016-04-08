require 'spec_helper'

describe ResearchInterest do
  describe 'Resarch Model Test' do
    context "Happy path: Non-empty researchInterest" do
      before(:each) do
        @e1 = FactoryGirl.create(:research, name: "S",sponsor: "helfp", keyword: "hall")
        @e1.save
        @e2 = FactoryGirl.create(:research, name: "W", sponsor: "lol1", keyword: "uu")
        @e3 = FactoryGirl.create(:research, name:  "R",sponsor: "lol2", keyword: "dd")
       # @e4 = FactoryGirl.create(:research, name:  "R", desc: nil, date: "12-23-43", venue: "Bryan")
      end

      it 'with desc field non-empty' do 
        expect(@e1).not_to be_nil
        expect(@e2).not_to be_nil
        expect(@e3).not_to be_nil
        
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

# RSpec.describe ResearchInterestController, :type => :controller do

  

#   describe 'NEW/UPDATE RESEArchInterest' do
   
#     it 'should call update_attributes and redirect' do
        
#       @e1 = double('ResearchInterest', :name => "US",:id =>'9')
#       allow(ResearchInterest).to receive(:find).with('9').and_return(@e1)
#       #expect(@e1).to receive(:update_attributes!).and_return(true)
#       #put :update, {:id => '1', :research => @e1}
#       #expect(response).to redirect_to(researchInterest_path(@e1))
#     end
#   end
  
#   describe 'HOMEPAGE' do
#     it 'render HOMEPAGE' do
#       get :index
#       expect(response).to render_template('index')
#     end
#   end
  
#   describe 'CREATE/DELETE' do
#     it 'DELETE' do
        
#       e1 = double('ResearchInterest', :id =>'3' )
#       allow(ResearchInterest).to receive(:find).with('3').and_return(e1)
#       expect(e1).to receive(:destroy)
#       delete :destroy, {:id => '3'}
#     end
#     it 'CREATE' do
#       e12 = double('ResearchInterest', :name => "SSS" ,:id =>'2' )
#       allow(ResearchInterest).to receive(:create).with('2').and_return(e12)
#       #post :create, {:id => '2'}
#     end
    
#   end


# end



