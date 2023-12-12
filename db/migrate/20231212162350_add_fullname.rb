class AddFullname < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :fullname, :string, null: false, default: "John Doe"
  end
end
