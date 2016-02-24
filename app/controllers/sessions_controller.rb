class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email params[:email]

    # Both User and Contact objects can log in. This might get crazy.
    unless @user
      @user = Contact.find_by_email params[:email]
    end


    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id

      if @user.try(:first_name)
        flash[:success] = "Welcome, #{@user.first_name}"
      else
        flash[:success] = "Welcome, #{@user.firstname}"
      end

      if @user.class.name == "User"
        redirect_to user_path(@user)
      else
        @contact = @user
        redirect_to contact_path(@contact)
      end

    else
      flash[:danger] = "Username and/or Password dont appear to be correct"
      redirect_to signin_path
    end
  end

  def destroy
    if session[:id]
      session[:id] = nil
      flash[:success] = "Bye Bye. Have fun storming the castle."
    else
      flash[:danger] = "Errr, you can't log out when you aren't logged in. That's science."
    end

    redirect_to signin_path
  end


  # # These are for contacts, above are for users. Yes this is madness, if you are reading this welcome to the madness.
  # # We should abstract these both. Or something
  # def new_contact
  # end
  #
  # def create_contact
  #   @contact = User.find_by_contact params[:email]
  #
  #   if @contact && @contact.authenticate(params[:password])
  #     session[:id] = @contact.id
  #
  #     flash[:success] = "Welcome, #{@contact.first_name}"
  #     redirect_to contact_path(@contact)
  #   else
  #     flash[:danger] = "Username and/or Password dont appear to be correct"
  #     redirect_to session_new_contact_path
  #   end
  # end
  #
  # def destroy_contact
  #   if session[:id]
  #     session[:id] = nil
  #     flash[:success] = "Bye Bye. Have fun storming the castle."
  #   else
  #     flash[:danger] = "Errr, you can't log out when you aren't logged in. That's science."
  #   end
  #
  #   redirect_to signin_path
  # end
end
