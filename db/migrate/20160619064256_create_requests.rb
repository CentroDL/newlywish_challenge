class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :uuid
      t.text :message
      t.references :log, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
