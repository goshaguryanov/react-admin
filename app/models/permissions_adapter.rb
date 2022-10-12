class PermissionsAdapter < ActiveAdmin::AuthorizationAdapter

  def authorized?(action, subject = nil)
    ability = AdminAbility.new(user)
    result = ability.can? action, subject
    puts "action: #{action}, subject #{subject} result #{result}"
    result
  end

end
