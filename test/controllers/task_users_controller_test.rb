require 'test_helper'

class TaskUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_user = task_users(:one)
  end

  test "should get index" do
    get task_users_url
    assert_response :success
  end

  test "should get new" do
    get new_task_user_url
    assert_response :success
  end

  test "should create task_user" do
    assert_difference('TaskUser.count') do
      post task_users_url, params: { task_user: {  } }
    end

    assert_redirected_to task_user_url(TaskUser.last)
  end

  test "should show task_user" do
    get task_user_url(@task_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_user_url(@task_user)
    assert_response :success
  end

  test "should update task_user" do
    patch task_user_url(@task_user), params: { task_user: {  } }
    assert_redirected_to task_user_url(@task_user)
  end

  test "should destroy task_user" do
    assert_difference('TaskUser.count', -1) do
      delete task_user_url(@task_user)
    end

    assert_redirected_to task_users_url
  end
end
