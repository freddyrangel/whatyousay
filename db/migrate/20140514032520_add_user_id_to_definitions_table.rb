class AddUserIdToDefinitionsTable < ActiveRecord::Migration
  def change
    add_reference :definitions, :user, index: true
  end
end
