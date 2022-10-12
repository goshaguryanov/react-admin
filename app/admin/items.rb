ActiveAdmin.register Item do
  # decorate_with ItemDecorator
  index do
    form_for_filterrific filterrific do |f|
      content_tag :div do
        'Search'
        f.text_field(
          :search_query,
          class: 'filterrific-periodically-observed'
        )
      end
      content_tag :div do
        'Country'
        f.select(
          :with_owner_id,
          filterrific.select_options[:with_owner_id],
          { include_blank: '- Any -' }
        )
      end
      content_tag :div do
        'Registered after'
        f.text_field(:with_created_at_gte, class: 'js-datepicker')
      end
      content_tag :div do
        'Sorted by'
        f.select(:sorted_by, filterrific.select_options[:sorted_by])
      end
      content_tag :div do
        link_to(
          'Reset filters',
          reset_filterrific_url
        )
      end
      content_tag :div do
        render_filterrific_spinner
      end
      content_tag :div, id: 'filterrific_results' do
        content_tag :div do
          page_entries_info collection # provided by will_paginate
        end
        content_tag :div do
          # table_component fetch_url: admin_items_path(format: :json),
          #                   columns: %w[id name email]
          content_tag :table do
            content_tag :tr do
              content_tag :th, 'Id'
              content_tag :th, 'Name'
              content_tag :th, 'Email'
              content_tag :th, 'Owner'
              content_tag :th, 'Registered'
            end
            decorated_collection.each do |resource|
              content_tag :tr do
                content_tag :td, link_to(resource.id, resource_path(resource))
                content_tag :td, resource.name
                content_tag :td, resource.email
                content_tag :td, resource.owner.email
                content_tag :td, resource.created_at
              end
            end
          end
          will_paginate collection
        end
      end
    end
  end

  controller do
    def show
      show! do |format|
        format.json do
          render json: resource
        end
      end
    end

    def index
      index! do |format|
        @filterrific = initialize_filterrific(
          resource_class,
          params[:filterrific],
          select_options: {
            sorted_by: resource_class.options_for_sorted_by,
            with_owner_id: AdminUser.options_for_select
          },
          persistence_id: 'shared_key',
          default_filter_params: {},
          available_filters: %i[sorted_by with_owner_id],
          sanitize_params: true
        ) || return

        @items = @filterrific.find.page(params[:page])
        @decorated_collection = ItemDecorator.decorate_collection(collection)

        format.json do
          render json: collection,
                 each_serializer: ItemSerializer,
                 root: false
        end
      end
    end

    def extra_headers
      [
        helpers.javascript_pack_tag('active_admin')
      ]
    end
  end
end
