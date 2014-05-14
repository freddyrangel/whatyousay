class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :definition
      t.timestamps
    end
  end
end
