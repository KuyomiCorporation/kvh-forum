# frozen_string_literal: true

class AddSkippedToEmailLogs < ActiveRecord::Migration[4.2]
  def change
    add_column :email_logs, :skipped, :boolean, default: false
    add_column :email_logs, :skipped_reason, :string
    add_index :email_logs, %i[skipped created_at]
  end
end
