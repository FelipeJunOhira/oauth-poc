module Oauth
  class Application < ApplicationRecord
    self.table_name = 'oauth_applications'

    attribute :uid, default: -> { SecureRandom.uuid }
    attribute :secret, default: -> { SecureRandom.hex(64) }

    belongs_to :owner, class_name: 'Developer'
  end
end
