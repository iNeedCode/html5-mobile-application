class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text :comment
      t.string :rating

      t.timestamps
    end
  end
end
