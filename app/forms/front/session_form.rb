module Front
  class SessionForm
    VALID_TYPES = ['User', 'Developer'].freeze

    include ActiveModel::Model

    attr_accessor :email
    attr_accessor :type
    attr_accessor :password
    attr_reader :user

    validates :email, presence: true
    validates :type, presence: true, inclusion: { in: VALID_TYPES }
    validates :password, presence: true

    validate :credentails_are_valid

    private

    def credentails_are_valid
      return unless email.present? && password.present? && type.present? && type.in?(VALID_TYPES) && errors.empty?

      @user = type.constantize.find_by(email: email).try(:authenticate, password)

      errors.add(:base, :wrong_credentials) unless @user.present?
    end
  end
end
