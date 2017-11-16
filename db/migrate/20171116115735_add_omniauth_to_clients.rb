class AddOmniauthToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :provider, :string
    add_column :clients, :uid, :string
    add_column :clients, :facebook_picture_url, :string
    add_column :clients, :first_name, :string
    add_column :clients, :last_name, :string
    add_column :clients, :token, :string
    add_column :clients, :token_expiry, :datetime
  end
end
