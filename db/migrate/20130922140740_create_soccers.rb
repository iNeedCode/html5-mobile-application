class CreateSoccers < ActiveRecord::Migration
  def change
    create_table :soccers do |t|
      t.string :team_a
      t.string :team_b
      t.string :round
      t.string :group
      t.string :place
      t.integer :duration
      t.datetime :startime
      t.datetime :endtime

      t.timestamps
    end
  end
end
