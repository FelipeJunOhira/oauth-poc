class CreateDevelopers < ActiveRecord::Migration[5.2]
  def change
    create_table :developers do |t|
      t.string :email
      t.string :password_digest
    end
    add_index :developers, :email
  end
end
