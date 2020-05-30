module OAuth
  class AccessGrant < ApplicationRecord
    self.table_name = 'oauth_access_grants'

    include ::Doorkeeper::Orm::ActiveRecord::Mixins::AccessGrant

    belongs_to :resource_owner, polymorphic: true
  end
end
