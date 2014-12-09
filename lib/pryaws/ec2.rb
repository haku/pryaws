require 'aws-sdk'

module AWS

  #http://docs.aws.amazon.com/AWSRubySDK/latest/AWS/EC2.html
  class EC2
    
    def find_by_name(name)
      instances.tagged('Name').tagged_values(name)
    end

    class InstanceCollection

      def info()
        map(&:info).to_a()
      end

    end

    class Instance

      def info()
        "#{id()} #{tags['Name']}"
      end

    end

  end

end
