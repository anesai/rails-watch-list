# frozen_string_literal: true

class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
