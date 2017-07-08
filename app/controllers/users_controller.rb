class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  
  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました'
      redirect_to @user #users#showのアクション移動、createアクション実行後にshowアクションが実行　　 
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました'
      render :new #users/new.html.erbを表示
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  
end
