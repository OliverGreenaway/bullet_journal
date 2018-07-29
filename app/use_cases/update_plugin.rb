class UpdatePlugin
  include UseCase

  attr_reader :plugin

  def initialize(plugin:, name:)
    @plugin = plugin
    @name = name
  end

  def perform
    assign_name_and_s3_ref
    save_plugin
  end

  private

  def assign_name_and_s3_ref
    @plugin.name = @name
  end

  def save_plugin
    if @plugin.valid?
      @plugin.save
    else
      errors.add(:plugin)
    end
  end
end
