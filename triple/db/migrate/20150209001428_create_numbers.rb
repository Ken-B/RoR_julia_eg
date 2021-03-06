class CreateNumbers < ActiveRecord::Migration
  def change
    create_table :numbers do |t|
      t.float :value
      t.float :result
      t.boolean :calculated, default: false

      t.timestamps null: false
    end
  end
end
