class TaskNotificationsController < ApplicationController
  def show
    notification = TaskNotification.find(params[:id])
    redirect_url = params[:redirect_url]

    if notification.delete && redirect_url.present?
      redirect_to redirect_url
    end
  end

  def index
    @task_notifications = current_user.task_notifications
  end
end