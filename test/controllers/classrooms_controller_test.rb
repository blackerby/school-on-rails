require 'test_helper'

class ClassroomsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'index should show full classroom names' do
    swan = classrooms(:swan)
    contemp = classrooms(:contemp)

    get classrooms_url
    assert_select 'li', text: swan.full_name
    assert_select 'li', text: contemp.full_name
  end
end
