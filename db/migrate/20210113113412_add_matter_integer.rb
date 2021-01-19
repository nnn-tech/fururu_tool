class AddMatterInteger < ActiveRecord::Migration[5.2]
  def change
    add_column :matters, :rwd, :integer
    add_column :matters, :ssl, :integer
  end
end
