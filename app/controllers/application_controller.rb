class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :ensure_podio_login

  private
    def ensure_podio_login
      if session[:podio_access_token]
        init_podio_client
      end
    end

    def init_podio_client
      Podio.setup(
        api_url: 'https://api.podio.com',
        api_key: ENV['PODIO_OAUTH_ID'],
        api_secret: ENV['PODIO_OAUTH_SECRET'],
        oauth_token: Podio::OauthToken.
          new('access_token' => session[:podio_access_token], 'refresh_token' => session[:podio_refresh_token])
      )
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user
end
