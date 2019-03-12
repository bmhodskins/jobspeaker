class AddSeriesIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :series_id, :integer
  end
end
