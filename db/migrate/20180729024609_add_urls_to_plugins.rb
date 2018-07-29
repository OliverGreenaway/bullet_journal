class AddUrlsToPlugins < ActiveRecord::Migration[5.1]
  def change
    add_column :plugins, :html_file_url, :string
    add_column :plugins, :javascript_file_url, :string
    add_column :plugins, :css_file_url, :string
  end
end
