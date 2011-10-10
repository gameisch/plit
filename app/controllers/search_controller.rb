class SearchController < ApplicationController
  def index
    @search = User.search(params[:search])
    @users = @search.all   # or @search.relation to lazy load in view
  end
