class CreateBookingRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :booking_records do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
