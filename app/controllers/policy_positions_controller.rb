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
    #binding.pry
    @policy = Policy.find(params[:policy])
    @policy_position = PolicyPosition.new 
    @policy_position.author = current_user.username
    @policy_position.case = params[:case]
    @policy_position.policy = @policy
    @policy_position.for_or_against = params[:for_or_against]
    if params[:for_or_against] == "for" && !@policy_position.users.include?(current_user)
      @policy_position.users<<current_user
    end
    @policy_position.adopters = @policy_position.users.length
    @policy_position.save
    redirect "/policy_positions/#{@policy_position.id}"
  end

  # GET: /policy_positions/5
  get "/policy_positions/:id" do
    @policy_position = PolicyPosition.find(params[:id])
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
