class CreateEventAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :event_attendances do |t|
      t.bigint :attendee_id
      t.bigint :attended_event_id

      t.timestamps
    end
  end
end
