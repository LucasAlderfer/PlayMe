class CreateHeros < ActiveRecord::Migration[5.1]
  def change
    create_table :heros do |t|
      t.string :name
      t.string :icon
      t.string :attr
      t.string :range
      t.integer :hero_id
      t.integer :pro_pick
      t.integer :pro_win
      t.integer :pro_ban
      t.integer :one_pick
      t.integer :one_win
      t.integer :two_pick
      t.integer :two_win
      t.integer :three_pick
      t.integer :three_win
      t.integer :four_pick
      t.integer :four_win
      t.integer :five_pick
      t.integer :five_win
    end
  end
end
