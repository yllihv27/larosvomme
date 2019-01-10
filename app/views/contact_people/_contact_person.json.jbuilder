json.extract! contact_person, :id, :first_name, :last_name, :member_id, :child_id, :course_id, :order_id, :participation_id, :phone, :created_at, :updated_at
json.url contact_person_url(contact_person, format: :json)
