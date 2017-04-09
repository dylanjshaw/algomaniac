class AddDatesToNotes < ActiveRecord::Migration[5.0]
  def change
      add_column :notes, :date, :datetime
  end
end
