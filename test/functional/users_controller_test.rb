require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  context "A user" do
    
    setup do
    end
    
    context "who wants to signup" do
      setup do
        get :new
      end
      
      should_assign_to            :user
      should_respond_with         :success
      should_render_template      :new
      should_not_set_the_flash
      
    end
    
    context "who is signed in" do
      setup do
        activate_authlogic
        @user = Factory(:user)
        signin_as(@user)
        get :edit, :id => @user.id
      end
      
      context "and wants to edit their profile" do
        setup do
          get :edit, :id => @user.id
        end

        should_assign_to            :user
        should_respond_with         :success
        should_render_template      :edit
        should_not_set_the_flash      

      end

      context "and updates their profile" do
        setup do
          @email    = "djbrowning@gmail.com"
          @password = "newpassword" 
          put :update, :id => @user.id, :user => { :email => @email, :password => @password, :password_confirmation => @password }
        end
        
        should_assign_to                :user
        should_respond_with             :redirect
        should_redirect_to("app page")  { apps_path }
        should_set_the_flash_to         /You account has been updated/
        
        should "have a new email address" do
          assert_equal @email, @user.reload.email
        end
        
      end
      
      
      
    end
    
    
    # TODO Figure out how to test with recaptcha
    # context "who wants signs up" do
    #   context "with a valid email address and password" do
    #     setup do
    #       get :create,
    #         :user => {
    #           :email    => "mwhuss@gmail.com",
    #           :password => "password"
    #         }
    #     end
    #       
    #       should_assign_to                    :user
    #       should_respond_with                 :redirect
    #       should_redirect_to("apps page")     { apps_path }
    #       should_set_the_flash_to             /Your account has been created/
    #       
    #   end
    # 
    #  
    #   context "with an invalid email address" do
    #   end
    #  
    #   context "with an invalid password" do
    #   end
    # end

  end
   
end
