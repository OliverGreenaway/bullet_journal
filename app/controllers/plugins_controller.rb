class PluginsController < ApplicationController
  before_action :load_resource, only: [:edit, :show, :update, :destroy]
  before_action :load_all_resources, only: [:index]
  before_action :create_resource, only: [:new, :create]

  def index; end
  def new; end
  def edit; end
  def show; end
  def update; end
  def destroy; end

  def create
    @plugin.name = plugin_params[:name]

    @plugin.s3_ref = @plugin.name.downcase               # remove Uppercase characters
                                 .gsub(/[_.,]/,' ')      # keep spacing characters by converting to whitespace
                                 .gsub(/[^0-9a-z ]/, '') # remove unwanted characters
                                 .strip                  # strip any surrounding whitespace
                                 .gsub(' ','-')          # convert whitespace to dashes

    if @plugin.valid?
      @plugin.save
      redirect_to plugin_path(@plugin)
    else
      render :new
    end
  end


  private

  def plugin_params
    params.require(:plugin).permit(:name)
  end

  def load_resource
    @plugin = Plugin.find(params[:id])
  end

  def load_all_resources
    @plugins = Plugin.all
  end

  def create_resource
    @plugin = Plugin.new
  end
end
