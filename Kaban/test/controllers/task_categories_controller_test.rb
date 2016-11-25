require 'test_helper'

class TaskCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_category = task_categories(:one)
  end

  test "should get index" do
    get task_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_task_category_url
    assert_response :success
  end

  test "should create task_category" do
    assert_difference('TaskCategory.count') do
      post task_categories_url, params: { task_category: {  } }
    end

    assert_redirected_to task_category_url(TaskCategory.last)
  end

  test "should show task_category" do
    get task_category_url(@task_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_category_url(@task_category)
    assert_response :success
  end

  test "should update task_category" do
    patch task_category_url(@task_category), params: { task_category: {  } }
    assert_redirected_to task_category_url(@task_category)
  end

  test "should destroy task_category" do
    assert_difference('TaskCategory.count', -1) do
      delete task_category_url(@task_category)
    end

    assert_redirected_to task_categories_url
  end
end
