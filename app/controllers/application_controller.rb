class ApplicationController < ActionController::Base
  private

  def signed_in?
    false
  end

  helper_method :signed_in?
end
