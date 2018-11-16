class HashtagsController < ApplicationController

  def search


  end

  def search_result

    if @hashtag = search_by_hashtag(params[:hashtag][:hashtag])
      @pictures = @hashtag.pictures
    else  
      @error = 1
      render :search
    end

  end
end
