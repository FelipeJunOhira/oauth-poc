module Front
  class SessionsController < ::Front::BaseController
    def new
      @form = ::Front::SessionForm.new
    end

    def create
      @form = ::Front::SessionForm.new(permitted_params)

      if @form.valid?
        session[:user_id] = @form.user.id
        session[:user_type] = @form.type

        if session[:user_type] == 'User'
          redirect_to oauth_authorized_applications_path
        else
          redirect_to oauth_applications_path
        end
      else
        render :new
      end
    end

    def logout
      session[:user_id] = nil
      session[:user_type] = nil

      redirect_to new_front_session_path
    end

    private

    def permitted_params
      params.require(:form).permit!
    end
  end
end
