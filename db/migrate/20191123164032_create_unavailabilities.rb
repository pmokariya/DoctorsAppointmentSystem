class CreateUnavailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :unavailabilities do |t|
      t.integer :slot
      t.date :date
      t.time :start_time
      t.time :end_time
      t.boolean :is_available, default: false
      t.integer :doctor_id

      t.timestamps
    end
  end
end
