class BuildPermutations < ActiveRecord::Migration
  def change
    # create_table :permutations do |t|
    #   t.column :party_id, :integer
    #   t.column :choice_id, :integer
    #   t.column :want_id, :integer
    #   t.column :permutation_id, :integer

    #   t.timestamps
    # end

    create_table :parties_wants do |t|
      t.integer :party_id
      t.integer :want_id

      t.timestamps
    end

    create_table :wants_choices do |t|
      t.integer :want_id
      t.integer :choice_id

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
