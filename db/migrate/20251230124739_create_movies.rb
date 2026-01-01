class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.date :release_date
      t.string :director
      t.string :actor

      t.timestamps
    end
  end
end
