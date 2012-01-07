module NavigationHelpers
  def path_to(page_name)
    case page_name

    #services
    when /the list of services/
      services_path
    when /a new service/
      new_service_path
    when /edit the service named "([^"]*)"/
      edit_service_path(fetch_service(name: $1))
    
    #subscriptions
    when /a new subscription for user "([^"]*)"/
      new_user_subscription_path(fetch_user(username: $1))  
    end

  end
end

World(NavigationHelpers)

module FetchHelpers
  def method_missing(name, *args, &block)
    if name.to_s =~ /^fetch_(.+)$/
      fetch $1, *args 
    else 
      super
    end 
  end

  private
  def fetch(clazz, options)
    clazz.capitalize.constantize.where(options).first or
      raise "No #{clazz} found for #{options.inspect}"
  end
end

World(FetchHelpers)