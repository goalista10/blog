class CreateBloggers < ActiveRecord::Migration[6.1]
  def change
    create_table :bloggers do |t|
      t.string :name
      t.integer :level

      t.timestamps
    end
  end
end
