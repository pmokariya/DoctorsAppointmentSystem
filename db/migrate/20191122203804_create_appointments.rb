class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.date :appointment_date
      t.integer :slot
      t.string :status, default: "Pending"
      t.string :details
      t.time :start_time
      t.time :end_time
      t.integer :doctor_id
      t.integer :patient_id

      t.timestamps
    end
  end
end
