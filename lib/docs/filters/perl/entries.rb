module Docs
  class Perl
    class EntriesFilter < Docs::EntriesFilter
      TYPE_MAP = {
	'perl' => 'Overview',
	'perlintro' => 'Overview',
	'perlrun' => 'Overview',
	'perlreftut' => 'Tutorials',	
	'perlsyn' => 'Reference Manual',
	'perlembed' => 'Internals and C Language Interface',
	'perlbook' => 'Miscellaneous', 
      }

	ENTRIES = ['Overview', 'Tutorials', 'Reference Manual', 'Internals and C Language Interface', 'Miscellaneous', 'Built-in Functions', 'Core Modules']

      def get_name
	node = at_css('h1')
        result = node.content.strip

	result

      end

      def get_type
	return "Built-in Functions" if slug.split('/').first == 'functions'
	return "Changes" if slug.end_with?('delta')

	if TYPE_MAP.has_key?(slug)
	   return TYPE_MAP[slug]
	end

	# this should be looking at the TYPE_MAP to decide which section of the manual
	return "Reference Manual" if slug.start_with?("perl")

	# if it wasn't caught yet, it's probably a core module (those are mixed in with the rest)
	return "Core Modules"
      end

    end
  end
end
