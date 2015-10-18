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

* prototypes
    - id
    - catch_copy
    - concept
    - user_id
    - likes_count
    - comments_count

* captured_images
    - id
    - name
    - role
    - prototype_id

* comments
    - id
    - text
    - prototype_id

* likes
    - id
    - prototype_id

アソシエーション
-------------
* users has_many prototypes

* prototype belongs_to user
            has_many likes
            has_many comments
            acts_as_taggable_on :labels
            has_many captured_images

* comments belongs_to prototype, counter_cache: true

* likes belongs_to prototype, counter_cache: true

* captured_images belongs_to prototype

