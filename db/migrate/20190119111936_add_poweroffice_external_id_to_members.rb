class AddPowerofficeExternalIdToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :poweroffice_external_id, :integer
  end
end
