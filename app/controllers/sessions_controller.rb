class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(params[:password])
      flash.now[:danger] = 'Yes t es co !'
      session[:user_id] = user.id
      remember(user)
      redirect_to root_path

    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    flash.now[:danger] = 'Tu es bien déconnecté'
    session.delete(:user_id)
    #log_out(user)
    redirect_to root_path
  end
end
