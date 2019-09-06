FORMAT: 1A
HOST:

# Muscler's API

Muscler'sのAPI仕様書

# Group 基本構造

## Resource

````
{
    "code": 200,
    "message": "Success",
    "data": {

    },
}
````

## Error

````
{
    "code": 400,
    "errors": [
        {

        },
    ],
}
````

## Data Structures

### User (object)

+ id (number)
+ nickname: 範馬勇次郎 (string)
+ thumbnail: https://avatars0.githubusercontent.com/u/22770924 (string)
+ description: 筋友を探しています！ (string)
+ age: 22 (number)
+ gender: 1 (enum[number])
    + Members
        + 1 - 男性
        + 2 - 女性
        + 3 - その他
+ height: 175 (number)
+ weight: 65 (number)
+ figure: 1 (enum[number])
    + Members
        + 1 - 痩せ型筋肉質
        + 5 - 普通筋肉質
        + 10 - 肥満型筋肉質
        + 15 - 痩せ型
        + 20 - 普通
        + 25 - 肥満型
        + 99 - その他
+ muscle_mass: 44 (number)
+ body_fat_percentage: 12 (number)
+ created_at: `2019-11-19 04:58:55` (string)
+ updated_at: `2019-11-19 04:58:55` (string)

### Information (object)

+ id: 1 (number)
+ body: 「筋肉モンスターたちの集会所」グループから招待が来ています。 (string)
+ is_read: true (boolean)
+ user_id: 3 (number)
+ created_at: `2019-11-19 04:58:55` (string)
+ updated_at: `2019-11-19 04:58:55` (string)

### Tag (object)

+ id: 1 (number)
+ name: マッチョ (string)
+ created_at: `2019-11-19 04:58:55` (string)
+ updated_at: `2019-11-19 04:58:55` (string)

### UserTag (object)

+ id: 1 (number)
+ user_id: 1 (number)
+ tag (Tag)
+ created_at: `2019-11-19 04:58:55` (string)
+ updated_at: `2019-11-19 04:58:55` (string)

### Group (object)

+ id: 1 (number)
+ name: 筋肉モンスターの集会所 (string)
+ description: 筋肉は全てを解決してくれる！ (string)
+ is_public: true (boolean)
+ tags (array[Tag])
+ created_at: `2019-11-19 04:58:55` (string)
+ updated_at: `2019-11-19 04:58:55` (string)

### GroupMessage

+ id: 1 (number)
+ body: 今日はみんなで大腿四頭筋を追い込みましょう！！ (string)
+ created_at: `2019-11-19 04:58:55` (string)
+ updated_at: `2019-11-19 04:58:55` (string)
+ user (User)
+ group (Group)

### DirectMessageGroup (object)

+ id: 1 (number)
+ to_user (User)
+ created_at: `2019-11-19 04:58:55` (string)
+ updated_at: `2019-11-19 04:58:55` (string)

### DirectMessage (object)

+ id: 1 (number)
+ body: 君はもうバッチリ筋肉追い込んだかい！！？ (string)
+ direct_message_group (DirectMessageGroup)
+ created_at: `2019-11-19 04:58:55` (string)
+ updated_at: `2019-11-19 04:58:55` (string)


# Group AUTH

認証周りはライブラリ等に大きく影響される可能性があるので一旦未定

- ユーザーを登録する
- Emailを変更する
- ログインする
- ログアウトする
- 認証中ユーザーの情報を取得する
- 認証ユーザーの情報を変更する
- メールアドレスの検証を完了する
- メールアドレス検証メールを再送
- パスワードリセットメールを送信する
- パスワードをリセットする

# Group USERS

## Users [/api/users]

### 全ユーザー情報を取得する [GET]

+ Response 200 (application/json)

    + Attributes (array[User,User])


## Users [/api/users/{user_id}]

+ Parameters

    + user_id: 1 (number) - usersテーブルのID

### 特定のユーザー情報を取得する [GET]

+ Response 200

    + Attributes (object)
        + code: 200 (number)
        + message: success (string)
        + data (User)

+ Response 404

  {
      "code": 404,
      "errors": [
        { message: "指定したユーザは存在しません。" }
      ],
  }

## Users [/api/users/search?nickname={nickname}]

+ Parameters

    + nickname: denshi (string) - ユーザの名前

### ユーザの検索結果を取得する [GET]

+ Response 200

    + Attributes (object)
        + code: 200 (number)
        + message: success (string)
        + data (array[User,User])

+ Response 404

  {
      "code": 404,
      "errors": [
        { message: "お探しのユーザが見つかりませんでした。" }
      ],
  }

# Group INFORMATIONS

## Informations [/api/users/{user_id}/informations]

+ Parameters

    + user_id: 1 (number) - usersテーブルのID

### 通知一覧を取得する [GET]

+ Headers
    Authorization: Barare ...

+ Response 200 (application/json)

    + Attributes (array[Information])

### 全ての通知を既読にする [PATCH]

+ Headers
    Authorization: Barare ...

+ Response 204 (application/json)

+ Response 401 (application/json)

        {
            "code": 401,
            "message": "ログインが必要です",
            "errors": [],
        }


# Group TAGS

## Tags [/api/tags]

### ユーザーに設定できるタグ一覧を取得する [GET]

+ Response 200 (application/json)

    + Attributes (array[Tag])


# Group USER_TAGS

## UserTags [/api/users/{userId}/user_tags]

+ Parameters

    + user_id: 1 (number) - usersテーブルのID

### ユーザーのタグ一覧を取得する [GET]

+ Response 200 (application/json)

    + Attributes (array[UserTag])


### ユーザーのタグ一覧を設定する [PUT]

+ Headers
    Authorization: Barare ...

+ Request (application/json)

    + Attributes (object)
        + tags (array)
            + id: 2 (number)

+ Response 201 (application/json)

    + Headers

        Location: http://localhost:8080/api/users/{userId}/user_tags

    + Attributes (array[Tag])

+ Response 401 (application/json)

        {
            "code": 401,
            "message": "ログインが必要です",
            "errors": [],
        }

+ Response 400 (application/json)

        {
            "code": 400,
            "message": "リクエストが間違っています",
            "errors": [
            ],
        }

### ユーザーのタグを一つ設定する [POST]

+ Headers
    Authorization: Barare ...

+ Request (application/json)

    + Attributes (object)
        + tag: 2 (number)

+ Response 201 (application/json)

    + Headers

        Location: http://localhost:8080/api/users/{userId}/user_tags

    + Attributes (array[Tag])

# Group GROUPS

## Groups [/api/groups]

### グループの一覧を取得する [GET]

+ Response 200 (application/json)

    + Attributes (array[Group])


### グループを追加する [POST]

+ Headers
    Authorization: Barare ...

+ Request (application/json)

    + Attributes (object)
        + name: 筋肉モンスターたちの集会所 (string)
        + description: 筋肉は全てを解決してくれる！ (string)
        + is_public: true (boolean)
        + tags (array[number])
            + Members
                + 1 - 痩せ型
                + 5 - 普通
                + 10 - ぽっちゃり型
                + 15 - 筋肉質
                + 20 - マッチョ
                + 25 - ゴリマッチョ
                + 30 - 健康
                + 35 - 趣味
                + 40 - 仕事
                + 45 - 短期的
                + 50 - 長期的

+ Response 201 (application/json)

    + Headers

        Location: http://localhost:8080/api/groups/{groupId}

    + Attributes (Group)

## Group [/api/groups/{groupId}]

+ Parameters

    + group_id: 1 (number) - groupsテーブルのID

### グループの詳細を取得する [GET]

+ Response 200 (application/json)

    + Attributes (Group)

### 特定のグループを編集する [PUT]

+ Headers
    Authorization: Barare ...

+ Request (application/json)

    + Attributes (object)
        + name: 筋肉モンスターたちの集会所 (string)
        + description: 筋肉は全てを解決してくれる！ (string)
        + is_public: true (boolean)
        + tags (array[number])
            + Members
                + 1 - 痩せ型
                + 5 - 普通
                + 10 - ぽっちゃり型
                + 15 - 筋肉質
                + 20 - マッチョ
                + 25 - ゴリマッチョ
                + 30 - 健康
                + 35 - 趣味
                + 40 - 仕事
                + 45 - 短期的
                + 50 - 長期的

+ Response 200 (application/json)

    + Attributes (Group)

### 特定のグループを削除する [DELETE]

+ Headers
    Authorization: Barare ...

+ Response 204 (application/json)


# Group GROUP_USERS

## User to Group [/api/groups/{group_id}/join]

+ Parameters

    + group_id: 1 (number) - groupsテーブルのID

### 特定のグループにユーザーが参加する [POST]

+ Headers
    Authorization: Barare ...

+ Request (application/json)

    + Attributes (object)
        + group_id (number)

+ Response 204 (application/json)

## Users in Group [/api/groups/{group_id}/users]

+ Parameters

    + group_id: 1 (number) - groupsテーブルのID

### グループに参加するユーザー一覧を取得する [GET]

+ Response 200 (application/json)

    + Attributes (object)
        + group (Group)
        + users (array[User])

## User in Group [/api/groups/{group_id}/users/{user_id}]

+ Parameters

    + group_id: 1 (number) - groupsテーブルのID
    + user_id: 1 (number) - usersテーブルのID

### 特定のグループに参加している、特定のユーザーを除外する [DELETE]

+ Headers
    Authorization: Barare ...

+ Response 204 (application/json)


# Group GROUP_MESSAGES

## GroupMessages [/api/groups/{group_id}/messages]

+ Parameters

    + group_id: 1 (number) - groupsテーブルのID

### 特定のグループで発生したメッセージの一覧を取得する [GET]

+ Headers
    Authorization: Barare ...

+ Response 200 (application/json)

    + Attributes (object)
        + group (Group)
        + messages (array[GroupMessage])

### 特定のグループに新規メッセージを送信する [POST]

+ Headers
    Authorization: Barare ...

+ Request (application/json)

    + Attributes (object)
        + body: 今日はみんなで大腿四頭筋を追い込みましょう！！ (string)

+ Response 201 (application/json)

    + Headers

        Location: http://localhost:8080/api/groups/{group_id}/messages/{group_message_id}

    + Attributes (GroupMessage)

## GroupMessage [/api/groups/{group_id}/messages/{group_message_id}]

+ Parameters

    + group_id: 1 (number) - groupsテーブルのID
    + group_message_id: 1 (number) - group_messagesテーブルのID

### 特定のグループで発生した特定メッセージを一つ取得する [GET]

+ Response 200 (application/json)

    + Attributes (GroupMessage)

### 特定のグループで発生した特定のメッセージを一つ編集する [PUT]

+ Headers
    Authorization: Barare ...

+ Request (application/json)

    + Attributes (object)
        + body: 今日はみんなで僧帽筋を追い込みましょう！！ (string)

+ Response 200 (application/json)

    + Attributes (GroupMessage)

### 特定のグループで発生した特定のメッセージを一つ削除する [DELETE]

+ Headers
    Authorization: Barare ...

+ Response 204 (application/json)


# Group DIRECT_MESSAGE_GROUPS

## DirectMessageGroups on me [/api/direct_message_groups/me]

### 自分のダイレクトメッセージグループの一覧を取得する [GET]

+ Headers
    Authorization: Barare ...

+ Response 200 (application/json)

    + Attributes (array[object])
        + (object)
            + to_user (User)
            + latest_messages (array[object])
                + (object)
                    + id: 1 (number)
                    + body: 君はもうバッチリ筋肉追い込んだかい！！？ (string)
                    + created_at: `2019-11-19 04:58:55` (string)
                    + updated_at: `2019-11-19 04:58:55` (string)


## DirectMessageGroups [/api/direct_message_groups/{direct_message_group_id}]

+ Parameters

    + direct_message_group_id: 1 (number) - direct_message_groupsテーブルのID

### ダイレクトメッセージの特定のトークを削除する [DELETE]

+ Headers
    Authorization: Barare ...

+ Response 204 (application/json)


# Group DIRECT_MESSAGES

## DirectMessages [/api/direct_message_groups/{direct_message_group_id}]

+ Parameters

    + direct_message_group_id: 1 (number) - direct_message_groupsテーブルのID


### 特定ユーザーとのダイレクトメッセージ一覧を取得する [GET]

+ Headers
    Authorization: Barare ...

+ Response 200 (application/json)

    + Attributes (object)
        + to_user (User)
        + messages (array[object])
            + (object)
                + id: 1 (number)
                + body: 君はもうバッチリ筋肉追い込んだかい！！？ (string)
                + created_at: `2019-11-19 04:58:55` (string)
                + updated_at: `2019-11-19 04:58:55` (string)

### 特定ユーザーとのダイレクトメッセージに新規メッセージを送信する [POST]

+ Headers
    Authorization: Barare ...

+ Request (application/json)

    + Attributes (object)
        + body: サイド!トライセップス！！！ (string)

+ Response 201 (application/json)

    + Attributes (DirectMessage)

## DirectMessage [/api/direct_messages/{direct_message_id}]

+ Parameters

    + direct_message_id: 1 (number) - direct_messagesテーブルのID


### 特定のダイレクトメッセージを更新する [PATCH]

+ Headers
    Authorization: Barare ...

+ Request (application/json)

    + Attributes (object)
        + body: サイド!トライセップス！！！ (string)

+ Response 200 (application/json)

    + Attributes (DirectMessage)

### 特定のダイレクトメッセージを削除する [DELETE]

+ Headers
    Authorization: Barare ...

+ Response 204 (application/json)
