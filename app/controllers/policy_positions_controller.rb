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
      @policy_position.increment(:adopters, 1)
    elsif params[:for_or_against]=="against" && !@policy_position.users.include?(current_user)
      @policy_position.users<<current_user
      @policy_position.increment(:opposers, 1)
    end
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
    @policy_position = PolicyPosition.find(params[:id])
    erb :"/policy_positions/edit.html"
  end

  # PATCH: /policy_positions/5
  patch "/policy_positions/:id" do
    @policy_position = PolicyPosition.find(params[:id])
    #binding.pry
    @policy_position.update(:case => params[:case])
    redirect "/policy_positions/#{params[:id]}"
  end

  patch "/policy_positions/:id/support_or_oppose" do 
    #binding.pry
    @policy_position = PolicyPosition.find(params[:id])
    if params[:support_or_oppose] == "support" && !@policy_position.users.include?(current_user)
      @policy_position.users<<current_user
      @policy_position.increment(:adopters, 1)
    elsif params[:support_or_oppose]=="oppose" && !@policy_position.users.include?(current_user)
      @policy_position.users<<current_user
      @policy_position.increment(:opposers, 1)
    end
    @policy_position.save
    redirect "/policy_positions/#{@policy_position.id}"
  end

  # DELETE: /policy_positions/5/delete
  delete "/policy_positions/:id/delete" do
    @policy_position = PolicyPosition.find(params[:id])
    if current_user.username == @policy_position.author
      @policy_position.destroy
    end
    redirect "/policy_positions"
  end
end
