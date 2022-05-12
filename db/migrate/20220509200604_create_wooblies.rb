class CreateWooblies < ActiveRecord::Migration[6.1]
  def change
    create_table :wooblies do |t|
      
      t.string :name

      t.belongs_to :user, null: false, foreign_key: true
      # t.bigInt :user_id

      t.timestamps
    end
  end
end
