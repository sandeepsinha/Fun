class RemoveDateAndTimeAddTimestamp < ActiveRecord::Migration
  def change
    remove_columns :events, :date, :time
    add_column :events, :time, :timestamp
  end
end
