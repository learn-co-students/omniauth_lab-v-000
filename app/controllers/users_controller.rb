class UsersController <ApplicationController

  def new
    @user = user.new
  end

  def create
    @user = User.new(name: params[:user][:name])
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.save
    redirect_to hello_path
  end
end
