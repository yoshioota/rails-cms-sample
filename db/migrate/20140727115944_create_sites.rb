class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.references :user, index: true, null: false
      t.string :title
      t.string :aasm_state

      t.references :page

      t.timestamps
    end
  end
end
