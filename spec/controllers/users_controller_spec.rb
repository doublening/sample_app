require 'spec_helper'

describe UsersController do
  integrate_views
 
  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  	it "should have the right title" do
      get 'new'
      response.should have_selector("title", :content => "Ruby on Rails Tutorial Sample App | Sign up")
	end
  end

 
#  describe "GET 'show'" do
 #   before(:each) do
 #     @user=Factory(:user)
#	  #let(:user) { FactoryGirl.create(:user) }
#      #Arrange for User.find(params[:id]) to find the right user.
#      User.stub!(:find, @user.id).and_return(@user)
#    end#
#
#    it "should be successful"do
#      get :show, :id=>@user
#      response.should be_success
#    end\
	
#    it "should have the right title"do
#      get :show, :id=>@user
#      response.should have_tag("title", /#{@user.name}/)
#    end
	 
#    it "should include the user's name"do
#      get :show, :id=>@user
#      response.shouldhave_tag("h2", /#{@user.name}/)
#    end
	
#    it "should have a profile image"do
#      get :show, :id=>@user
#      response.shouldhave_tag("h2>img", :class=> "gravatar")
#    end	
#  end  
end
