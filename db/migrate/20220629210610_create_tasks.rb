# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.belongs_to :project, foreign_key: true
      t.datetime :deadline
      t.integer :position
      t.boolean :is_done, default: false

      t.timestamps
    end
  end
end
