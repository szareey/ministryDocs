module MinistryDocs
  module BaseDoc
    class StrandParser < BaseParser
      attr_writer :expectation_parser

      def parse(course)
        parse_strat(course).collect do |strat|
          OpenStruct.new(
            expectations: expectation_parser.parse(strat[:content]),
            title:        strat[:title],
            part:         strat[:part]
          )
        end
      end
      
      protected

      def expectation_parser
        raise NotImplementedError
      end
    end
  end
end