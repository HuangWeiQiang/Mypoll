class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html {redirect_to new_user_session_path, notice: exception.message}
    end
  end
end
