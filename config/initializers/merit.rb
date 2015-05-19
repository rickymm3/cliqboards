# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  config.add_observer 'ReputationChangeObserver'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  config.current_user_method = 'current_user'
end

# Create application badges (uses https://github.com/norman/ambry)
badge_id = 0
[{
  id: (badge_id = badge_id+1),
  name: 'just-registered'
},{
  id: (badge_id = badge_id+1),
  name: "first-post",
  description: "Congrats on your first post!"
},{
  id: (badge_id = badge_id+1),
  name: "multi-poster",
  description: "10 Posts! WOWOWOW!"
},{
  id: (badge_id = badge_id+1),
  name: "flash-poster",
  description: "You received a flash message"
},{
  id: (badge_id = badge_id+1),
  name: "super-poster",
  description: "You have posted a TON of messages!"
}].each do |attrs|
  Merit::Badge.create! attrs
end