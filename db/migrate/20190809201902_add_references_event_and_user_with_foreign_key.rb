class AddReferencesEventAndUserWithForeignKey < ActiveRecord::Migration[5.2]
  def change
    add_reference :attendances, :user, foreign_key: { to_table: :users }
    add_reference :attendances, :event, foreign_key: { to_table: :events }
  end
end

