require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase

  context "A user who" do
    
    setup do
      @user = Factory(:user)
    end
    
    context "is going to the signin page" do
      setup do
        get :new
      end
      
      should_assign_to            :user_session
      should_respond_with         :success
      should_render_template      :new
      should_not_set_the_flash
      
    end
  
    context "successfully signing in" do
      setup do

        
        post :create, 
          :user_session => {
            :email    => "mwhuss@gmail.com",
            :password => "password"
          }
      end
      
      should_assign_to                  :user_session
      should_redirect_to("apps page")   { apps_path }
      should_not_set_the_flash
      
      
    end
    
    context "provides the incorrect password" do
      setup do
        post :create, 
          :user_session => {
            :email    => "mwhuss@gmail.com",
            :password => "badpassword"
          }
      end
      
      should_assign_to            :user_session
      should_respond_with         :success
      should_render_template      :new
      should_not_set_the_flash
      
      should "have error set" do
        assert_equal 1, assigns(:user_session).errors.count
      end
    end
    
    
    context "provides an invalid email address" do
      setup do
        post :create, 
          :user_session => {
            :email    => "bademail@gmail.com",
            :password => "badpassword"
          }
      end
      
      should_assign_to            :user_session
      should_respond_with         :success
      should_render_template      :new
      should_not_set_the_flash
      
      should "have error set" do
        assert_equal 1, assigns(:user_session).errors.count
      end
    end
    
    context "is supposed to be redirected to a page after successful signin" do
      setup do
        post :create, {
          :user_session => {
            :email    => "mwhuss@gmail.com",
            :password => "password",
          },
          :redirect_to => "/apps/new"
        }
      end
      
      should_assign_to                  :user_session
      should_respond_with               :redirect
      should_redirect_to("new app")     { "/apps/new" }
      should_not_set_the_flash
    end
  
    context "signs out" do
      setup do
        signin_as(@user)
        delete :destroy
      end
      
      should_assign_to                  :user_session
      should_respond_with               :redirect
      should_redirect_to("root url")    { root_url }
      should_set_the_flash_to           /signed out/
    end
  
  
  end
end
