class CreatePageHistories < ActiveRecord::Migration
  def change
    create_table :page_histories do |t|
      t.references :page, index: true
      t.string :title
      t.text :body_source
      t.text :body

      t.timestamps
    end
  end
end
