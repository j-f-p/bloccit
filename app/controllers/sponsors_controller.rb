class SponsorsController < ApplicationController
  def show
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sponsor = Sponsor.new
  end

  def create
    @sponsor = Sponsor.new
    @sponsor.title = params[:sponsor][:title]
    @sponsor.body = params[:sponsor][:body]
    @sponsor.price = params[:sponsor][:price]
    @topic = Topic.find(params[:topic_id])
    @sponsor.topic = @topic
    
    if @sponsor.save
       flash[:notice] = "Sponsored post was saved."
       redirect_to [@topic, @sponsor]
    else
       flash.now[:alert] =
        "There was an error saving the sponsored post. Please try again."
       render :new
    end
  end
  
  def edit
  end
end
