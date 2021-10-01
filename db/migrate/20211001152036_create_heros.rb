class CreateHeros < ActiveRecord::Migration[6.1]
  def change
    create_table :heros do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
