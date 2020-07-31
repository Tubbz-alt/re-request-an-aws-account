class AdministratorsForm
  include ActiveModel::Model

  attr_reader :admin_users
  validates_format_of :admin_users,
                      with: EmailValidator.allowed_emails_regexp,
                      message: 'should be a list of approved emails'
  validates_each :admin_users do |record, attr, value|
    record.errors.add attr, 'is required' if value.nil? || value.empty?
  end

  def initialize(hash)
    params = hash.with_indifferent_access
    @admin_users = params[:admin_users]
  end
end
