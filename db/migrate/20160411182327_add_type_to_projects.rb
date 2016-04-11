class AddTypeToProjects < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.string :link_type
    end
  end
end
