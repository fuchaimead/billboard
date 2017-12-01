class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.belongs_to :song, foreign_id: true

      t.timestamps
    end
  end
end
