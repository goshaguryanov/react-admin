class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.json :payload
      t.references :owner, polymorphic: true, null: false

      t.timestamps
    end
  end
end
