class AddUserIdToContacts < ActiveRecord::Migration[6.1]
  def change
    add_reference :contacts, :user, index: true
  end
end
