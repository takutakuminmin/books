# AirBook
## 機能一覧
- 記事一覧表示機能
- 記事詳細表示機能
- 記事投稿機能
- 記事編集機能（その記事の投稿者のみ）
- 記事削除機能（その記事の投稿者のみ）
- 記事検索機能
- マイページ機能
- ページネーション機能
- ユーザー登録機能
- ユーザーログイン機能
- コメント機能
- いいね機能

## 使い方
日常の読書から学んだことを手軽にアウトプットし共有できます。
トップページの右下の「投稿」と書いてあるボタンを押していただくと、投稿画面に遷移し、記入欄を記入していただき「投稿する」ボタンを押していただくと投稿できます。

## 使用技術
### データベース
MySQL 5.6.47

### インフラ
AWS EC2

### デプロイ
Capistranoによる自動デプロイ

# AirBook DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
### Association
- has_many :posts
- has_many :comments

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text||
|title|text||
|page|text||
|line|text||
|text|text||
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user