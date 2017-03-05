class User < ApplicationRecord
	before_create {generate_token(:remember_token)}
	before_create {generate_token(:account_confirmation_token)}

	has_secure_password

	validates :name, presence: true, length: {maximum:100}
	validates :email, presence: true, uniqueness: true, length: {maximum:100}
	validates :password, length: {minimum:8}, on: :create
	validates :password, length:{minimum: 8} , on: :update_password
	# validates :password_confirmation, length: {minimum:6}, on: :create , on: :update_password, confirmation: true
	validates :account_type, presence: true
	validates :gender, presence: true

	validates :date_of_birth, presence: true, on: :update
	validates :show_birthday_status, presence:true, on: :update
	
	has_many :reviews
	has_many :memberships
	has_many :groups, through: :memberships
	has_many :topics

	def set_gender_avatar
		if self.gender =='Male'
			':style/default_male.png' 
		else
			':style/default_female.png'
		end
	end

	has_attached_file :avatar, styles: {extralarge:"512x512>", large: "256x256>", medium: "128x128>", thumb: "64x64>"}, url: "/uploads/user/:id/:attachment/:style/:basename.:extension", 	default_url: :set_gender_avatar

	validates_attachment_content_type :avatar, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/svg"]
	
	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while User.exists?(column => self[column])
	end

	def send_password_reset
		self.update_column(:password_reset_token, SecureRandom.urlsafe_base64)
		self.update_column(:password_reset_sent_at, Time.zone.now)
		UserMailer.password_reset(self).deliver
	end

	def activate_account
		self.update_column(:account_confirmed, true)
		self.update_column(:account_confirmation_token, nil)
	end

	def start_time
		if self.date_of_birth?
			if self.show_birthday_status = 1 or 2
				date_of_birth
			end
		else
			created_at
		end
	end
	def classification
		"<i class='fa fa-birthday-cake'></i>".html_safe
	end
	def description
		"It's #{name}'s Birthday"
	end

end
