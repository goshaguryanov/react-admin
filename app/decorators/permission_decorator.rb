class PermissionDecorator < Draper::Decorator
  delegate_all
  MODELS = %w[
    ability
    admin_user
    application_record
    concerns
    item
    permission
  ]

  class << self
    def admin_users
      AdminUser.pluck(:email, :id)
    end

    def models
      MODELS.map {|model| [model, model]}
    end

    def actions
      inferred_object_class::VERBS.map {|verb| [verb, verb]}
    end
  end

  def admin_user
    h.link_to model.admin_user.email, [:admin, model.admin_user]
  end
end
