class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
  end
end
