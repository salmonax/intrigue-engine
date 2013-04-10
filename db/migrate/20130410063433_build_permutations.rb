class BuildPermutations < ActiveRecord::Migration
  def change
    create_table :permutations do |t|
      t.column :faction_id, :string
      t.column :choice_id, :string
      t.column :want_id, :string
      t.column :permutation_id, :string

      t.timestamps
    end

    create_table :choices do |t|
      t.column :name, :string

      t.timestamps
    end

    create_table :wants do |t|
      t.column :name, :string

      t.timestamps
    end
  end
end
