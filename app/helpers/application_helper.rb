# frozen_string_literal: true

module ApplicationHelper
  def login_helper
    if current_user.is_a?(User)
      link_to 'Logout', destroy_user_session_path, method: :delete
    else
      (link_to 'Register', new_user_registration_path) +
        '<br>'.html_safe +
        (link_to 'Login', new_user_session_path)
    end
  end

  def source_helper
    content_tag(:p, greeting_message, class: 'source-greeting') if session[:source]
  end

  private

  def greeting_message
    "Thanks for visiting me from #{session[:source]}"
  end
end
