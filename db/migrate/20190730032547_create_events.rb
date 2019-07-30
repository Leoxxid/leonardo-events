class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :action
      t.string :state
      t.string :locked
      t.references :issue, foreign_key: true

      t.timestamps
    end
  end
end
