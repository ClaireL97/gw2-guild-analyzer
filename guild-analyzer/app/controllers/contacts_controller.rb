class ContactsController < ApplicationController

  def create
    @guild = Guild.find(params[:guild_id])
    @contact = @guild.contacts.create(contact_params)
    redirect_to guild_path(@guild)
  end

   def destroy
    @guild = Guild.find(params[:id])
    @contact = @guild.comments.find(params[:id])
    @contact.destroy
    redirect_to guild_path(@guild)
  end

 private
 def contact_params
    params.require(:contact).permit(:contact_alias, :rank)
  end
end
