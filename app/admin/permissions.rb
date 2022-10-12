ActiveAdmin.register Permission do
  decorate_with PermissionDecorator

  permit_params do
    [:admin_user_id, :subject, :verb, :can]
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :admin_user, collection: PermissionDecorator.admin_users
      f.input :subject, collection: PermissionDecorator.models
      f.input :verb, collection: PermissionDecorator.actions
      f.input :can
    end
    f.actions
  end
end
