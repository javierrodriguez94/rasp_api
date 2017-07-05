class CreateFirebases < ActiveRecord::Migration[5.0]
  def change
    create_table :firebases do |t|
      t.string :token
      t.timestamps
    end
  end
end
