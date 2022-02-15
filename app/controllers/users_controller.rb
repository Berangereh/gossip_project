class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.city = City.all.sample

    if @user.save
      flash[:notice] = 'Ton compte est bien créé !'
      remember(user)
      redirect_to root_path

      

    else
      render '/users/new'
    end
  end

  def show
  end

   private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :email, :age, :description)
  end

end
