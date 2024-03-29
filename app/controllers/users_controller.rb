class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy
  before_filter :logged_in, :only => [:create, :new]
  def new
		@user = User.new
		@title = "Sign Up"
  end

  def create
		@user = User.new(params[:user])
		if @user.save
			sign_in @user
			flash[:success] = "Welcome to Web Cribbage."
			redirect_to @user
		else
			@title = "Sign Up"
			render 'new'
		end
  end

  def edit
	@title = "Edit User"
  end

  def update
	if @user.update_attributes(params[:user])
		flash[:success] = "Profile updated."
		redirect_to @user
	else
		@title = "Edit User"
		render 'edit'
	end
  end

  def index
	@title = "All Users"
	@users = User.paginate(:page => params[:page])
  end

  def show
	@user = User.find(params[:id])
	@title = @user.name
	@games = @user.game.paginate(:page => params[:page])
  end

  def destroy
	User.find(params[:id]).destroy
	flash[:success] = "User deleted."
	redirect_to users_path
  end

  private

	def logged_in
		redirect_to(current_user) if signed_in?	
	end
	
	
	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_path) unless current_user?(@user)
	end
	
	def admin_user
		redirect_to(root_path) unless current_user.admin?
	end
end
