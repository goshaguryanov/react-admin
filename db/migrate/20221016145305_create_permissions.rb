class CreatePermissions < ActiveRecord::Migration[7.0]
  def change
    create_table :permissions do |t|
      t.references :admin_user, null: false, foreign_key: true
      t.string :subject
      t.string :verb
      t.boolean :can

      t.timestamps
    end
  end
end
