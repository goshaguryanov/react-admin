module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    protected

    def find_verified_user
      session_key = cookies.encrypted[Rails.application.config.session_options[:key]]
      verified_id = session_key['warden.user.admin_user.key']&.[](0)&.[](0)
      verified_user = AdminUser.find_by(id: verified_id)
      return reject_unauthorized_connection unless verified_user

      verified_user
    end
  end
end
