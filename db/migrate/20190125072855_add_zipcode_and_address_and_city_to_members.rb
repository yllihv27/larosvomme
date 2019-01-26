class AddZipcodeAndAddressAndCityToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :zipcode, :string
    add_column :members, :address, :string
    add_column :members, :city, :string
  end
end
