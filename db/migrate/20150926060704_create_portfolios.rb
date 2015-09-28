class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :project
      t.string :description
      t.string :links

      t.timestamps null: false
    end
  end
end
