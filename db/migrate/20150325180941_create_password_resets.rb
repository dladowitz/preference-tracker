class CreatePasswordResets < ActiveRecord::Migration
  def change
    create_table :password_resets do |t|
      t.integer  :user_id
      t.string   :token
      t.datetime :used

      t.timestamps
    end
  end
end
