module Oauth
  class AccessToken < ApplicationRecord
    self.table_name = 'oauth_access_tokens'

    belongs_to :resource_owner, polymorphic: true
  end
end
