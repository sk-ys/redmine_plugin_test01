class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.boolean :boolean
      t.binary :binary
      t.integer :integer
      t.float :float
      t.string :string
      t.text :text
      t.datetime :datetime
    end
  end
end
