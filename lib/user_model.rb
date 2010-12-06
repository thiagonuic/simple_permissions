module SimplePermissions
  module UserModelMethods
    
    def has_permission_role!(permission_code)
      raise SimplePermissions::AccessDeniedException if !self.has_permission_role(permission_code)
    end
    
    def has_permission_role(permission_code)
      profile_permissions = self.send SimplePermissions::Config.permissions_method
      
      profile_permissions.each do |per_code|
        if permission_code.to_s == per_code.to_s
          return true
        end
      end
      return false
    end
    
    def has_permission_read_write!(permission_code, read_write)
      raise SimplePermissions::AccessDeniedException if !self.has_permission_read_write(permission_code, read_write)
    end
    
    def has_permission_read_write(permission_code, read_write)
      profile_permissions = self.send SimplePermissions::Config.permissions_method

      profile_permissions.each do |per_code, per_read_write|
        if permission_code.to_s == per_code.to_s
          if read_write.to_s == 'w'
            if per_read_write.to_s == 'w'
              return true
            end
          else
            return true
          end
        end
      end
      return false
    end
    
  end
end