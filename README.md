== README

<!-- This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run -->
<tt>rake doc:app</tt>.

# Database_design

## users(use gem device)
  id                       / int(11) NOT NULL AUTO_INCREMENT,
  nickname                 / varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  email                    / varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  encrypted_password       / varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  reset_password_token     / varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  reset_password_sent_at   / datetime DEFAULT NULL,
  remember_created_at      / datetime DEFAULT NULL,
  sign_in_count            / int(11) NOT NULL DEFAULT '0',
  current_sign_in_at       / datetime DEFAULT NULL,
  last_sign_in_at          / datetime DEFAULT NULL,
  current_sign_in_ip       / varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  last_sign_in_ip          / varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  created_at               / datetime NOT NULL,
  updated_at               / datetime NOT NULL,

  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)


## users_groups (中間テーブル)
  id          / int(11) NOT NULL AUTO_INCREMENT,
  user_id     / references NOT NULL
  group_id    / references NOT NULL
  created_at  / datetime NOT NULL,
  updated_at  / datetime NOT NULL,

  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
  FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)


## groups
  id          / int(11) NOT NULL AUTO_INCREMENT,
  group_name  / text NOT NULL
  created_at  / datetime NOT NULL,
  updated_at  / datetime NOT NULL,
  PRIMARY KEY (`id`),


## messages
  id          / int(11) NOT NULL AUTO_INCREMENT,
  message_txt / text
  image_url   / text
  user_id     / references NOT NULL
  group_id    / references NOT NULL
  created_at  / datetime NOT NULL,
  updated_at  / datetime NOT NULL,

  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
  FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)






