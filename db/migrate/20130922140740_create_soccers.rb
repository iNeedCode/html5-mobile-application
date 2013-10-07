class CreateSoccers < ActiveRecord::Migration
  def change
    create_table :soccers do |t|
      t.string :game_id
      t.string :team_a
      t.integer :result_a, default: 0
      t.string :team_b
      t.integer :result_b, default: 0
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
