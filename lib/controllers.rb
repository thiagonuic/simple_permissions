module SimplePermissions
  module ControllerMethods
    include SimplePermissionsHelper
  end
end


ActionController::Base.send :include, SimplePermissions::ControllerMethods