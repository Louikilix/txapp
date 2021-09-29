
class ImagesController < ApplicationController
  def index
  end
  
  def search
    @images = [] # Prepare to store images
    options = {}
    options[:searchType] = "image" # Create an options hash to change search type to images
    # Perform search on random word
    results = GoogleCustomSearchApi.search(params[:image], options)
    results.items.each do |item|
      @images.push(item.link)
    end
  end


end