class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :site, index: true
      t.references :user, index: true
      t.string :title
      t.text :body_source
      t.text :body

      t.timestamps
    end
  end
end
