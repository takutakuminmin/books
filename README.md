# AirBook
- URL http://54.150.237.9
## 機能一覧
- 記事一覧表示機能
- 記事詳細表示機能
- 記事投稿機能
- 記事編集機能（その記事の投稿者のみ）
- 記事削除機能（その記事の投稿者のみ）
- 記事検索機能
- マイページ機能
- プロフィール機能
- ページネーション機能
- ユーザー登録機能
- ユーザーログイン機能
- ユーザー情報編集機能
- ゲストログイン機能
- コメント機能
- いいね機能
- 単体テスト

## 概要
- 日常の読書から学んだことを手軽にアウトプットし共有できる
- 読書習慣の継続に役立つ
- 新たな本との出会いになる

### 工夫した点
記事投稿の際に、面白かった内容に加えて本の著者名、何ページ目の何行目かまで記すことができるようにし、投稿者は復習しやすい仕様にした。
### 課題や今後実装したい機能
- いいね機能とコメント機能の非同期通信
- 投稿自体にタイトルをつけられるようにしてより見やすいものにする

## 使用技術
### データベース
- MySQL 5.6.47

### インフラ
- AWS EC2

### デプロイ
- Capistranoによる自動デプロイ

### テスト
- RSpec

# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
### Association
- has_many :posts
- has_many :comments
- has_many :likes
- has_many :liked_posts

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text||
|title|text|null: false|
|page|text|null: false|
|line|text|null: false|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments
- has_many :likes
- has_many :liked_posts

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user