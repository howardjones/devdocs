module Docs
  class Ansible < UrlScraper
    self.name = 'Ansible'
    self.type = 'sphinx'
    self.release = '2.0.1'
    self.base_url = 'https://docs.ansible.com/ansible/'
    self.links = {
      home: 'https://www.ansible.com/',
      code: 'https://github.com/ansible/ansible'
    }

    html_filters.push 'ansible/entries', 'ansible/clean_html', 'codeigniter/clean_html'

    options[:skip] = %w(
      glossary.html
      faq.html
      community.html
      tower.html
      quickstart.html
      list_of_all_modules.html)

    options[:attribution] = <<-HTML
      &copy; 2012&ndash;2016 Michael DeHaan<br>
      Licensed under the GNU General Public License version 3.
    HTML
  end
end
