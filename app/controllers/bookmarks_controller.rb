# frozen_string_literal: true

class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    movie = Movie.find(params[:bookmark][:movie_id])
    @list = List.find(params[:list_id])
    @bookmark = movie.bookmarks.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save!
      redirect_to list_path(@list)
      #list_bookmarks_path ?
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def create
  #   @movie = Movie.find(params[:movie_id])
  #   @bookmark = Bookmark.new(bookmark_params)
  #   @bookmark.movie = @movie
  #   if @bookmark.save
  #     redirect_to list_path(@bookmark.list)
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
