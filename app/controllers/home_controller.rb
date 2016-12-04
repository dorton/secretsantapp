class HomeController < ApplicationController
  before_action :authenticate_user!, :except => [:splash, :email_sent, :invite_users, :group_invite]



  def splash
  end

  def invite_users
    email = params[:email]
    first_name = params[:first_name]
    last_name = params[:last_name]
    def invitor(email, first_name, last_name)
      user = User.new
      user.email = email
      user.first_name = first_name
      user.last_name = last_name
      user.invite!
    end

    if User.find_by(email: email).present?
      redirect_to new_session_path
    else
      invitor(email, first_name, last_name)
      redirect_to email_sent_path
    end
  end

  def email_sent
  end

end
