class AddUserToWritingDefinitions < ActiveRecord::Migration[6.1]
  def change
    add_reference :writing_definitions, :user, foreign_key: true
  end
end
