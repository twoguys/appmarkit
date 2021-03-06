require 'test_helper'

class LinksControllerTest < ActionController::TestCase

  context "A user with an app" do
    
    setup do
      @user = Factory(:user)
      @app  = @user.apps.first
      signin_as(@user)
    end
    
    context "wants to add a valid link" do
      setup do
        post :create, :app_id => @app.id, :link => { :title => "Twitter", :url => "http://twitter.com/nezumiapp" }, :format => :js
      end
      
      should_assign_to                  :link
      should_respond_with               :success
      should_render_template            :create
      should_set_the_flash_to           /added/
      
    end
    
    context "wants to add a invalid link" do
      setup do
        post :create, :app_id => @app.id, :link => { :title => "", :url => "http://twitter.com/nezumiapp" }, :format => :js
      end
      
      should_assign_to                  :link
      should_respond_with               :success
      should_render_template            :create
      should_set_the_flash_to           /Error/
      
    end
    
    context "wants to remove an existing link" do
      setup do
        @link = @app.links.first
        delete :destroy, :app_id => @app.id, :id => @link.id, :format => :js
      end
      
      should_assign_to                  :link
      should_respond_with               :success
      should_render_template            :destroy
      should_set_the_flash_to           /removed/
      
    end
    
    
  end
    

end
