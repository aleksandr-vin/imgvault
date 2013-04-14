class CommentsController < ApplicationController

  http_basic_authenticate_with :name => "jay", :password => "123", :only => :destroy

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.create(params[:comment])

    if @comment.errors.any?
      render action: "new"
    else
      redirect_to image_path(@image)
    end
  end

  def destroy
    @image = Image.find(params[:image_id])
    @comment = @image.comments.find(params[:id])
    @comment.destroy
    redirect_to image_path(@image)
  end
end
