require 'aws'
require 'aws-sdk'

module AWS

  # http://docs.aws.amazon.com/AWSRubySDK/latest/AWS/CloudFormation.html
  class CloudFormation

    def find_by_name(name)
      stacks[name]
    end

    class Stack

      def info
        sr = status_reason()
        "#{name()} (#{status()}#{sr.nil? ? '' : ' :' + sr})"
      end

      def save_template(path)
        File.open(path, 'w'){|f| f.write JSON.pretty_generate(JSON.parse(template()))}
      end

      def set_param(key, value)
        set_params({key => value})
      end

      def set_params(hash)
        p = parameters()
        hash.each do |key,val|
          raise "Invalid param '#{key}'." if p[key].nil?
        end
        p = p.merge(hash)
        p = Hash[*p.map{|k,v| [k, v || ""]}.flatten]
        update :template => template, :parameters => p, :capabilities => ['CAPABILITY_IAM']
      end

    end

  end

end
