class CreatePlugin < ActiveRecord::Migration[5.1]
  def change
    create_table :plugins do |t|
      t.string :name, unique: true, null: false
      t.string :s3_ref, unique: true

      t.timestamps
    end
  end
end
