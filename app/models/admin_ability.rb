class AdminAbility
  include CanCan::Ability

  def initialize(user)
    user.permissions.each do |permission|
      if permission.can?
        can permission.action, permission.model
      else
        cannot permission.action, permission.model
      end
    end
  end
end
