class AddImageToCats < ActiveRecord::Migration[6.0]
  def change
    add_column :cats, :image, :string
  end
end
