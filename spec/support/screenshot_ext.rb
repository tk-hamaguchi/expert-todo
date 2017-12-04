if ENV['CIRCLE_ARTIFACTS']
  require 'action_dispatch/system_testing/test_helpers/screenshot_helper'

  module ActionDispatch::SystemTesting::TestHelpers::ScreenshotHelper

    private

    def absolute_image_path
      Pathname.new File.join(ENV['CIRCLE_ARTIFACTS'], 'failed_screenshots', "#{image_name}.png")
    end
  end
end
