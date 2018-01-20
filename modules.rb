
module Developer
  attr_accessor :made
end


module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end


  module ClassMethods
    @@instances = 0

    def instances
      @@instances
    end

    def instances=(inst)
      @@instances=inst
    end
  end

  module InstanceMethods
    
    private

    def register_instance
      self.class.instances += 1
    end
  end
end