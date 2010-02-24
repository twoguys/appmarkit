require 'test_helper'

class LinkTest < ActiveSupport::TestCase

  context "A link" do
    setup do
      @app  = Factory(:app)
      @link = @app.links.first
    end
    
    subject { @link }
    
    should_belong_to                    :app
    should_validate_presence_of         :title
    should_validate_presence_of         :url


  end
end
