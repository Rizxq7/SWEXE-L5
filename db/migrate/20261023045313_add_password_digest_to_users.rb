
class AddPasswordDigestToUsers < ActiveRecord::Migration[8.1]
  def up
    add_column :users, :password_digest, :string

    execute <<~SQL
      UPDATE users
      SET password_digest = pass
      WHERE pass IS NOT NULL
    SQL
  end

  def down
    remove_column :users, :password_digest
  end
end
