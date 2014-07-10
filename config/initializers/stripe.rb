if Rails.env.development?
  Rails.configuration.stripe = {
  :publishable_key => 'pk_test_7HnXBXvr9j0itLOrAby5Bf5x',
  :secret_key => 'sk_test_AOWatY5dPWmjfPNQFsDjjf1A'
}
elsif Rails.env.production?
  Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLISHABLE_KEY'],
  :secret_key => ENV['SECRET_KEY']
}
end
  
Stripe.api_key = Rails.configuration.stripe[:secret_key]