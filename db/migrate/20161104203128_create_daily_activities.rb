class CreateDailyActivities < ActiveRecord::Migration
  def change
    create_table :daily_activities do |t|
      t.integer  :user_id, :null => false
      t.text     :highs
      t.text     :lows

      t.timestamps  null: false
    end 
  end
end
