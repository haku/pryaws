require 'aws-sdk'

module AWS
  class AutoScaling

    def find_for_instance_id(instance_id)
      instances[instance_id].group()
    end

    # http://docs.aws.amazon.com/AWSRubySDK/latest/AWS/AutoScaling/Group.html
    class Group

      def info
        "#{name} #{min_size}..#{max_size} [#{auto_scaling_instances.map{|i| i.id}.join(',')}]"
      end

      def set_min_max(min, max)
        update(:min_size => min, :max_size => max)
      end

    end

  end

end
