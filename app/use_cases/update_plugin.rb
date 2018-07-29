class UpdatePlugin
  include UseCase

  attr_reader :plugin

  def initialize(plugin:, params:)
    @plugin = plugin
    @name = params[:name]
    @html_file_url = params[:html_file_url]
    @javascript_file_url = params[:javascript_file_url]
    @css_file_url = params[:css_file_url]
  end

  def perform
    assign_name
    assign_file_paths
    save_plugin
  end

  private

  def assign_name
    @plugin.name = @name
  end

  def assign_file_paths
    @plugin.html_file_url = @html_file_url
    @plugin.javascript_file_url = @javascript_file_url
    @plugin.css_file_url = @css_file_url
  end

  def save_plugin
    if @plugin.valid?
      @plugin.save
    else
      errors.add(:plugin)
    end
  end
end
