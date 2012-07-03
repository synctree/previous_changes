module PreviousChanges
  module Extensions
    def self.included(base)
      base.class_eval do
        after_validation :save_changes, :on => :update
      end
    end
    
    def save_changes
      @previous_changes = changes
    end
    
    def previous_changes
      @previous_changes
    end
  end
end

ActiveRecord::Base.class_eval { include PreviousChanges::Extensions }
