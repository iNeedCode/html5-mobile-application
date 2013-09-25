class AddResultsToSoccers < ActiveRecord::Migration
  def change
    add_column :soccers, :result_a, :integer, default: 0
    add_column :soccers, :result_b, :integer, default: 0
  end
end
