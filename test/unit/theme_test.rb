require 'test_helper'

class ThemeTest < ActiveSupport::TestCase

  context "A theme" do
    setup do
      @theme                = Factory(:theme)
    end
    
    subject { @theme }
    
    should_have_many                    :apps
    
    should_validate_presence_of         :name
    should_validate_uniqueness_of       :name
        
    should_validate_presence_of         :template
    
    should_validate_presence_of         :tags

  
    should "have a small screenshot url" do
      assert_equal  "/themes/#{@theme.folder}/screenshot-small.png", @theme.screenshot_url
    end
    
    should "have a large screenshot url" do
      assert_equal  "/themes/#{@theme.folder}/screenshot-large.png", @theme.screenshot_url("large")
    end
    
    
  end
end
