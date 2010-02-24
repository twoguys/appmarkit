require 'test_helper'

class AppTest < ActiveSupport::TestCase

  context "An app" do
    setup do
      @app = Factory(:app)
    end
    
    subject { @app }
    
    should_belong_to                    :user
    should_belong_to                    :theme
    should_have_many                    :links
    should_have_many                    :domains
    
    should_validate_presence_of         :name
    
    should_validate_presence_of         :subdomain
    should_validate_uniqueness_of       :subdomain
    should_not_allow_values_for         :subdomain, "www", "admin", "$%^&*()"
    should_allow_values_for             :subdomain, "nezumi", "2304230", "my-app"

    should_validate_presence_of         :itunes_url
    should_not_allow_values_for         :itunes_url, "http://notitunes.com", "itunes.apple.com", "http://itunes.mysite.com"
    should_allow_values_for             :itunes_url, "http://itunes.apple.com/us/app/nezumi/id346715875?mt=8&uo=4"
  
  end
end
