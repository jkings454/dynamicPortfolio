class CreateProjectGroups < ActiveRecord::Migration
  def change
    create_table :project_groups do |t|

      t.timestamps null: false
      t.string :title
      t.string :image_url
      t.text :description
    end
  end
end
