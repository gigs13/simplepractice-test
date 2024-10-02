class InitModels < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name, null: false
      t.timestamps
    end

    create_table :patients do |t|
      t.references :doctor, foreign_key: true
      t.string :name, null: false
      t.timestamps
    end

    create_table :appointments do |t|
      t.references :doctor, foreign_key: true
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
