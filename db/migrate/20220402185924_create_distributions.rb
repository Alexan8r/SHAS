class CreateDistributions < ActiveRecord::Migration[6.1]
  def change
    create_table :distributions do |t|
      t.string :title
      t.string :body
      t.string :email
      t.integer :time
      t.boolean :randomizer

      t.timestamps
    end
  end
end
