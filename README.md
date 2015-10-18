## README

テーブル
----------------
* users
    - id
    - name
    - e_mail
    - password
    - profile
    - position
    - member
    (deiviseを用いる)

* protos
    - id
    - catch_copy
    - concept
    - user_id
    - likes_count
    - comments_count

* images
    - id
    - name
    - image
    - role
    - proto_id

* comments
    - id
    - text
    - proto_id

* likes
    - id
    - proto_id

アソシエーション
-------------
* users has_many protos

* protos belongs_to user
         has_many likes
         has_many comments
         acts_as_taggable_on :labels
         acts_as_taggable
         has_many images

* comments belongs_to proto, counter_cache: true

* likes belongs_to proto, counter_cache: true

* images belongs_to proto

