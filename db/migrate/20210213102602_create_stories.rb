class CreateStories < ActiveRecord::Migration[6.1]
  def change
    create_table :stories do |t|
      t.text :summary
      t.text :description
      t.datetime :completion_time
      t.string :type
      t.string :complexity
      t.integer :cost

      t.timestamps
    end
  end
end
