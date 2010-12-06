module SimplePermissionsHelper
  def has_permission(p_permissions)
    logged_user = self.send SimplePermissions::Config.current_user_method
		has_access = false
		
		if (p_permissions.class == String)
		  permissions = [p_permissions]
	  else
	    permissions = p_permissions
    end
		
		if SimplePermissions::Config.permission_type == :read_write
      permissions.each do |permission, read_write|
        if logged_user.has_permission_read_write(permission, read_write)
          has_access = true
        end
      end
    elsif SimplePermissions::Config.permission_type == :role
      permissions.each do |permission|
        if logged_user.has_permission_role(permission)
          has_access = true
        end
      end
    end
    
		return has_access
  end
end

ActionView::Base.send :include, SimplePermissionsHelper