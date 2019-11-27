# ER図

```puml
@startuml

entity "users" {
    + id [PK]
    ==
    nickname:string
    email:email
    password:string
    thumbnail:string
    description:text
    age:uint
    gender:uint
    height:uint
    weight:uint
    figure:uint
    muscle_mass:uint
    body_fat_percentage:uint
    seriousness:uint
}

entity "informations" {
    + id [PK]
    ==
    body:string
    is_read:boolean
    # user_id [FK(users,id)]
}
users --o{ informations

entity "tags" {
    + id [PK]
    ==
    name:string
}

entity "user_tags" {
    + id [PK]
    ==
    # user_id [FK(users,id)]
    # tag_id [FK(tag,id)]
}
users --o{ user_tags
tags --o{ user_tags

entity "groups" {
    + id [PK]
    ==
    name:string
    description:text
    is_public:boolean
    tags:string
}

entity "group_users" {
    + id [PK]
    ==
    # user_id [FK(users,id)]
    # group_id [FK(groups,id)]
}
users --o{ group_users
groups --o{ group_users

entity "group_messages" {
    + id [PK]
    ==
    body:text
    # user_id [FK(users,id)]
    # group_id [FK(groups,id)]
}
groups --o{ group_messages
users --o{ group_messages

entity "direct_message_groups" {
    + id [PK]
    ==
    # by_user_id [FK(users,id)]
    # to_user_id [FK(users,id)]
}

entity "direct_messages" {
    + id [PK]
    ==
    body:text
    # send_user_id [FK(users,id)]
    # direct_message_group_id [FK(direct_message_groups,id)]
}

users --o{ direct_messages
users --o{ direct_message_groups
direct_message_groups --o{ direct_messages

entity "friends" {
    + id [PK]
    ==
    # user_id [FK(user,id)]
    # target_id [FK(user,id)]
    is_pending:boolean
}
users --|{ friends
users }|-- friends

entity "blog_tags" {
    + id [PK]
    ==
    # tag_id [FK(users,id)]
    # blog_id [FK(tags,id)]
}
tags --o{ tags
blogs --o{ blogs

entity "blogs" {
    + id [PK]
    ==
    # user_id [FK(users,id)]
    title:string
    body:text
}
users --o{ blogs

@enduml
```
