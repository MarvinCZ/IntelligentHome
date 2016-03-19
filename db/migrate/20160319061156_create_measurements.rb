class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.integer :value
      t.belongs_to :device, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
