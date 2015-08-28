class CreateMixTracks < ActiveRecord::Migration
  def change
    create_table :mix_tracks do |t|
      t.integer :mix_id
      t.integer :track_id

      t.timestamps null: false
    end
  end
end
