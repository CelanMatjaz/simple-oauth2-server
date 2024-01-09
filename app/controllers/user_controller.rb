class UserController < ApplicationController
  def index
  end

  def login
  end

  def register
  end
  
  def create
    if !params['username'].present? || !params['password'].present? || !params['password_repeat'].present?
      @notice = "Invalid values provided!"
      render :template => 'user/register', status: :unprocessable_entity
      return
    end

    user = User.new(username: params['username'], password: params['password'])

    if !user.authenticate(params['password_repeat'])      
      render_with_notice('Passwords do not match!', 'user/register')
      return
    end

    if User.find_by(username: user.username)
      render_with_notice('User with username ' + user.username + ' already exists!', 'user/register')
      return
    end

    if 
      redirect_to user_login_path
      user.save
    else 
      @notice = user.errors
      render :template => 'user/register'
    end
  end

  def authenticate
    if !params['username'].present? || !params['password'].present?
      @notice = "Invalid values provided!"
      render :template => 'user/login', status: :unprocessable_entity
      return
    end

    user = User.find_by(username: params['username'])

    if user.authenticate(params['password']) 
      session['id'] = user.id
      redirect_to user_path
    else 
      render_with_notice("Incorrect password!", "user/login")
    end
  end

  def logout
    reset_session
    redirect_to user_login_path
  end

  private def render_with_notice(notice, templ)
    @notice = notice
    render :template => templ
  end

  private def permit_params
    params.permit(['username', 'password', 'password_repeat'])
  end
end
