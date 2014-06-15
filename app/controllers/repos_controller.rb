class ReposController < ApplicationController
  def index
  end

  def show
    @user = params[:id]
    @gh = Adapters::Github.new user: @user
    @repos = @gh.names
  end
end

