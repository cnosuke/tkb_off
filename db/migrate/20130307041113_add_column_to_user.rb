class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :real_name, :string
    add_column :users, :unit, :string
    add_column :users, :student_num, :string
    add_column :users, :comment, :string
    add_column :users, :message, :string
  end
end
