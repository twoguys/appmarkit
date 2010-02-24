require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase

  context "A new user session" do
    context "going to the signin page" do
      setup do
        get :new
      end
      
      should_assign_to            :user_session
      should_respond_with         :success
      should_render_template      :new
      should_not_set_the_flash
      
    end
  end
end
