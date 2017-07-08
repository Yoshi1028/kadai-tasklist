class SessionsController < ApplicationController
  def new
  end
  
  def create
  email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to @user #@userのusers#showへリダイレクト
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render 'new' #sessions/new.html.erb を再表示
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました'
    redirect_to root_url #トップページにリダイレクト
  end

  private

  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
end