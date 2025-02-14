class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.integer :status, default: 0
      t.text :description

      t.timestamps
    end
  end
end
