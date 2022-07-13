# frozen_string_literal: false

module ApplicationHelper
  def login_helper(style = '')
    if current_user.is_a?(GuestUser)
      (link_to 'Register', new_user_registration_path, class: style) +
        ' '.html_safe +
        (link_to 'Login', new_user_session_path, class: style)
    else
      link_to 'Logout', destroy_user_session_path, method: :delete, class: style
    end
  end

  def source_helper
    content_tag(:p, greeting_message, class: 'source-greeting') if session[:source]
  end

  def copyright_helper
    name = 'Funes Nicolas'
    msg = 'All rights reserved'
    sanitize "&copy; #{Time.zone.now.year} | <b>#{name}</b> #{msg}"
  end

  def nav_items
    [{
      url: root_path, title: 'Home'
    },
     { url: about_me_path, title: 'About Me' },
     { url: contact_path, title: 'Contact' },
     { url: blogs_path, title: 'Blog' },
     { url: portfolios_path, title: 'Portfolio' }]
  end

  def nav_helper(style, tag_type)
    nav_links = ''

    nav_items.each do |item|
      nav_link = "<#{tag_type}><a href='#{item[:url]}' " \
                 "class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
      nav_links << nav_link
    end
    sanitize nav_links
  end

  def active?(path)
    'active' if current_page? path
  end

  private

  def greeting_message
    "Thanks for visiting me from #{session[:source]}"
  end
end
