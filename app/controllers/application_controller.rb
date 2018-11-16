class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :set_previous_url
  helper_method :previous_url

    def set_previous_url
      if request.method == :get && session[:previous_url] != session[:current_url]
        session[:previous_url] == session[:current_url]
        session[:current_url] = request.url
      end
    end

    def previous_url
      @last_page = session[:previous_url]
    end


  def index

  end


  def current_user
    if session[:user_id] == nil
      # redirect_to users_path
      return nil
    else
    @current_user = User.find(session[:user_id])
    end
  end

  # def find_current_user
  #   @current_user = User.find(session[:user_id])
  # end

  def authorization?
   current_user.id == params[:id].to_i
  end

  def authorized_on_picture
     current_user.id == params[:user_id].to_i
  end

  def current_user_follows?
    @user = User.find(params[:id])
    current_user.followees.include?(@user)
  end

  def hashtag_check(content)
    hashtag = []
    #final hashtag array
    array1 = content.split(" ")
    #split content by space
    array2 = array1.select{|element| element.include?("#")}
    #all the word has the #
    array3 = []
    #all the word has the # not at the beginning
    array2.each{|element|
      if element[0] == "#"
        hashtag << element
      else
        array3 << element
      end
    }
    array4 = []
    array3.map!{|element| array4 << element.split("#").flatten.drop(1)}
    array4.flatten!

    hashtag << array4.map{|element| element = "#" + element}

    @content_hashtags = hashtag.flatten!
  end



  def find_or_create_by
    @content_hashtags.each do |element|
      @hashtag = Hashtag.find_or_create_by(hashtag: element)
      PictureHashtag.create(hashtag_id: @hashtag.id, picture_id: params[:picture_id])
    end
  end

  def search_by_hashtag(hashtag)
    hashtag = "#" + hashtag
    @hashtag = Hashtag.find_by(hashtag: hashtag)
  end

  







end
