# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_gaooh_rails_session_id'
  # jpmobile 
  mobile_filter :hankaku=>true
  
  layout :basic_layout
  def basic_layout
    if request.mobile?
      "mobile"
    else
      'basic'
    end
  end
  
  #=== _user_id
  # ログイン中のユーザIDを返す
  def _user_id
    session[:user]
  end

  #=== _user_name
  # ログイン中のユーザ名を返す
  def _user_name
    session[:user_name]
  end
  
  def _from
    session[:from].nil? ? "/" : session[:from]
  end
  
  #=== request_uri
  # リクエスト元URLをかえす
  def _request_uri
    request.env["REQUEST_URI"]
  end
  
  #=== signin_filter
  # 認証が必要なページにかけられるfilter
  # 未認証ならサインインページへリダイレクトさせる。
  def signin_filter
    unless is_authorized
      r_uri = request.env["REQUEST_URI"]
      if r_uri == "/account/signin"
        session[:from] = "/"
      else
        session[:from] = r_uri
      end

      redirect_to :controller => 'account', :action => 'signin'
    end
  end
  
  #=== debug
  # debugログをロギングする
  def debug(message)
    logger.debug("[NAVI]: #{message}")
  end

  #=== info
  # infoログをロギングする
  def info(message)
    logger.info("[NAVI]: #{message}")
  end

  #=== error
  # errorログをロギングする
  def error(message)
    logger.error("[NAVI]: #{message}")
  end
  
  #=== is_authorized
  # 認証しているかどうかを判別する
  def is_authorized
    return false unless session
    return false unless session[:user]
    return true
  end
  
end
