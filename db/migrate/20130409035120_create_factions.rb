class CreateFactions < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.column :name, :string

      t.timestamps
    end
  end
end
