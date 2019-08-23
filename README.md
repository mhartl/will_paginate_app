# will_paginate app

This is a minimalist app to reproduce an [issue](https://github.com/mislav/will_paginate/issues/599) when using `will_paginate` in a Rails console, namely, an apparent hard cap of returning 11 entries at a time.

Steps to reproduce:

```
$ git clone https://github.com/mhartl/will_paginate_app.git
$ cd will_paginate_app
$ bundle install
$ rails db:migrate
$ rails db:seed
$ rails console
Loading development environment (Rails 6.0.0)
>> User.paginate(page: 1)
   (1.1ms)  SELECT sqlite_version(*)
  User Load (0.2ms)  SELECT "users".* FROM "users" LIMIT ? OFFSET ?  [["LIMIT", 11], ["OFFSET", 0]]
=> #<ActiveRecord::Relation [#<User id: 1, …
>> User.paginate(page: 1, per_page: 5)
  User Load (0.2ms)  SELECT "users".* FROM "users" LIMIT ? OFFSET ?  [["LIMIT", 5], ["OFFSET", 0]]
=> #<ActiveRecord::Relation [#<User id: 1, …
>> User.paginate(page: 1, per_page: 20)
  User Load (0.2ms)  SELECT "users".* FROM "users" LIMIT ? OFFSET ?  [["LIMIT", 11], ["OFFSET", 0]]
=> #<ActiveRecord::Relation [#<User id: 1, …
```