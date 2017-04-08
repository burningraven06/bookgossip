module GroupsHelper
	def group_admin(user_id)
		current_user.id == user_id ? true : false
	end

	def member_joined(group)
		joined = false
		group.memberships.each do |member_check| 
			if member_check.user_id == current_user.id 
				joined = true
			end
		end
		return joined 
	end

	def show_group_name(some_number)
		instance_group = Group.find_by_id(some_number)
		return instance_group.name
	end

	def check_pending_member(g_id)
		request_pending = false
		if Membership.count>0
			@memberships = Membership.where("group_id = ?", g_id)
			@pending_members = @memberships.where("request_approved = ? ", false)
			@pending_members.each do |user_check|
				if user_check.user_id== current_user.id
					request_pending = true
				end
			end
			return request_pending
		end
	end
end
