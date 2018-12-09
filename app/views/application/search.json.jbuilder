json.members do
	json.array!(@members) do |member|
		json.first_name member.first_name
		json.last_name member.last_name
		json.url member_path(member)
	end
end
