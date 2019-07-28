FORMAT: 1A
HOST:

# Muscler's API

Muscler'sのAPI仕様書

# 基本構造

## Resource

    {
        "code": 200,
        "data": {
        },
    }

## Error

    {
        "code": 400,
        "message": "",
        "errors": [],
    }


# Group USERS

## Users [/api/users]

### 全ユーザー情報を取得する [GET]

## Users [/api/users/{id}]

### 特定のユーザー情報を取得する [GET]


# Group INFORMATIONS

## Informations [/api/users/{userId}/informations]

### 通知一覧を取得する [GET]

## Information [/api/users/{userId}/informations]

### 全ての通知を既読にする [PATCH]


# Group TAGS

## Tags [/api/tags]

### ユーザーに設定できるタグ一覧を取得する [GET]


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
