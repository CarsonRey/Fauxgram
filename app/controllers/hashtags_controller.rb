class HashtagsController < ApplicationController

  def search

  end

  def search_result

    if @hashtag = search_by_hashtag(params[:hashtag][:hashtag])
      @pictures = @hashtag.pictures
    else
      @hashtag = nil
    end

  end
end
