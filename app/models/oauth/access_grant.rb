module Oauth
  class AccessGrant < ApplicationRecord
    self.table_name = 'oauth_access_grants'

    belongs_to :resource_owner, polymorphic: true
  end
end
