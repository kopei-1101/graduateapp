class UsersController < ApplicationController
    def new
        @user = User.new(
        name: params[:name], 
        email: params[:email], 
        password: params[:password],
        )
    end

    def again
      
    end

    def create
        @user = User.new(
        name: params[:name], 
        email: params[:email], 
        password: params[:password],
        )
        if  @user.save
            flash[:notice] = "ユーザー登録が完了しました"
            redirect_to("/guesthouses/#{@user.id}")
        else
            flash[:notice]="正しく記入してください"
            render("users/new")
        end
    end

    def login
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            flash[:notice] = "ログインしました"
            redirect_to("/guesthouses/#{@user.id}")
        else
            flash[:notice]="メールアドレスまたはパスワードが間違っています"
            @email = params[:email]
            @password = params[:password]
            render("users/again")
        end
    end

    def edit
        @user = User.find_by(id: params[:id])
    end

    def update
        @user = User.find_by(id: params[:id])
        @user.name = params[:name]
        @user.email = params[:email]
        if @user.save
          flash[:notice] = "ユーザー情報を編集しました"
          redirect_to("/users/#{@user.id}")
        else
          render("users/edit")
        end
    end

end