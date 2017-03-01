require 'rest-client'
require 'json'

class GuildsController < ApplicationController

  def index
    @guilds = Guild.all
    p @guilds
    render :index
  end

  def new
    @guild  = Guild.new
    render :new
  end

  def create
    @guild = Guild.new(guild_params)
    p @guild.name
    url = "https://api.guildwars2.com/v1/guild_details.json?guild_name=#{@guild.name}"
    response = RestClient.get(url)
    api_response = JSON.parse(response)
    @guild.guild_tag = api_response["tag"]

    if @guild.save
      redirect_to root_path
    else
      @guild.errors.full_messages
      render :new
    end

  end

  def destroy
  end

  def edit
    @guild = Guild.find(params[:id])
    p @guild
    render :edit
  end

  def udpate
    @guild = Guild.find(params[:id])
    p @guild

  end

  def show
  end

  private
  def guild_params
    params.require(:guild).permit(:name, :server, :wvw_playstyle, :average_member_count, :guild_tag)
  end

end
