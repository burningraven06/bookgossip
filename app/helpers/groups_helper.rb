module GroupsHelper
	def group_admin(user_id)
		current_user.id == user_id ? true : false
	end

	def member_joined(group)
		not_joined = false
		group.memberships.each do |member_check| 
  		if member_check.user_id == current_user.id 
  			not_joined = true
  		end
		end
		return not_joined 
	end

	def show_group_name(some_number)
		instance_group = Group.find_by_id(some_number)
		return instance_group.name
	end
end
