class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def toke
    head :unauthorized unless current_user
  end

  def current_user
    token = Toke::Token.active.where(key: toke_key).first
    token.user if token
  end

  def toke_key
    request.headers['X-Toke-Key']
  end
end
