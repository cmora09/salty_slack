require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get controller" do
    get messages_controller_url
    assert_response :success
  end

end
