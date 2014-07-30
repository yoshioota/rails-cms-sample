class CreateSitesMembers < ActiveRecord::Migration
  def change
    create_table :sites_members do |t|
      t.references :site, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
