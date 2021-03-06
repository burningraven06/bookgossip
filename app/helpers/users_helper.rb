module UsersHelper

	def age(birthday)
		current_user.date_of_birth ? (Date.today.year - birthday.to_date.year) : (Date.today.year - current_user.created_at.to_date.year)
	end

	def display_birthday(status)
		current_user.date_of_birth ? the_date = (current_user.date_of_birth) : the_date = (current_user.created_at)
		if (status) && (status == 1)
		return "#{the_date.strftime("%B")}/#{the_date.strftime("%d")}/#{the_date.strftime("%Y")}, #{age(current_user.date_of_birth)} Years Old"
		end
		if status && status == 2
			return "#{the_date.strftime("%B")}/#{the_date.strftime("%d")}/#{the_date.strftime("%Y")}"
		end
		if status && status == 3
			return "#{the_date.strftime("%B")}/#{the_date.strftime("%d")}"
		end
		if status && status ==4
			return "#{age(current_user.date_of_birth)} Years Old"
		end
		if status && status ==5
			return "--"
		end
		# end
	end

	def show_user_name(some_number)
		instance_user = User.find_by_id(some_number)
		return instance_user.name
	end

end
