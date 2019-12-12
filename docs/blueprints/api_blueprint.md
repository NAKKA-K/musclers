FORMAT: 1A
HOST: http://localhost:8080

# Muscler's API

Muscler'sのAPI仕様書

# Group 基本構造

## Resource

````
{
    "status": 200,
    "message": "Success",
    "data": {

    },
}
````

## Error

````
{
    "status": 400,
    "message": "Error",
    "errors": [
        {
          errMsg: "error message"
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
        + 0 - 未設定
        + 1 - 男性
        + 2 - 女性
        + 3 - その他
+ height: 175 (number)
+ weight: 65 (number)
+ figure: 1 (enum[number])
    + Members
        + 0 - 未設定
        + 1 - 痩せ型筋肉質
        + 5 - 普通筋肉質
        + 10 - 肥満型筋肉質
        + 15 - 痩せ型
        + 20 - 普通
        + 25 - 肥満型
        + 99 - その他
+ muscle_mass: 44 (number)
+ body_fat_percentage: 12 (number)
+ seriousness: 0 (enum[number])
    + Members
        + 0 - 未設定
        + 1 - ガチ
        + 2 - エンジョイ
+ created_at: `2019-11-19 04:58:55` (string)
+ updated_at: `2019-11-19 04:58:55` (string)

### Information (object)

+ id: 1 (number)
+ type: 1 (number)
+ by_name: 筋肉モンスターたちの集会所 (string)
+ link: /groups/1 (string)
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

### JoinedGroup (object)

+ id: 1 (number)
+ name: 筋肉モンスターの集会所 (string)
+ description: 筋肉は全てを解決してくれる！ (string)
+ is_public: true (boolean)
+ tags (array[Tag])
+ created_at: `2019-11-19 04:58:55` (string)
+ updated_at: `2019-11-19 04:58:55` (string)
+ latest_message (object)
    + id: 1 (number)
    + body: 今日はみんなで大腿四頭筋を追い込みましょう！！ (string)
    + created_at: `2019-11-19 04:58:55` (string)
    + updated_at: `2019-11-19 04:58:55` (string)
    + send_user_id: 1 (number)

### GroupMessage (object)

+ id: 1 (number)
+ body: 今日はみんなで大腿四頭筋を追い込みましょう！！ (string)
+ created_at: `2019-11-19 04:58:55` (string)
+ updated_at: `2019-11-19 04:58:55` (string)
+ send_user (User)

### DirectMessageGroup (object)

+ id: 1 (number)
+ by_user (User)
+ to_user (User)
+ created_at: `2019-11-19 04:58:55` (string)
+ updated_at: `2019-11-19 04:58:55` (string)

### DirectMessage (object)

+ id: 1 (number)
+ body: 君はもうバッチリ筋肉追い込んだかい！！？ (string)
+ created_at: `2019-11-19 04:58:55` (string)
+ updated_at: `2019-11-19 04:58:55` (string)

### MetaPaginator (object)

+ current_page: 2 (number)
+ is_first_page: true (boolean)
+ is_last_page: false (boolean)
+ next_page: 3 (number, nullable)
+ prev_page: 1 (number, nullable)
+ size: 20 (number)
+ total_count: 100 (number)
+ total_pages: 50 (number)

### Blog (object)
+ id: 1 (number)
+ user_id: 1 (number)
+ title: テストのブログ (string)
+ body: ブログに書かれている実際の内容がここに記述されます。 (text)
+ created_at: `2019-11-19 04:58:55` (string)
+ updated_at: `2019-11-19 04:58:55` (string)

### BlogTag (object)
+ id: 1 (number)
+ blog_id: 1 (number)
+ tag_id: 1 (number)
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

## Register [/api/auth/sign_in]

### ユーザー登録 [POST]

+ Request (application/json)

    + Headers

            Authorization: ...

    + Attributes (object)
        + uid: 212345432 (string)
        + provider: facebook (string)
        + email: sample@example.com (string)

+ Response 201 (application/json)

    + Attributes (object)
        + id: 1 (number)
        + uid: 212345432 (string)
        + provider: facebook (string)
        + access_token: 13rHI093r+_o! (string)
        + email: sample@example.com (string)
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


# Group Myself

## Myself [/api/auth/user]

### ログイン中の自分自身のデータを取得する [GET]

+ Request (application/json)

    + Headers

            Authorization: ...

+ Response 200

    + Attributes (object)
        + status: 200 (number)
        + message: 自分自身のデータ (string)
        + data (User)

+ Response 401 (application/json)

        {
            "code": 401,
            "message": "ログインが必要です",
            "errors": [],
        }

## Home [/api/user/home]

### 自分のホーム画面に表示されるOverviewを取得する [GET]

+ Request (application/json)

    + Headers

            Authorization: ...

+ Response 200

    + Attributes (object)
        + status: 200 (number)
        + message: 自分自身のデータ (string)
        + data (object)
            + users (array[User])
            + groups (array[Group])
            + informations (array[Information])

+ Response 401 (application/json)

        {
            "code": 401,
            "message": "ログインが必要です",
            "errors": [],
        }

## RecommendedUsers [/api/user/recommended_users]

### おすすめユーザーの一覧を取得する [GET]

+ Request (application/json)

    + Headers

            Authorization: ...

    + Attributes (object)
        + figure: 0 (number)
        + seriousness: 1 (number)

+ Response 200

    + Attributes (object)
        + status: 200 (number)
        + message: お勧めユーザーが見つかりました (string)
        + data (array[User,User])

+ Response 401 (application/json)

        {
            "code": 401,
            "message": "ログインが必要です",
            "errors": [],
        }

## JoinedGroups [/api/user/joined_groups]

### 参加中のグループ一覧を取得する [GET]

+ Request (application/json)

    + Headers

            Authorization: ...

+ Response 200

    + Attributes (object)
        + status: 200 (number)
        + message: 取得しました (string)
        + data (array[JoinedGroup])

+ Response 401 (application/json)

        {
            "code": 401,
            "message": "ログインが必要です",
            "errors": [],
        }


## MyInformations [/api/user/information]

### 自分の通知一覧を取得する [GET]

+ Request (application/json)

    + Headers

            Authorization: ...

+ Response 200 (application/json)

    + Attributes (object)
        + status: 200 (number)
        + message: 取得しました (string)
        + data (array[Information])

+ Response 401 (application/json)

        {
            "code": 401,
            "message": "ログインが必要です",
            "errors": [],
        }


### 全ての通知を既読にする [PATCH]

+ Request (application/json)

    + Headers

            Authorization: ...

+ Response 200 (application/json)

    + Attributes (object)
        + status: 200 (number)
        + message: 成功しました (string)

+ Response 401 (application/json)

        {
            "code": 401,
            "message": "ログインが必要です",
            "errors": [],
        }

## DirectMessageGroups [/api/user/direct_message_groups]

### 自分のダイレクトメッセージのグループ一覧を取得する [GET]

+ Request (application/json)

    + Headers

            Authorization: ...

+ Response 200 (application/json)

    + Attributes (object)
        + status: 200 (number)
        + message: 取得しました (string)
        + data (object)
            + direct_message_groups (array[object])
                + (object)
                    + id: 1 (number)
                    + by_user (User)
                    + to_user (User)
                    + created_at: `2019-11-19 04:58:55` (string)
                    + updated_at: `2019-11-19 04:58:55` (string)
                    + latest_message (DirectMessage)

+ Response 401 (application/json)

        {
            "code": 401,
            "message": "ログインが必要です",
            "errors": [],
        }

### ダイレクトメッセージグループを作る [POST]

+ Request (application/json)

    + Headers

            Authorization: ...

    + Attributes (object)
        + to_user_id: 2 (number)

+ Response 201 (application/json)

    + Attributes (object)
        + status: 200 (number)
        + message: 作成しました (string)
        + data (DirectMessageGroup)

+ Response 401 (application/json)

        {
            "code": 401,
            "message": "ログインが必要です",
            "errors": [],
        }

+ Response 403 (application/json)

        {
            "code": 403,
            "message": "相手と友達ではないためDMを許可されていません",
            "errors": [],
        }

## DirectMessageGroup [/api/user/direct_message_groups/{direct_group_id}]

+ Parameters

    + direct_group_id: 1 (number) - direct_message_groupsテーブルのID(direct_message_group_idだと長すぎて認識してくれなかったのでこの名前に)

### 特定ユーザーとのダイレクトメッセージ一覧を取得する [GET]

+ Request (application/json)

    + Headers

            Authorization: ...

+ Response 200 (application/json)

    + Attributes (object)
        + status: 200 (number)
        + message: 取得しました (string)
        + data (object)
            + id: 1 (number)
            + by_user (User)
            + to_user (User)
            + created_at: `2019-11-19 04:58:55` (string)
            + updated_at: `2019-11-19 04:58:55` (string)
            + direct_messages (array[DirectMessage])

+ Response 401 (application/json)

        {
            "code": 401,
            "message": "ログインが必要です",
            "errors": [],
        }

### 特定ユーザーとのダイレクトメッセージに新規メッセージを送信する [POST]

+ Request (application/json)

    + Headers

            Authorization: ...

    + Attributes (object)
        + body: サイド!トライセップス！！！ (string)

+ Response 201 (application/json)

    + Attributes (object)
        + status: 200 (number)
        + message: 投稿しました (string)
        + data (DirectMessage)

+ Response 401 (application/json)

        {
            "code": 401,
            "message": "ログインが必要です",
            "errors": [],
        }


## DirectMessage [/api/user/direct_messages/{direct_message_id}]

+ Parameters

    + direct_message_id: 1 (number) - direct_messagesテーブルのID


### 特定のダイレクトメッセージを更新する [PATCH]

+ Request (application/json)

    + Headers

            Authorization: ...

    + Attributes (object)
        + body: サイド!トライセップス！！！ (string)

+ Response 200 (application/json)

    + Attributes (object)
        + status: 200 (number)
        + message: 更新しました (string)
        + data (DirectMessage)

+ Response 401 (application/json)

        {
            "code": 401,
            "message": "ログインが必要です",
            "errors": [],
        }

### 特定のダイレクトメッセージを削除する [DELETE]

+ Request (application/json)

    + Headers

            Authorization: ...

+ Response 200 (application/json)

    + Attributes (object)
        + status: 200 (number)
        + message: 削除しました (string)

+ Response 401 (application/json)

        {
            "code": 401,
            "message": "ログインが必要です",
            "errors": [],
        }


## Friends [/api/user/friends]

### 自分の友達一覧を取得する [GET]

+ Request (application/json)

    + Headers

            Authorization: ...

+ Response 200 (application/json)

    + Attributes (object)
        + status: 200 (number)
        + message: 友達一覧です (string)
        + data (array[User])

+ Response 401 (application/json)

        {
            "code": 401,
            "message": "ログインが必要です",
            "errors": [],
        }

### 友達申請する [POST]

+ Request (application/json)

    + Headers

            Authorization: ...

    + Attributes (object)
        + user_id: 2 (number)

+ Response 201 (application/json)

    + Attributes (object)
        + status: 201 (number)
        + message: 申請しました (string)

+ Response 401 (application/json)

        {
            "code": 401,
            "message": "ログインが必要です",
            "errors": [],
        }

+ Response 404 (application/json)

        {
            "code": 404,
            "message": "指定したユーザーは存在しません",
            "errors": [],
        }

+ Response 409 (application/json)

        {
            "code": 409,
            "message": "すでに申請しています",
            "errors": [],
        }


# Group USERS

## Users [/api/users?page={page}&per_page={per_page}&keywords={keywords}&seriousness={seriousness}&gender={gender}&figures%5B%5D={figures}&ageMin={ageMin}&ageMax={ageMax}&weightMin={weightMin}&weightMax={weightMax}&heightMin={heightMin}&heightMax={heightMax}]

+ Parameters

    + keywords: フィジーク選手 (string, optional) - ユーザの名前と概要から部分一致検索される
    + page: 1 (number, optional) - ページ番号
    + per_page: 20 (number, optional) - 1ページの要素数
    + seriousness: 0 (number, optional) - 本気度のID
    + gender: 0 (number, optional) - 性別のID
    + figures: 0 (array[number], optional) - 体格のID配列
    + ageMin: 20 (number, optional) - 下限年齢
    + ageMax: 40 (number, optional) - 上限年齢
    + weightMin: 40 (number, optional) - 下限体重
    + weightMax: 60 (number, optional) - 上限体重
    + heightMin: 160 (number, optional) - 下限身長
    + heightMax: 180 (number, optional) - 上限身長


### ユーザの検索結果を取得する [GET]

+ Response 200

    + Attributes (object)
        + status: 200 (number)
        + message: ユーザが見つかりました。 (string)
        + data (array[User,User])
        + meta (MetaPaginator)

+ Response 404

        {
            "status": 404,
            "message": "お探しのユーザは見つかりませんでした・"
            "errors": [
                { message: "お探しのユーザが見つかりませんでした。" }
            ],
        }

## Users [/api/users/{user_id}]

+ Parameters

    + user_id: 1 (number) - usersテーブルのID

### 特定のユーザー情報を取得する [GET]

+ Response 200

    + Attributes (object)
        + status: 200 (number)
        + message: ユーザが見つかりました (string)
        + data (User)

+ Response 404

        {
            "status": 404,
            "message": "指定したユーザは存在しません。"
            "errors": [
                { message: "指定したユーザは存在しません。" }
            ],
        }

### 新規ユーザのnicknameとEmail更新 [PATCH]

+ Request (application/json)

    + Headers

            Authorization: ...

    + Attributes (object)
        + email: sample@example.com (string)
        + nickname: huga (string)

+ Response 200

    + Attributes (object)
        + status: 200 (number)
        + message: ニックネームとEメールを更新しました (string)

+ Response 400

        {
            "status": 400,
            "message": "値を入力してください"
            "errors": [
                { message: "値を入力してください" }
            ],
        }

+ Response 404

        {
            "status": 404,
            "message": "ユーザが存在しません"
            "errors": [
                { message: "ユーザが存在しません" }
            ],
        }

+ Response 422

        {
            "status": 422,
            "message": "入力内容が正しくありません"
            "errors": [
                { message: { email:"Eメールの形式で入力してください" } }
            ],
        }

+ Response 500

        {
            "status": 500,
            "message": "更新に失敗しました"
            "errors": [
                { message: "更新に失敗しました" }
            ],
        }

## Users [/api/users/{user_id}/edit]

+ Parameters

    + user_id: 1 (number) - usersテーブルのID

### 既存ユーザのプロフィール情報の更新 [PATCH]

+ Request (multipart/form-data)

    + Headers

            Authorization: ...

    + Attributes (object)
        + user (object)
            + nickname: 範馬勇次郎 (string)
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
            + email: sample@example.com (string)
            + thumbnail: 画像データ

+ Response 200

    + Attributes (object)
        + status: 200 (number)
        + message: ユーザ情報を更新しました (string)

+ Response 400

        {
            "status": 400,
            "message": "値を入力してください"
            "errors": [
                { message: "値を入力してください" }
            ],
        }

+ Response 404

        {
            "status": 404,
            "message": "ユーザが存在しません"
            "errors": [
                { message: "ユーザが存在しません" }
            ],
        }

+ Response 422

        {
            "status": 422,
            "message": "入力内容が正しくありません"
            "errors": [
              {
                "message":{
                  "email":["Eメールの形式で入力してください"],
                  "nickname":["名前が長すぎます。64文字以内で入力してください"],
                  "description":["文章が長すぎます。1024文字以内で入力してください"]
                }
              }
            ],
        }

+ Response 500

        {
            "status": 500,
            "message": "更新に失敗しました"
            "errors": [
                { message: "更新に失敗しました" }
            ],
        }


# Group TAGS

## Tags [/api/tags]

### ユーザーに設定できるタグ一覧を取得する [GET]

+ Response 200 (application/json)

    + Attributes (array[Tag])


# Group USER_TAGS

## UserTags [/api/users/{user_id}/user_tags]

+ Parameters

    + user_id: 1 (number) - usersテーブルのID

### ユーザーのタグ一覧を取得する [GET]

+ Response 200 (application/json)

    + Attributes (array[UserTag])


### ユーザーのタグ一覧を設定する [PUT]

+ Request (application/json)

    + Headers

            Authorization: ...

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

+ Request (application/json)

    + Headers

            Authorization: ...

    + Attributes (object)
        + tag: 2 (number)

+ Response 201 (application/json)

    + Headers

            Location: http://localhost:8080/api/users/{userId}/user_tags

    + Attributes (array[Tag])

# Group BLOGS


## BLOGS [api/blogs]


### すべてのブログ一覧を取得する
+ Request (application/json)

+ Response 200

    + Attributes (object)
        + status: 200 (number)
        + message: ブログ一覧を表示 (string)
        + data (array[Blog])

## BLOGS [api/blogs/{id}]

### ブログの詳細を取得する
+ Request (application/json)

+ Response 200

    + Attributes (object)
        + status: 200 (number)
        + message: ブログ詳細を表示 (string)
        + data (array[Blog])

+ Response 404

        {
            "status": 404,
            "message": "指定したブログは存在しません。"
            "errors": [
                { message: "指定したブログは存在しません。" }
            ],
        }



# Group GROUPS

## Groups [/api/groups]

### グループの一覧を取得する [GET]

+ Response 200 (application/json)

    + Attributes (array[Group])


### グループを追加する [POST]

+ Request (application/json)

    + Headers

            Authorization: ...

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

## Group [/api/groups/{group_id}]

+ Parameters

    + group_id: 1 (number) - groupsテーブルのID

### グループの詳細を取得する [GET]

+ Response 200 (application/json)

    + Attributes (Group)

### 特定のグループを編集する [PUT]

+ Request (application/json)

    + Headers

            Authorization: ...

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

+ Request (application/json)

    + Headers

            Authorization: ...

+ Response 204 (application/json)


# Group GROUP_USERS

## User to Group [/api/groups/{group_id}/join]

+ Parameters

    + group_id: 1 (number) - groupsテーブルのID

### 特定のグループにユーザーが参加する [POST]

+ Request (application/json)

    + Headers

            Authorization: ...

+ Response 200 (application/json)

    + Attributes (object)
        + status: 200 (number)
        + message: 参加しました (string)

+ Response 401 (application/json)

        {
            "code": 401,
            "message": "ログインが必要です",
            "errors": [],
        }

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

+ Request (application/json)

    + Headers

            Authorization: ...

+ Response 204 (application/json)


# Group GROUP_MESSAGES

## GroupMessages [/api/groups/{group_id}/messages]

+ Parameters

    + group_id: 1 (number) - groupsテーブルのID

### 特定のグループで発生したメッセージの一覧を取得する [GET]

+ Request (application/json)

    + Headers

            Authorization: ...

+ Response 200 (application/json)

    + Attributes (object)
        + group (Group)
        + messages (array[GroupMessage])

### 特定のグループに新規メッセージを送信する [POST]

+ Request (application/json)

    + Headers

            Authorization: ...

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

+ Request (application/json)

    + Headers

            Authorization: ...

    + Attributes (object)
        + body: 今日はみんなで僧帽筋を追い込みましょう！！ (string)

+ Response 200 (application/json)

    + Attributes (GroupMessage)

### 特定のグループで発生した特定のメッセージを一つ削除する [DELETE]

+ Request (application/json)

    + Headers

            Authorization: ...

+ Response 204 (application/json)

