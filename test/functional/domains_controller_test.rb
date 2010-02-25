require 'test_helper'

class DomainsControllerTest < ActionController::TestCase

  context "A user with an app" do
    
    setup do
      @user = Factory(:user)
      @app  = @user.apps.first
      signin_as(@user)
    end
    
    context "wants to add a valid domain" do
      setup do
        post :create, :app_id => @app.id, :domain => { :name => "www.nezumiapp.com" }
      end
      
      should_assign_to                  :domain
      should_respond_with               :redirect
      should_redirect_to("apps page")   { @app }
      should_set_the_flash_to           /added/
      
    end
    
    context "wants to add a invalid domain" do
      setup do
        post :create, :app_id => @app.id, :domain => { :name => "http://www.nezumiapp.com" }
      end
      
      should_assign_to                  :domain
      should_respond_with               :redirect
      should_redirect_to("apps page")   { @app }
      should_set_the_flash_to           /Error/
      
    end
    
    context "wants to remove an existing domain" do
      setup do
        @domain = @app.domains.first
        delete :destroy, :app_id => @app.id, :id => @domain.id
      end
      
      should_assign_to                  :domain
      should_respond_with               :redirect
      should_redirect_to("apps page")   { @app }
      should_set_the_flash_to           /removed/
      
    end
    
    
  end
    

end
