class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :firstname, :string
    add_column :users, :surname, :string
    add_column :users, :birthdate, :date
    add_column :users, :gender, :string
  end
end
