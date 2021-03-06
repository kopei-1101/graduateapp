class UsersController < ApplicationController
    def new
        @user = User.new(
        name: params[:name], 
        email: params[:email], 
        password: params[:password]
        )

    end

    def again
        @user = User.new(
            name: params[:name], 
            email: params[:email], 
            password: params[:password]
            )
    end

    
    def create
        @user = User.new(
        name: params[:name], 
        email: params[:email], 
        password: params[:password],
        )
        if  @user.save
            session[:user_id] = @user.id
            flash[:notice] = "ユーザー登録が完了しました"
            redirect_to("/users/sign_in")
        else
            flash[:notice]="正しく記入してください"
            redirect_to("/users/new")
        end
    end


    def edit
        @user = User.find_by(
        id: params[:id],
        )
    end

    def update
        @user = User.find_by(id: params[:id])
        @user.name = params[:name]
        @user.email = params[:email]
        if @user.save
          flash[:notice] = "ユーザー情報を編集しました"
          redirect_to("/users/#{@user.id}/top")
        else
          render("users/edit")
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :image)
    end

end