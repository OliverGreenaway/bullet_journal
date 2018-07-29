class CreatePlugin
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
    @plugin.s3_ref = @name
                     .downcase               # remove Uppercase characters
                     .gsub(/[_.,]/, ' ')     # keep spacing characters by converting to whitespace
                     .gsub(/[^0-9a-z ]/, '') # remove unwanted characters
                     .strip                  # strip any surrounding whitespace
                     .tr(' ', '-')           # convert whitespace to dashes
  end

  def save_plugin
    if @plugin.valid?
      @plugin.save
    else
      errors.add(:plugin)
    end
  end
end
