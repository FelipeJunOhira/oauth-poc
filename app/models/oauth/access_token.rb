module Oauth
  class AccessToken < ApplicationRecord
    self.table_name = 'oauth_access_tokens'

    include ::Doorkeeper::Orm::ActiveRecord::Mixins::AccessToken

    belongs_to :resource_owner, polymorphic: true
  end
end
