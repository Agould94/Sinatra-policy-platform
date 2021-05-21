class PoliciesController < ApplicationController

  # GET: /policies
  get "/policies" do
    erb :"/policies/index.html"
  end

  # GET: /policies/new
  get "/policies/new" do
    erb :"/policies/new.html"
  end

  # POST: /policies
  post "/policies" do
    redirect "/policies"
  end

  # GET: /policies/5
  get "/policies/:id" do
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
    redirect "/policies"
  end
end
