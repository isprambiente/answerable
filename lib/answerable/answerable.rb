module Answerable
  module Answerable
    extend ActiveSupport::Concern
    def self.table_name_prefix
      "answerable_"
    end

    class_methods do 
      def answerable(options = {})
      end
    end
  end
end
