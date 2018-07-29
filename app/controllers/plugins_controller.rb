class PluginsController < ApplicationController
  before_action :load_resource, only: %i[edit show update destroy]
  before_action :load_all_resources, only: %i[index]
  before_action :create_resource, only: %i[new create]

  def index; end

  def new; end

  def edit; end

  def show; end

  def update
    update_plugin = UpdatePlugin.perform(plugin: @plugin, name: plugin_params[:name])

    if update_plugin.success?
      redirect_to plugin_path(@plugin)
    else
      render :edit
    end
  end

  def destroy; end

  def create
    create_plugin = CreatePlugin.perform(plugin: @plugin, name: plugin_params[:name])

    if create_plugin.success?
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
