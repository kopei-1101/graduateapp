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
            redirect_to("/guesthouses/top")
        else
            flash[:notice]="正しく記入してください"
            redirect_to("/users/new")
        end
    end

    def login
        @user = User.where(email: params[:email], password: params[:password]).last
        if @user
            session[:user_id] = @user.id
            flash[:notice] = "ログインしました"
            redirect_to("/guesthouses/top")
        else
            flash[:notice]="メールアドレスまたはパスワードが間違っています"
            @email = params[:email]
            @password = params[:password]
            render("users/again")
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


    def logout
        session[:user_id] = nil
        flash[:notice] = "ログアウトしました"
        redirect_to("/users/again")
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :image)
    end

end