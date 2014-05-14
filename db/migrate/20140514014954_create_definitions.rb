class CreateDefinitions < ActiveRecord::Migration
  def change
    create_table :definitions do |t|
      t.text :meaning
      t.text :example

      t.references :word
      t.timestamps
    end
  end
end
