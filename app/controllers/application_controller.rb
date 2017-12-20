class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user

    # 아래 코드는 원래 @user = @user || User.find(session[:user_id])
    # @user가 비어있으면 뒤에있는 것을 사용하고
    # @user가 비어있지 않다면 있는 것을 사용해라.
    @user ||= User.find(session[:user_id]) if User.exists? && session[:user_id]
  end

  def authorize

    unless current_user
      flash[:notice] = "로그인을 하셔야 게시판 사용이 가능합니다."
      redirect_to '/login'
    end
    # redirect_to '/login' if !current_user
  end

  #helper_method("current_user")로 사용해도 된다.
  helper_method :current_user
end
