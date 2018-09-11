class CreateMatchups < ActiveRecord::Migration[5.1]
  def change
    create_table :matchups do |t|
      t.json :array#, array: true, default: []
    end
  end
end
