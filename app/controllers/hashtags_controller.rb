class HashtagsController < ApplicationController
  def index
    @hashtags = Hashtag.all
  end

  def create
    @hashtag = Hashtag.new(resource_params)
    if @hashtag.save
      flash[:success] = "Object successfully created"
      redirect_to hashtags_url
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def destroy
    @hashtag = Hashtag.find(params[:id])
    if @hashtag.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to hashtags_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to hashtags_url
    end
  end
  

  private
  def resource_params
    params.require(:hashtag).permit(:descricao)
  end
end
