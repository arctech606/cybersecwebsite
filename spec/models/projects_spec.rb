require 'spec_helper'

describe Project do
  describe 'Project Model Test' do
    context "Happy path: Non-empty event" do
      before(:each) do
        @e1 = FactoryGirl.create(:project, name: "S",sponsor: "helfp", desc: "hall")
        @e1.save
        @e2 = FactoryGirl.create(:project, name: "W", sponsor: "lol1", desc: "uu")
        @e3 = FactoryGirl.create(:project, name:  "R",sponsor: "lol2", desc: "dd")
      # @e4 = FactoryGirl.create(:event, name:  "R", desc: nil, date: "12-23-43", venue: "Bryan")
      end

      it 'with abstract field non-empty' do 
        expect(@e1.sponsor).not_to be_nil
        expect(@e2.sponsor).not_to be_nil
        expect(@e3.sponsor).not_to be_nil
        
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





