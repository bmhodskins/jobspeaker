class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.string :how_often
      t.string :from_time
      t.string :to_time
      t.string :day_of_the_week
      t.string :day_of_the_month
      t.string :of_the_param
      t.string :occurs_from_date
      t.string :occurs_to_date

      t.timestamps
    end
  end
end
