class CreateHeros < ActiveRecord::Migration[5.1]
  def change
    create_table :heros do |t|
      t.string :name
      t.string :icon
      t.string :image
      t.string :roles, array: true
      t.integer :default_score, default: 0
      t.json :metrics, default: {}
      t.integer :hero_id, default: 0
      t.integer :pro_pick, default: 0
      t.integer :pro_win, default: 0
      t.integer :pro_ban, default: 0
      t.integer :one_pick, default: 0
      t.integer :one_win, default: 0
      t.integer :two_pick, default: 0
      t.integer :two_win, default: 0
      t.integer :three_pick, default: 0
      t.integer :three_win, default: 0
      t.integer :four_pick, default: 0
      t.integer :four_win, default: 0
      t.integer :five_pick, default: 0
      t.integer :five_win, default: 0
    end
  end
end
