module SimplePermissions
  module ControllerMethods
    include SimplePermissionsHelper
    
    def has_permission!(permissions = {})
      raise SimplePermissions::AccessDeniedException if !self.has_permission(permissions)
    end
    
  end
end


ActionController::Base.send :include, SimplePermissions::ControllerMethods