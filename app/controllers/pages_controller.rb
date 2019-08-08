class PagesController < ApplicationController
  def home
    @gossips = Gossip.all.order("created_at DESC")
  end
  def team
  end
  def contact
  end
end
