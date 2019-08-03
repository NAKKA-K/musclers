FORMAT: 1A
HOST:

# Muscler's API

Muscler'sのAPI仕様書

# Group 基本構造

## Resource

````
{
    "code": 200,
    "data": {

    },
}
````

## Error

````
{
    "code": 400,
    "message": "",
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

    + Attributes (User)


# Group INFORMATIONS

## Informations [/api/users/{user_id}/informations]

+ Parameters

    + user_id: 1 (number) - usersテーブルのID

### 通知一覧を取得する [GET]

+ Headers
    Authorization: Barare ...

+ Response 200 (application/json)

    + Attributes (array[Information])

## Information [/api/users/{userId}/informations]

### 全ての通知を既読にする [PATCH]

+ Response 204 (application/json)


# Group TAGS

## Tags [/api/tags]

### ユーザーに設定できるタグ一覧を取得する [GET]

+ Response 200 (application/json)

    + Attributes (array[Tag])

# Group USER_TAGS

## UserTags [/api/users/{userId}/user_tags]

### ユーザーのタグ一覧を取得する [GET]

### ユーザーのタグ一覧を設定する [PUT]

### ユーザーのタグを一つ設定する [POST]


# Group GROUPS

## Groups [/api/groups]

### グループの一覧を取得する [GET]

### グループを追加する [POST]

## Group [/api/groups/{groupId}]

### 特定のグループを編集する [PUT]

### 特定のグループを削除する [DELETE]


# Group GROUP_USERS

## User to Group [/api/groups/{group_id}/join]

### 特定のグループにユーザーが参加する [POST]

## Users in Group [/api/groups/{group_id}/users]

### グループに参加するユーザー一覧を取得する [GET]

## User in Group [/api/groups/{group_id}/users/{user_id}]

### 特定のグループに参加している、特定のユーザーを除外する [DELETE]


# Group GROUP_MESSAGES

## GroupMessages [/api/groups/{group_id}/messages]

### 特定のグループで発生したメッセージの一覧を取得する [GET]

### 特定のグループに新規メッセージを送信する [POST]


# Group DIRECT_MESSAGE_GROUPS

## DirectMessageGroups on me [/api/direct_message_groups/me]

### 自分のダイレクトメッセージグループの一覧を取得する [GET]

## DirectMessageGroups [/api/direct_message_groups/{direct_message_group_id}]

### ダイレクトメッセージの特定のトークを削除する [DELETE]


# Group DIRECT_MESSAGES

## DirectMessages [/api/direct_message_groups/{direct_message_group_id}]

### 特定ユーザーとのダイレクトメッセージ一覧を取得する [GET]

### 特定ユーザーとのダイレクトメッセージに新規メッセージを送信する [POST]

## (仮)DirectMessage [/api/direct_messages/{direct_message_id}]

### 特定のダイレクトメッセージを更新する [PATCH]

### 特定のダイレクトメッセージを削除する [DELETE]
