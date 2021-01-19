class AddMatterString < ActiveRecord::Migration[5.2]
  def change
    add_column :matters, :english, :string
    add_column :matters, :rap, :string
    add_column :matters, :domain, :string
  end
end
