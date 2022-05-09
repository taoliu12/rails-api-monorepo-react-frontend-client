class CreateWooblySnacks < ActiveRecord::Migration[6.1]
  def change
    create_table :woobly_snacks do |t|

      t.float :price

      t.belongs_to :woobly, null: false, foreign_key: true
        # t.integer :woobly_id

      t.belongs_to :snack, null: false, foreign_key: true
        # t.integer :snack_id


      t.timestamps
    end
  end
end
