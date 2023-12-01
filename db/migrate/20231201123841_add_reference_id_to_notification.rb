# frozen_string_literal: true

class AddReferenceIdToNotification < ActiveRecord::Migration[7.0]
  def up
    add_column :notifications, :reference_id, :integer, null: true
    add_index :notifications, :reference_id
  end

  def down
    remove_index :notifications, :reference_id
    remove_column :notifications, :reference_id
  end
end
