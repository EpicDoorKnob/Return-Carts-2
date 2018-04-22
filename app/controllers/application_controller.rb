class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 # before_action :logged_in_user, only: [:edit]
end
