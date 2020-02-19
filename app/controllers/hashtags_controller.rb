class HashtagsController < ApplicationController
  def index
    @hashtags = Hashtag.all
  end

  def new
    @hashtag = Hashtag.new
  end

  def create
    @hashtag = Hashtag.new(resource_params)
    if @hashtag.save
      flash[:success] = "Hashtag criada com sucesso!"
      redirect_to hashtags_url
    else
      flash[:error] = @hashtag.errors.full_messages.join(' - ')
      render 'new'
    end
  end

  def destroy
    @hashtag = Hashtag.find(params[:id])
    if @hashtag.destroy
      flash[:success] = 'Hashtag deletada com sucesso!'
      redirect_to hashtags_url
    else
      flash[:error] = @hashtag.errors.full_messages.join(' - ')
      redirect_to hashtags_url
    end
  end

  private
  def resource_params
    params.require(:hashtag).permit(:descricao)
  end
end
