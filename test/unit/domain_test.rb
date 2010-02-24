require 'test_helper'

class DomainTest < ActiveSupport::TestCase

  context "A domain" do
    setup do
      @app    = Factory(:app)
      @domain = @app.domains.first
    end
    
    subject { @domain }
    
    should_belong_to                    :app
    
    should_validate_presence_of         :name
    should_validate_uniqueness_of       :name
    
    should_allow_values_for             :name, "nezumiapp.com", "appmark.it", "my.awesomeapp.com", "my-app.com"
    should_not_allow_values_for         :name, "http://nezumiapp.com", "https://nezumiapp.com", "http:/nezumiapp.com", ".mysite.com", "-whatever.org", "my-app"


  end
end
