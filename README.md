Static API
==========

A static API plugin for Jekyll.

Schema
======
All API access is over HTTP, and accessed from the `yourdomain.com/api/v1`. All data is sent as JSON.

Posts
-----
### List all posts
This provides a dump of all posts, in the order that they were created.

```
GET /posts
```

#### Response
```
```

### Get
```
GET /post/:id
```

#### Response
```
```

Pages
-----
### List all pages
This provides a dump of all pages, in the order that they were created.

```
GET /pages
```

#### Response
```
```

### Get
```
GET /pages/:id
```

#### Response
```
```
