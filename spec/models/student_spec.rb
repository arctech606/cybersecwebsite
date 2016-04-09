# require 'spec_helper'

# describe Student do
#   describe 'Student Model Test' do
#     context "Happy path: Non-empty event" do
#       before(:each) do
#         @e1 = FactoryGirl.create(:student, name: "S", dept: "CSCE", desc: "CSCE",:password =>'RGVKIAAG',:password_confirmation => 'RGVKIAAG')
       
#       # @e4 = FactoryGirl.create(:student, name:  "R", desc: nil, date: "12-23-43", venue: "Bryan")
#       end

#       it 'with desc field non-empty' do 
#         expect(@e1.desc).not_to be_nil
       
        
#       end
      
#       it 'with name field non-empty' do 
#         expect(@e1.name).to eq("S")
      
#       end
      
#       it 'with date field non-empty' do 
#         expect(@e1.dept).to eq("CSCE")
       
#       end
    
#       it 'should not consider incomplete entry' do
#          #expect(@e4.desc).to be_nil
#       end
      
      
      
#     end
    
#   end

# end

# #require 'spec_helper'

# RSpec.describe FacultiesController, :type => :controller do

  

#   describe 'NEW/UPDATE EVENT' do
   
#     it 'should call update_attributes and redirect' do
        
#       @student = FactoryGirl.create(:student)
#       put :update, id: @student, 
#         student: FactoryGirl.attributes_for(:student, name: "Larry")
#       @student.reload
#       @student.name.should eq("Larry")
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
        
#       e2=FactoryGirl.create(:student,:name => "US23", :dept => "CSCE", :desc => "CSCE",:id =>'3' ,:password => 'RGVKIADAG',:password_confirmation => 'RGVKIADAG')
#       allow(Student).to receive(:find).with('3').and_return(e2)
#       expect(e2).to receive(:destroy)
  
#       delete :destroy, :id => e2.id
#     end
#     it 'CREATE' do
#       expect{
#         post :create, student: FactoryGirl.attributes_for(:student)
#       }.to change(Student,:count).by(1)
#     end
    
#   end


# end



