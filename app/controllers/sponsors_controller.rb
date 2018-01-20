class SponsorsController < ApplicationController
  def show
    @sponsor = Sponsor.find(params[:id])
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
    @sponsor = Sponsor.find(params[:id])
  end
  
  def update
    @sponsor = Sponsor.find(params[:id])
    @sponsor.title = params[:sponsor][:title]
    @sponsor.body = params[:sponsor][:body]
    @sponsor.price = params[:sponsor][:price]
    @topic = Topic.find(params[:topic_id])
    @sponsor.topic = @topic

    if @sponsor.save
      flash[:notice] = "Post was updated."
      redirect_to [@sponsor.topic, @sponsor]
    else
      flash.now[:alert] = 
       "There was an error saving the post. Please try again."
      render :edit
    end
  end
  
  def destroy
    @sponsor = Sponsor.find(params[:id])

    if @sponsor.destroy
      flash[:notice] = "\"#{@sponsor.title}\" was deleted successfully."
      redirect_to @sponsor.topic
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end
end
