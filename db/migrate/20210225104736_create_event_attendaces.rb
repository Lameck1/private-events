class CreateEventAttendaces < ActiveRecord::Migration[6.1]
  def change
    create_table :event_attendaces do |t|
      t.bigint :attendee_id
      t.bigint :attended_event_id

      t.timestamps
    end
  end
end
