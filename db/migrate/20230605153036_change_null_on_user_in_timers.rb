class ChangeNullOnUserInTimers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :timers, :user_id, true
  end
end
