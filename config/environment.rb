# Load the Rails application.
require_relative 'application'

# config.action_mailer.perform_deliveries = true
# config.action_mailer.raise_delivery_errors = true

# Initialize the Rails application.
Rails.application.initialize!

# Mailer Action Method
# config.action_mailer.delivery_method = :test / :smtp | :sedmail | :file
ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'orders', 'order'
end
