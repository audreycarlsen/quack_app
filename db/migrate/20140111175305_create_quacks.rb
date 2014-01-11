class CreateQuacks < ActiveRecord::Migration
  def change
    create_table :quacks do |t|
      t.text :body
      t.string :author

      t.timestamps
    end
  end
end
