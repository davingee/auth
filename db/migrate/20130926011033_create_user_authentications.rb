class CreateUserAuthentications < ActiveRecord::Migration
  def change
    create_table :user_authentications do |t|
      t.string :provider
      t.string :uid
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.integer :user_id
      t.timestamps
    end
  end
end
