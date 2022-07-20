# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
    add_index :projects, %i[name user_id], unique: true
  end
end
