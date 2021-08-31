class Title < ActiveRecord::Migration[6.1]
  def change
    add_column :counts, :title, :string
  end
end
