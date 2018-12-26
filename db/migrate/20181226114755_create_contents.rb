class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :title
      t.text :text
      t.string :url
      t.integer :placement

      t.timestamps
    end
  end
end
