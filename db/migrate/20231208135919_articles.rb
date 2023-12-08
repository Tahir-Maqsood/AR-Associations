class Articles < ActiveRecord::Migration[7.1]
  def up
    create_table :articles do |t|
      t.string :name
      t.string :email
      t.string :address
      t.timestamps
    end
  end

  def down
    drop_table :articles
  end
end
