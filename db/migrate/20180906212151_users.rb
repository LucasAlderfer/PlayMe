class Users < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :uid
      t.json :hero_stats, default: {}

      t.timestamps
    end
  end
end
