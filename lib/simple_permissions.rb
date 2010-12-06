module SimplePermissions
  module Config
    @@current_user_method = :current_user
    @@permissions_method = :permissions
    @@permission_type = :role
    @@user_model = :User
    
    def self.user_model
      @@user_model
    end
    
    def self.user_model=(value)
      @@user_model = value
    end
    
    def self.permission_type
      @@permission_type
    end
    
    def self.permission_type=(value)
      @@permission_type = value
    end
    
    def self.current_user_method
      @@current_user_method
    end
    
    def self.current_user_method=(value)
      @@current_user_method = value
    end
    
    def self.permissions_method
      @@permissions_method
    end
    
    def self.permissions_method=(value)
      @@permissions_method = value
    end
  end
end

require 'exceptions'
require 'user_model'
require 'helpers'
require 'controllers'