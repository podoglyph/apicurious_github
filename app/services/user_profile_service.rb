# class UserProfileService
#
#   def initialize(user)
#     @name = user.username
#     @image_url = user.image_url
#     @token = user.token
#     @conn = Faraday.new("https://api.github.com")
#   end
#
#   def get_profile
#     raw_user_profile = conn.get "/user?access_token=#{access_token}"
#
#     JSON.parse(raw_user_profile.body, symbolize_names: true)
#   end
#
#   def self.get_profile(user)
#     new(user).get_profile
#   end
#
#   private
#     attr_reader :username, :image_url, :conn, :user, :token
#
#     def access_token
#       token
#     end
#
# end
