json.members do
	json.array!(@members) do |member|
		json.first_name member.first_name + ' ' + member.last_name
		json.id member.id
		json.url member_path(member)
	end
end
json.children do
	json.array!(@children) do |child|
		json.first_name child.first_name + ' ' + child.last_name
		json.id child.id
		json.url child_path(child)
	end
end
