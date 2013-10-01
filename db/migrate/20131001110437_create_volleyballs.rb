class CreateVolleyballs < ActiveRecord::Migration
  def change
    create_table :volleyballs do |t|
      t.string :team_a
      t.integer :result_a
      t.string :team_b
      t.integer :result_b
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
