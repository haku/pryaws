require 'aws-sdk-v1'

module AWS

  class SNS

    class TopicCollection

      if !self.respond_to?(:named)
        def named(name)
          each do |topic|
            return topic if topic.name == name
          end
          nil
        end
      end

    end

  end

end
