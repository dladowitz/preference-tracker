class ClientsController < ApplicationController
  before_filter :set_agent

  def index
    @clients = @agent.clients
  end

  def new
    @client = @agent.clients.new
  end

  private

  def set_agent
    @agent = User.find params[:user_id]
  end
end
