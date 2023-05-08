 class UsersController < ApplicationController
   before_action  :set_user, only:[:show, :edit, :update]
 
 
   def new 
    @user = User.new

   end
   def edit 
   end
   def index 
      @users = User.paginate(page: params[:page], per_page: 6)
   end
   def show 
      @articles = @user.articles.paginate(page: params[:page], per_page: 3)
 end
 def update 
   if @user.update(user_params)
      flash[:notice] = "Your Account information was successfully updated"
      redirect_to user_path
   else
      return render(:edit, status: :unprocessable_entity) unless @user.save      
   end
   end

 def create
      @user = User.new(user_params)
      if @user.save
         session[:user_id] = @user.id 

         flash[:notice] = "Welcome #{@user.username} , to the Alpha blog"
         redirect_to articles_path
      else
         return render(:new, status: :unprocessable_entity) unless @user.save      
      end
end


private

def set_user
   @user = User.find(params[:id])
end

def user_params

  params.require(:user).permit(:username, :email, :password)

end
end
