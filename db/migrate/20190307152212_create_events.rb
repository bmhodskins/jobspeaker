class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.string :from_time
      t.string :to_time
      t.string :date

      t.timestamps
    end
  end
end
