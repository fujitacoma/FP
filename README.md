# アプリケーション名
Fesparation

# アプリケーション概要
Fes(祭り) + Preparation(予習) = Fesparation
国内の野外音楽フェスについて予習と情報収集ができるサイト。
フェスの基本情報はもちろんのこと、フェス会場の雰囲気から出演アーティストの客層、おすすめ楽曲等をユーザー同士で情報交換しあえる。

# URL
<!-- デプロイ済みのURLを記載。 -->

# テスト用アカウント
<!-- ログイン機能等を実装した場合は、ログインに必要な情報を記載。またBasic認証等を設けている場合は、そのID/Passも記載。 -->

# 利用方法
【機能一覧】
・フェスの検索
・フェスの一覧
・フェスの詳細表示
・フェスの編集(一部)
・フェスのお気に入り登録
・フェスの追加
・フェスの削除
・コメント機能
・マイページ機能

【会員登録、ログインなしで使用できる機能】
・フェスの検索
・フェスの一覧
・フェスの詳細表示

【会員登録、ログインが必要な機能】
・フェスの編集(一部)
・フェスのお気に入り登録
・コメント機能
・マイページ機能

【管理人アカウントのみできること】
・フェスの追加
・フェスの削除

# アプリケーションを作成した背景
初めてのフェスに行く時は、会場の雰囲気や地形、あれば良いものと言った情報が必要になるが、
そういった情報はTwitterやまとめサイト、ブログ等複数の情報源から集めるしかなかった。
そこで、全国各地のフェス情報をまとめて閲覧でき、コメントで質問や回答による交流ができるアプリがあれば良いと思い、
作成しようと思った。

# 洗い出した要件
<!-- 要件定義スプレッドシートのURL -->

# 実装した機能についての画像やGIFおよびその説明※
<!-- 画像を添付 -->

# 実装予定の機能
<!-- 洗い出した要件の中から、今後実装予定の機能がある場合は、その機能を記載。 -->

# データベース設計
<!-- ER図を添付。 -->

# 画面遷移図
<!-- 画面遷移図を添付。 -->

# 開発環境
<!-- 使用した言語・サービスを記載。 -->

# 工夫したポイント※
<!-- 制作背景・使用技術・開発方法・タスク管理など、企業へＰＲしたい事柄 -->


# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------  | ------------------------  |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| admin              | boolean |                           |

### Association
- has_many :events
- has_many :comments
- has_many :favorites
- has_many :fav_events,through :favorites,source :event


## events テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| event_name         | string     | null: false                    |
| content            | text       | null: false                    |
| prefecture_id      | integer    | null: false                    |
| date               | date       | null: false                    |
| official_link      | text       |                                |
| youtube_link       | text       |                                |
| instagram_link     | text       |                                |
| twitter_link       | text       |                                |
| user               | references | null: false, foreign_key: true |

### Association
- has_many :comments
- has_many :favorites
- has_many :users,through :comments,favorites


## comments テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| content            | text       | null: false                    |
| user               | references | null: false, foreign_key: true |
| event              | references | null: false, foreign_key: true |

### Association
- belongs_to :event
- belongs_to :user


## favorites テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| event              | references | null: false, foreign_key: true |

### Association
- belongs_to :event
- belongs_to :user
