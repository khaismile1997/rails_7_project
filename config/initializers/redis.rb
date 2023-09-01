require 'redis'

config = YAML::load(ERB.new(IO.read("#{Rails.root}/config/redis.yml")).result)[Rails.env].symbolize_keys
$redis = Redis.new(config.merge(ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE }))
