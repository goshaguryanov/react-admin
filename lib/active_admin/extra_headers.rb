module ActiveAdmin
  module ExtraHeaders
    def build_active_admin_head(*args)
      super
      return unless controller.respond_to?(:extra_headers)

      within head do
        controller.extra_headers.each do |extra_header|
          text_node(extra_header)
        end
      end
    end
  end
end
