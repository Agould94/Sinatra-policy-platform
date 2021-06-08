class UsersController < ApplicationController
    
    get "/users" do
        @users = User.all 
        erb:"users/index"
    end

    get "/users/new" do
        erb:"users/new"
    end

    get "/users/:id" do
        @user = User.find(params[:id])
        erb:"users/show"
    end

    get "/users/:id/edit" do
        @user = User.find(params[:id])
        erb:"users/edit"
    end

    patch "/users/:id" do 
        @user = User.find(params[:id])
        @user.username = params[:username] 
        @user.biography = params[:biography]
        @user.save 
        redirect to "/users/#{@user.id}"
    end
    
 
    post "/users" do
        @user = User.create(params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else
            flash[:errors] = @user.errors.full_messages
            redirect "/users/new"
        end
    end


end