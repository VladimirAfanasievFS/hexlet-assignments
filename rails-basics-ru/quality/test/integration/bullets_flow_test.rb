# frozen_string_literal: true

require 'test_helper'

class BulletsFlowTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'opens all bulletins page' do
    get bulletins_path
    assert_response :success
    assert_select 'h1', 'Bulletins'
  end

  test 'opens one note page with fixture' do
    bullet1 = bulletins(:bullet1)
    get bulletin_path(bullet1)
    assert_response :success
    assert_select 'p1', bullet1.title
    assert_select 'p1', bullet1.body
  end
end
