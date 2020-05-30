module OAuth
  class Application < ApplicationRecord
    self.table_name = 'oauth_applications'

    include ::Doorkeeper::Orm::ActiveRecord::Mixins::Application

    attribute :uid, default: -> { SecureRandom.uuid }

    belongs_to :owner, class_name: 'Developer'
  end
end
