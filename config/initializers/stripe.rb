if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key  => ENV['STRIPE_TEST_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_TEST_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => Rails.application.secrets.publishable_key,
    :secret_key => Rails.application.secrets.secret_key
  }
end
Stripe.api_key = Rails.configuration.stripe[:secret_key]
