module Docs
	class Perl
		class CleanHtmlFilter < Filter
			def call

				css('noscript').remove
				css('div#recent_pages').remove
				css('div.mod_az_list').remove

				doc
			end
		end
	end
end
