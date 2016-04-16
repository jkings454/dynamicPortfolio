class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|

      t.timestamps null: false
      t.string :name
      t.text :content
      t.belongs_to :post, index: true
    end
  end
end
