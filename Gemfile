source 'https://rubygems.org'
ruby "2.7.1"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.3'
#'>= 5.0.0.beta1.1', '< 5.1'
# gem 'rails', github: "rails/rails", ref: "dbf67b3a6f549769c5f581b70bc0c0d880d5d5d1"
# Use postgresql as the database for Active Record
# gem 'pg', '= 1.2.3'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'
# Use Puma as the app server
gem 'puma'

gem 'awesome_print'

gem 'active_model_serializers', '~> 0.10.0'#, :git => "git://github.com/rails-api/active_model_serializers"

gem 'fog-aws'

gem 'mime-types', '~> 3.3.1'

gem 'sucker_punch', '~> 2.1.2'

gem 'friendly_id', '~> 5.1.0'

gem 'carrierwave'

# for basic search functionality
gem 'ransack', '~> 2.3.2'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

gem 'rack', '~> 2.2.6'

# gem 'rails_12factor', group: :production

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'pry'
end

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Pretty DB diagrams
  gem "rails-erd"
end
group :production do
  gem 'pg', '1.2.3'
  gem 'rails_12factor'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
