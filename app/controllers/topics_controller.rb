class TopicsController < ApplicationController
    get "/topics" do 
        @topics = Topic.all
        erb:"/topics/index"
    end

    get "/topics/new" do 
        erb:"topics/new"
    end

    post "/topics" do 
        if Topic.exists?(:name =>params[:name])
            redirect "/topics"
        else
            @topic =  Topic.create(params)
            redirect "/topics"
        end
    end

    get "/topics/:id" do
        @topic = Topic.find(params[:id])
        erb:"topics/show"
    end
end