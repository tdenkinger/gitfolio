require_relative "../../lib/adapters"

class ReposController < ApplicationController
  def index
  end

  def show
    @user = params[:id]
    @repos = ["hello"]
    @gh = Adapters::Github.new user: @user
    # @repos = @gh.names
  end
end

