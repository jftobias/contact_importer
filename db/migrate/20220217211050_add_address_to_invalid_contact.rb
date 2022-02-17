class AddAddressToInvalidContact < ActiveRecord::Migration[6.1]
  def change
    add_column :invalid_contacts, :address, :string
  end
end
