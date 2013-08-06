require "json"

module Jekyll
  API_DIRECTORY = "api"

  class ApiStaticFile < StaticFile
    def initialize(site, base, dir, name, content)
      super(site, base, dir, name)

      @content = content
    end

    def write(dest)
      destination = destination(dest)

      directory = File.dirname(destination)

      unless File.exists?(directory)
        p = Pathname.new(directory)
        p.mkpath
      end

      File.open(destination, 'w') do |f|
        f.write(@content)
        f.close
      end

      true
    end
  end

  class ApiGenerator < Generator
    safe true

    def generate(site)
      site.static_files << ApiStaticFile.new(site, File.expand_path(site.config['destination']), API_DIRECTORY, 'index.html', 'cats')
    end
  end
end