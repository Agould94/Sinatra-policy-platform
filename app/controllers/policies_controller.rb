class PoliciesController < ApplicationController

  # GET: /policies
  get "/policies" do
    @policies = Policy.all
    erb :"/policies/index.html"
  end

  # GET: /policies/new
  get "/policies/new" do
    @topics=Topic.all
    erb :"/policies/new.html"
  end

  # POST: /policies
  post "/policies" do
    #binding.pry

    @policy = Policy.create(params[:policy])
    
    if !params["topic"]["name"].empty?
      @policy.topic = Topic.create(name: params["topic"]["name"])
    end
    @policy.save

    redirect "/policies/#{@policy.id}"
  end

  # GET: /policies/5
  get "/policies/:id" do
    @policy = Policy.find(params[:id])
    erb :"/policies/show.html"
  end

  # GET: /policies/5/edit
  get "/policies/:id/edit" do
    erb :"/policies/edit.html"
  end

  # PATCH: /policies/5
  patch "/policies/:id" do
    redirect "/policies/:id"
  end

  # DELETE: /policies/5/delete
  delete "/policies/:id/delete" do
    @policy = Policy.find(params[:id])
    if current_user.username == @policy.author
      @policy.destroy
    end
    redirect "/policies"
  end
end
