class UsersController < ApplicationController 

def new
end

def create
    user = User.new(user_params)
    if user.save
        session[:user_id] = user.id
        redirect_to '/'
    else
        redirect_to '/sessions/new'
    end
end

def login
    user = User.find_by_email(params[:email])
    if user.password_digest == params[:password_digest]
        give_token
    else
        redirect_to_home_url
    end
end

private 

def user_params
    params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation)
  end

end