require 'rails_helper'

RSpec.describe ResumesController, type: :controller do

#   describe "GET #index" do
#     it "returns http success" do
#       get :index
#       expect(response).to have_http_status(:success)
#     end
#   end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET #index" do
    before :each do
      @rs1 = FactoryGirl.create(:faculty, :id =>'9', :uin => "1234".to_i, :name => "Sagar" ,:dept => "CSCE", :desc => "help", :office => "CSCE", :phone_no => "1234", :email => "ss@ss.com", :password => "new12345", :password_confirmation => "new12345")
      @rs = FactoryGirl.create(:resume,:name => "US23", :attachment => "CSCE",:uin=>"1234".to_i, :id =>'9')
      session[:faculty_id] = @rs1.id
    end
  it "navigates to index page" do
    get :index
    expect(response).to have_http_status(:success)
  
  end
end
    
  describe 'CREATE' do
    it "creates a new Resume" do
      expect{
        post :create, resume: FactoryGirl.attributes_for(:resume)
      }.to change(Resume,:count).by(1)
    end
     it "does not creates a new publication" do
      expect{
        post :create, resume: FactoryGirl.attributes_for(:resume, name: "")
      }.to change(Resume,:count).by(0)
    end
  end
  
  
  describe 'DELETE' do
    before :each do
      @rs = FactoryGirl.create(:resume,:name => "US23", :attachment => "CSCE",:uin=>"1234".to_i, :id =>'9')
    end
  
    it "deletes the resume" do
      expect{
        delete :destroy, id: @rs     
      }.to change(Resume,:count).by(-1)
    end
    
  end
  
#   describe "GET #create" do
#     it "returns http success" do
#       get :create
#       expect(response).to have_http_status(:success)
#     end
#   end

#   describe "GET #destroy" do
#     it "returns http success" do
#       get :destroy
#       expect(response).to have_http_status(:success)
#     end
#   end

end