module Docs
  class Perl < FileScraper
    self.name = 'Perl'
    self.type = 'perl'
    self.release = '5.22.0'
    self.base_url = 'http://perldoc.perl.org/'
    self.root_path = 'perl.html'
    self.dir = '/home/howie/work/perl/perldoc-html'
    
    html_filters.push 'perl/entries', 'perl/clean_html', 'title'

    options[:container] = '#content_body'
    options[:title] = false
    # options[:root_title] = 'Perl Programming Language'

    # there are some links into older (differently formatted) docs
    # and the *delta changelogs aren't really necessary for offline use
    options[:skip_patterns] = [/5\./, /perl\d+delta/]

    options[:attribution] = <<-HTML
  &copy; perldoc.perl.org<br>
     This documentation is free software; you can redistribute it and/or modify it under the terms of either:

        a) the GNU General Public License as published by the Free
        Software Foundation; either version 1, or (at your option) any
        later version, or b) the "Artistic License" which comes with this documentation.
    HTML
  end
end

