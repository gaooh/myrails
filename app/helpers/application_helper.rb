# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # icon image 用
  def icon_image_tag(source, hspace=5)
    source = "icons/" + source + ".gif" 
    image_tag(source, :size =>'16x16', :align=>'absmiddle', :alt=>'icon', :hspace=>hspace)
  end
  
  # button image 用
  def button_image_submit_tag(source)
    source = "buttons/" + source + ".gif" 
    image_submit_tag(source, :alt=>'button', :class=>"submit_button")
  end
  
  # user image 用
  # image_tag を使うと　.png が自動的に補完されるのでつかわない
  def user_image(user)
    "<img src=\"https://intra.office.drecom.jp/#{user.office_id}/file/profile\" width=\"50px\" >"
  end
  
  # icon + text のリンクを作る
  def link_to_icon_text(icon, text, options = {}, html_options = nil, *parameters_for_method_reference)
    name = ""
    name << icon_image_tag(icon, 0)
    name << text
    link_to(name, options, html_options, parameters_for_method_reference)
  end
  
  # サインイン済みか
  def signin?
    session[:user].nil? ? false : true
  end
  
  # ログイン済みのユーザ名
  def user_name
    session[:user_name].nil? ? "" : session[:user_name]
  end
  
  # ログイン済みのユーザID
  def user_id
    session[:user]
  end
  
  # ログイン済みのユーザemail
  def user_email
    session[:user_email]
  end
  
end
