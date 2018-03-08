# AJAX helpers
class AjaxController < ApplicationController
  layout false

  def email_list
  end

  def email_compose
  end

  def email_opened
  end

  def email_reply
  end

  def demo_widget
  end

  def data_list
  end

  def notify_mail
    @mensaje = Mensaje.where("status = '0'")
  end

  def notify_notifications
     @mensaje = Mensaje.where("status = '1'")
  end

  def notify_tasks
  end
end
