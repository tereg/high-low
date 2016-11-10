class RemoveColumnsUsers < ActiveRecord::Migration
  def change
    remove_columns(:users, :first_name, :last_name)
  end
end
