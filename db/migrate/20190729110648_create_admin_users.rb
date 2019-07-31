class CreateAdminUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_users do |t|
      t.string :email, null: false
      t.string :name, null:false
      t.string :password_digest, null:false

      t.timestamps
      t.index :email, unique:true
    end
  end
end
