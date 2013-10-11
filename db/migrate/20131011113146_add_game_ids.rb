class AddGameIds < ActiveRecord::Migration
  def up
  	add_column :crickets, :game_id, :string
  	add_column :basketballs, :game_id, :string
  	add_column :volleyballs, :game_id, :string
  	add_column :international_volleyballs, :game_id, :string
  end

  def down
  	remove_column :crickets, :game_id, :string
  	remove_column :basketballs, :game_id, :string
  	remove_column :volleyballs, :game_id, :string
  	remove_column :international_volleyballs, :game_id, :string  	
  end
end
