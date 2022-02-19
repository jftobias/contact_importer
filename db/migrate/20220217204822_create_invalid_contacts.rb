class CreateInvalidContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :invalid_contacts do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.date :date_of_birth
      t.string :credit_card
      t.string :franchise
      t.string :message
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
