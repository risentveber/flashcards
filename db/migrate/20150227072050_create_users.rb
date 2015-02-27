class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password

      t.timestamps
    end

    add_column :cards, :user_id, :integer
  end
end
