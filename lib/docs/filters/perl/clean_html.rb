module Docs
  class Perl
    class CleanHtmlFilter < Filter
      def call
        # css('h2').remove # Page Title
        # css('h3:first-child').remove # Navigation

	css('noscript').remove
	css('div#recent_pages').remove
	css('div.mod_az_list').remove

	css('h1').each do |node|
	   if node.content == 'Perl Programming Language'
		node.remove
	   end
	end

        #css('div.copy').each do |node|
        #  node['class'] = '_attribution'
        #  node.inner_html = %(<p class="_attribution-p">#{node.inner_html.gsub(' Copyright', '<br>\0')}</p>)
        #end

        #css('a[name]').each do |node|
        #  node.parent['id'] = node['name']
        #  node.before(node.children).remove unless node['href']
        #end

        css('h3').each do |node|
          if node.content == 'KEYWORDS'
            node['id'] = 'tmp__'
            css('#tmp__ ~ a[href*="Keywords"]').each do |link|
              link.next.remove if link.next.content == ', '
              link.remove
            end
            node.remove
            next
          end

          node.name = 'h2'
          node.content = node.content.capitalize
        end

        #css('h4').each do |node|
        #  node.name = 'h3'
        #  node.content = node.content.capitalize
        #end

        doc
      end
    end
  end
end
