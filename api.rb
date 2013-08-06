require "json"

module Jekyll
  API_DIRECTORY = "api"

  POSTS_DIRECTORY = File.join(API_DIRECTORY, "posts")
  PAGES_DIRECTORY = File.join(API_DIRECTORY, "pages")

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

  class Page
    def index
      self.site.pages.index(self)
    end

    def api
      entry = {
        "index" => self.index,
        "url" => site.config['url'] + self.url,
        "data" => self.data,
        "html?" => self.html?,
        "index?" => self.index?,
        "content" => self.content
      }
    end
  end

  class Post
    def index
      self.site.posts.index(self)
    end

    def api
      entry = {
        "id" => self.id,
        "index" => self.index,
        "title" => self.title,
        "url" => site.config['url'] + self.url,
        "date" => self.date,
        "tags" => self.tags,
        "categories" => self.categories,
        "excerpt" => self.extracted_excerpt,
        "content" => self.content
      }
    end
  end

  class ApiGenerator < Generator
    safe true

    def generate(site)
      # Create /posts.json
      posts = []

      site.posts.each{ |post|
        posts.push(post.api)
      }

      site.static_files << ApiStaticFile.new(site, site.config['destination'], API_DIRECTORY, 'posts.json', JSON.pretty_generate(posts))

      # Create /posts/:id.json
      site.posts.each{ |post|
        index = post.index

        site.static_files << ApiStaticFile.new(site, site.config['destination'], POSTS_DIRECTORY, index.to_s + '.json', JSON.pretty_generate(post.api))
      }

      # Create /pages.json
      pages = []

      site.pages.each{ |page|
        pages.push(page.api)
      }

      site.static_files << ApiStaticFile.new(site, site.config['destination'], API_DIRECTORY, 'pages.json', JSON.pretty_generate(pages))

      # Create /pages/:id.json
      site.pages.each{ |page|
        index = page.index

        site.static_files << ApiStaticFile.new(site, site.config['destination'], PAGES_DIRECTORY, index.to_s + '.json', JSON.pretty_generate(page.api))
      }
    end
  end
end