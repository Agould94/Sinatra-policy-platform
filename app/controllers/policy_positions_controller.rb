class PolicyPositionsController < ApplicationController

  # GET: /policy_positions
  get "/policy_positions" do
    erb :"/policy_positions/index.html"
  end

  # GET: /policy_positions/new
  get "/policy_positions/new" do
    #binding.pry
    @policy = Policy.find(params[:policy])
    erb :"/policy_positions/new.html"
  end

  # POST: /policy_positions
  post "/policy_positions" do
    binding.pry
    redirect "/policy_positions"
  end

  # GET: /policy_positions/5
  get "/policy_positions/:id" do
    erb :"/policy_positions/show.html"
  end

  # GET: /policy_positions/5/edit
  get "/policy_positions/:id/edit" do
    erb :"/policy_positions/edit.html"
  end

  # PATCH: /policy_positions/5
  patch "/policy_positions/:id" do
    redirect "/policy_positions/:id"
  end

  # DELETE: /policy_positions/5/delete
  delete "/policy_positions/:id/delete" do
    redirect "/policy_positions"
  end
end
