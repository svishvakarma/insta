class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :handle
      t.string :name
      t.string :bio
      t.string :user_name
      t.string :email
      t.boolean :deactivated
      t.references :user

      t.timestamps
    end
  end
end
