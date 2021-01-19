class CreateMatters < ActiveRecord::Migration[5.2]
  def change
    create_table :matters do |t|
      t.string :name

      t.timestamps
    end
  end
end
