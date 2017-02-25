class GuildsController < ApplicationController

  def new
    @guild  = Guild.new
    render :new
  end

  def create
    @guild = Guild.new

    if @guild.save
      redirect_to root_path
    else
      @guild.errors.full_messages
      render :new
    end

  end

  def destroy
  end

  def udpate
  end

  def show
  end

private

end
