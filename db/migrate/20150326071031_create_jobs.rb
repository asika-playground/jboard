class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.integer :min_salary
      t.string :location
      t.string :url
      t.text :description
      t.date :expire

      t.timestamps null: false
    end
  end
end
