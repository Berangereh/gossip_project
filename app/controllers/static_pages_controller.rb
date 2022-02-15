class StaticPagesController < ApplicationController

  def team
  end

  def contact
  end

  def welcome
    @first_name = params[:first_name] 
  end

  def author
    @author_id = params[:author_id]
  end

  def city
    @city_id = params[:city_id]
    @gossip_id = params[:gossip_id]
    @gossip = Gossip.all
    @user = User.all
  end
end
