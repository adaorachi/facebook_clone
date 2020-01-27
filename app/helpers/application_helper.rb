module ApplicationHelper
  def resource_name
    :user
  end

  def resource_class
    Users
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end


  def nav_link(link_path, link_text, link_img)
    class_name = current_page?(link_path) ? 'active' : ''
             
    invited_guest = "<a href='#{link_path}'>\
    <span><img src='assets/#{link_img}' alt='#{link_text}' width='20'></span>\
    <span>#{link_text}</span>
    </a>".html_safe
    content_tag(:li, :class => "list-group-item content #{class_name}") do
      invited_guest
    end
  end

end
