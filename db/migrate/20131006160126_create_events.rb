class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :place
      t.datetime :startime
      t.datetime :endtime

      t.timestamps
    end
  end
end
