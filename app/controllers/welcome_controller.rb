class WelcomeController < ApplicationController
  before_action :authorize_user, except: [:index, :show]

  def index
    render :index
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
