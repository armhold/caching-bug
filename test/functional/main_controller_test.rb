require 'test_helper'

class MainControllerTest < ActionController::TestCase

  # Notes
  #
  # 1. config/environments/test.rb has been modified with "config.action_controller.perform_caching = true"
  #
  # 2. test runs leave caching files behind in tmp; best to 'rm -rf tmp/*' between runs of the suite.
  #
  # 3. When run in succession, "first run" passes; "second run" fails, presumably because caching from the first test
  #    fails to save the Cache-Control header.

  def check_cache_header
    get :index, { }

    assert_equal "max-age=600, public", @response.headers["Cache-Control"]
  end

  # test should pass, if tmp/* has been cleaned
  test "first run" do
    check_cache_header
  end

  # this test will fail because "first run" has already run
  test "second run" do
    check_cache_header
  end

end
