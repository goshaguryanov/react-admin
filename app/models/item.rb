class Item < ApplicationRecord
  belongs_to :owner, polymorphic: true

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: %i[
      sorted_by
      search_query
      with_owner_id
      with_created_at_gte
    ]
  )

  scope :sorted_by, -> (val) {}
  scope :search_query, -> (val) {}
  scope :with_owner_id, -> (val) {}
  scope :with_created_at_gte, -> (val) {}

  def self.options_for_sorted_by
    [
      ["Name (a-z)", "name_asc"],
      ["Email (a-z)", "email_asc"],
      ["Registration date (newest first)", "created_at_desc"],
      ["Registration date (oldest first)", "created_at_asc"],
      ["Owner email (a-z)", "owner_email_asc"],
    ]
  end
end
