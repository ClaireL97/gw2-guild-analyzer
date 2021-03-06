require 'rest-client'
require 'json'

class GuildsController < ApplicationController

  def index
    @guilds = Guild.all
    render :index
  end

  def new
    @guild  = Guild.new
    render :new
  end

  def create
    @guild = Guild.new(guild_params)
    url = "https://api.guildwars2.com/v1/guild_details.json?guild_name=#{@guild.name}"
    begin
      response = RestClient.get(url)
    rescue RestClient::BadRequest
      response = nil
    end

    if response != nil
      api_response = JSON.parse(response)
      @guild.guild_tag = api_response["tag"]
      if @guild.save
        redirect_to root_path
      else
        @guild.errors.full_messages
        render :new
      end
    else
      flash[:notice] = "Guild Name Can't Be Found"
      render :new
    end

  end

  def destroy
    @guild = Guild.find(params[:id])
    @guild.destroy
     p @guild.contacts

    redirect_to root_path
  end

  def edit
    @guild = Guild.find(params[:id])
    render :edit
  end

  def update
    @guild = Guild.find(params[:id])
    if @guild.update(guild_params)
      render :show
    else
      @guild.errors.full_messages
      render :edit
    end
  end

  def show
    @guild = Guild.find(params[:id])
    p @guild.contacts
    render :show
  end

  private
  def guild_params
    params.require(:guild).permit(:name, :server, :wvw_playstyle, :average_member_count, :guild_tag)
  end

end
