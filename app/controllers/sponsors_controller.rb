class SponsorsController < ApplicationController
  def show
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sponsor = Sponsor.new
  end

  def edit
  end
end
