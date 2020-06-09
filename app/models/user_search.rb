class UserSearch
  include ActiveModel::Model

  attr_accessor :search_name, :search_email

  def execute
    User.ransack(name_eq: @search_name, email_eq: @search_email).result
  end
end
