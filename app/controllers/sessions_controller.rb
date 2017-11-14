class SessionsController < ApplicationController

  def new
    # login form
  end

  def create
    # actually try amd log in
    @form_data = params.require(:session)

    # pull out the username and password from the form data

    @username = @form_data[:username]
    @password = @form_data[:password]

    # lets check the user is who they say they say they are
    @user = User.find_by(username: @username).try(:authenticate, @password)

    # if there is a user present, rediredt to the homepage

    if @user
      # save this user to that user's session

      session[:user_id] = @user.id



      redirect_to root_path
    else
      render "new"
    end

  end

  def destroy
    # log us out!
    # remove the session completely
    reset_session

    redirect_to new_session_path
  end


end
