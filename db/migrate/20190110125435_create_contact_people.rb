class CreateContactPeople < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_people do |t|
      t.string :first_name
      t.string :last_name
      t.integer :member_id
      t.integer :child_id
      t.integer :course_id
      t.integer :order_id
      t.integer :participation_id
      t.string :phone
      t.string :relation

      t.timestamps
    end
  end
end
