class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :title
      t.string :body
      t.string :email

      t.timestamps
    end
  end
end
