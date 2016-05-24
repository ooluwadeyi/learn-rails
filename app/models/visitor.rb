class Visitor
	include ActiveModel::Model 
	attr_accessor :email, :string
	validates_presence_of :email
	validates_format_of :email, with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
	
	def subscribe
		begin			
			
		mailchimp = Gibbon::Request.new(api_key: Rails.application.secrets.mailchimp_api_key)
		member_id = Digest::MD5.hexdigest(self.email.downcase)
		list_id = Rails.application.secrets.mailchimp_list_id
		result = mailchimp.lists(list_id).members(member_id).upsert(body: {email_address: self.email, status: 'subscribed'})
		Rails.application.logger.info("subscribed #{self.email} to Mailchimp") if result

		rescue Exception => e
			

		end	

	   

	end

end	
		