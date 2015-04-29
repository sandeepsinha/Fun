class ChangePrimaryKeyToEmpIdInUsers < ActiveRecord::Migration
  def change
    remove_column :users, :id
    execute "ALTER TABLE users ADD PRIMARY KEY (emp_id);"
  end
end
