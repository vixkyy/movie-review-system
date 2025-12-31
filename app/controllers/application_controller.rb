class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pagy::Backend
  rescue_from CanCan::AccessDenied do |_exe|
    redirect_to root_path, alert: 'You are not Authorized for this action.'
  end
end
