module Docs
  class Perl
    class CleanHtmlFilter < Filter
      def call

        css('noscript').remove
        css('div#recent_pages').remove
        css('div.mod_az_list').remove

        css('a[name]').each do |node|          
          # puts node
          if ! node['name'].start_with?('__')
            node.next_element['id'] = node['name']
            node.remove
          end
        end
        
        doc
      end
    end
  end
end
