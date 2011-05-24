# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  before_filter :varify_access
  before_filter :authenticate_user!



  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'c7bcecbc50d9d3e1b8be26cce22aa709'
  
protected
  def varify_access
    authenticate_or_request_with_http_basic("Documents Realm") do |username, password|
      username == 'tempuser' && password == 'whatsyied'
    end
  end
end