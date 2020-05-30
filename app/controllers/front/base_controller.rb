module Front
  class BaseController < ::ApplicationController
    layout 'front'

    helper_method :user_logged?
    helper_method :current_user

    private

    def user_logged?
      session[:user_id] && session[:user_type]
    end

    def current_user
      case session[:user_type]
      when 'User'
        User.find(session[:user_id])
      when 'Developer'
        Developer.find(session[:user_id])
      end
    end
  end
end
