# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  content do
    # react_component 'CLI', { greeting: '->' }
    # react_component 'WS'
    # react_component 'Items', { fetch_url: admin_items_path(format: :json) }
    react_component 'PhantomJS'
  end

  controller do
    def extra_headers
      [
        # helpers.javascript_pack_tag('application'),
        # helpers.javascript_pack_tag('action_cable'),
        # helpers.javascript_pack_tag('render_components')
      ]
    end
  end

end
