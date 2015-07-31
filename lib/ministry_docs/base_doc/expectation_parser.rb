module MinistryDocs
  module BaseDoc
    class ExpectationParser < BaseParser
      attr_writer :specific_parser

      def parse(strat)
        shorthand, overall = parse_sections(strat)
        shorthand.each_with_index.collect do |short, index|
          OpenStruct.new(
            title: short[:title],
            description: overall[index][:value],
            part: short[:part],
            specifics: specific_parser.parse(short[:content], short[:part])
          )
        end
      end

      protected

      def normalize(strat)
        strat
      end

      def parse_sections(strat)
        strat = normalize(strat)

        strat.index(self.class::OVERALL)
        overall_pos = Regexp.last_match.end(0)
        specific = strat.index(self.class::SPECIFIC)
        
        specific_pos = Regexp.last_match.end(0)

        [
          parse_shorthand(strat[specific_pos..-1].strip),
          parse_overall(strat[overall_pos..specific].strip)
        ]
      end

      def specific_parser
        raise NotImplementedError
      end
    end
  end
end