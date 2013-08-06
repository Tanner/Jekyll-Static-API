Jekyll Static API
==========

A static API plugin for Jekyll.

Installation
============
1. `gem install json`
2. Download `api.rb`
3. Place `api.rb` in Jekyll's `_plugins` directory.
4. Rebuild your site (e.g. `jekyll build`).

Schema
======
All API access is over HTTP, and accessed from the `yourdomain.com/api/v1`. All data is sent as JSON.

Posts
-----
### List all posts
This provides a dump of all posts, in the order that they were created.

```
GET /posts.json
```

#### Response
```
[
  {
    "url": "http://www.tannersmith.me/2010/08/26/blog-host/",
    "title": "Blog Host",
    "excerpt": "Think I may use one of my servers for hosting this blog. Wordpress.com does not give me enough options. And I like to have options and the ability to customize whatever I want.\n\n\n",
    "index": 0,
    "content": "Think I may use one of my servers for hosting this blog. Wordpress.com does not give me enough options. And I like to have options and the ability to customize whatever I want.\n",
    "id": "/2010/08/26/blog-host",
    "categories": [
      "general"
    ],
    "date": "Thu Aug 26 14:09:00 -0400 2010",
    "tags": [

    ]
  },
  ...
]
```

### Count
Returns the number of posts.

```
GET /posts/count.json
```

#### Response
```
[
  83
]
```

### Get
```
GET /posts/:index.json
```

#### Response
```
{
  "url": "http://www.tannersmith.me/2010/08/26/blog-host/",
  "title": "Blog Host",
  "excerpt": "Think I may use one of my servers for hosting this blog. Wordpress.com does not give me enough options. And I like to have options and the ability to customize whatever I want.\n\n\n",
  "index": 0,
  "content": "Think I may use one of my servers for hosting this blog. Wordpress.com does not give me enough options. And I like to have options and the ability to customize whatever I want.\n",
  "id": "/2010/08/26/blog-host",
  "categories": [
    "general"
  ],
  "date": "Thu Aug 26 14:09:00 -0400 2010",
  "tags": [

  ]
}
```

Pages
-----
### List all pages
This provides a dump of all pages, in the order that they were created.

```
GET /pages.json
```

#### Response
```
[
  {
    "url": "http://www.tannersmith.me/404.html",
    "index?": false,
    "index": 0,
    "content": "<p>Oh noez! The page you were looking for could not be found!</p>\n\n<p>Maybe try the <a href=\"/archive.html\">archive</a>?</p>",
    "data": {
      "title": "Page not found",
      "layout": "static"
    },
    "html?": true
  },
  ...
]
```

### Count
Returns the number of pages.

```
GET /posts/count.json
```

#### Response
```
[
  6
]
```

### Get
```
GET /pages/:index.json
```

#### Response
```
{
  "url": "http://www.tannersmith.me/404.html",
  "index?": false,
  "index": 0,
  "content": "<p>Oh noez! The page you were looking for could not be found!</p>\n\n<p>Maybe try the <a href=\"/archive.html\">archive</a>?</p>",
  "data": {
    "title": "Page not found",
    "layout": "static"
  },
  "html?": true
}
```

Author
======
Tanner Smith
