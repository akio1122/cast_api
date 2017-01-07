ruby '2.2.2'
source 'https://rubygems.org'

gem 'rails', '4.1.5'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'spring',        group: :development
gem 'active_model_serializers'
gem 'devise'
gem 'virtus'
gem 'puma'
gem 'rails_12factor', group: :production
gem 'barometer'
gem 'parse-ruby-client'
gem 'activeadmin', github: 'activeadmin'
gem 'koala'
gem 'httparty'
gem 'delayed_job_active_record'
gem 'paperclip', github: 'thoughtbot/paperclip'
gem 'aws-sdk', '< 2.0'
gem 'mandrill-api'
gem 'ckeditor'
gem 'kaminari'
gem 'validate_url'
gem 'country_select', github: 'stefanpenner/country_select'
gem 'newrelic_rpm'
gem 'timezone'

group :test, :development do
  # gem 'debugger'
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'awesome_print'
  gem 'foreman'
  gem 'dotenv-rails'
  gem 'pry-rails'
end

group :test do
  gem 'simplecov', require: false
  gem 'webmock', require: false
  gem 'vcr' # TODO: [README] Beware that sometimes specs can be not passing cause of VCR retracking,
            # so ensure it's not the problem in first place when specs are failing
end
