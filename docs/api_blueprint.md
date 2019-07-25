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

## Informations [/api/informations]

### 通知一覧を取得する [GET]

## Information [/api/informations/{id}]

### 特定の通知を既読にする [PATCH]

# Group TAGS

## Tags [/api/tags]

### ユーザーに設定できるタグ一覧を取得する [GET]


# Group USER_TAGS
# Group GROUPS
# Group GROUP_USERS
# Group GROUP_MESSAGES
# Group DMS
# Group D_M_GROUPS

