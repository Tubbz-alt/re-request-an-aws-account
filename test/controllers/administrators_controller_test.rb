require 'test_helper'

class AdministratorsControllerTest < ActionDispatch::IntegrationTest
  setup { sign_in 'test@example.com' }

  test 'should get index' do
    get administrators_url
    assert_response :success
  end

  test 'should validate form' do
    post administrators_url, params: { administrators_form: { } }
    assert_response :success
    assert_select '.error-message', 'Admin users should be a list of GDS emails'
  end

  test 'should redirect on valid form' do
    post administrators_url, params: { administrators_form: { admin_users: 'test.user@digital.cabinet-office.gov.uk' } }
    assert_redirected_to check_your_answers_url
  end
end