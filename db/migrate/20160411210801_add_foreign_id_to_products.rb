class AddForeignIdToProducts < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.belongs_to :project_group, index: true
    end
  end
end
