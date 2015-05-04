require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test 'should get show' do
    get :show
    assert_response :success
  end

  test 'should create event and return success if inserted' do
    post :create, event: {name: 'three', description: 'net neutrality',
                            date: 2015-04-29, time: '2015-04-30 13:05:02',
                            venue: 'office'}
    assert_response :success
  end

end
