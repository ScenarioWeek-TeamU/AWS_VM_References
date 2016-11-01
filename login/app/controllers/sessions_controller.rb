class SessionsController < ApplicationController
  def new
    if signed_in?
      redirect_to '/references'
    end
  end

  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])

    if user.nil?
        flash.now[:danger] = "Invalid login details"
        render :new
    else
        sign_in user
        redirect_to '/references'
    end
  end

  def destroy
    sign_out
    render :new
  end

end
