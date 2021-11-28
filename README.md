## アプリケーション名
 Home business app

## アプリケーション概要
  在宅勤務時の勤務内容の報告及びその管理を目的としたWEB勤怠アプリ

## URL
 [Home business app](URL "Home business app login top")

## テスト用アカウント	

  <dl>ID/Pass</dl>
    <dd>ID: admin2 /Pass: 33333</dd>
    <dd></dd>
  <dl>テスト用アカウント等</dl>
    <dd>・管理者用 メールアドレス: bbb@gmail.com/パスワード: 000000P</dd>
    <dd>・一般用   メールアドレス: aaa@gmail.com/パスワード: 000000P</dd>
    <dd>・Githubリポジトリ: [Home business app](https://github.com/hana-0612/home-business-app "Home business app login top")</dd>

## 利用方法
  <dd>・新規アカウント作成ページよりアカウントを作成</dd>
  <dd>・ログイン後、打刻・報告ページより勤怠打刻、業務終了報告を投稿する</dd>
  <dd>・打刻・報告後は一覧にて報告内容が表示される
  <dd>・管理者のみ表示されるcsvボタンより報告内容の一覧をダウンロードすることが可能</dd>

## 目指した課題解決	
  メールでの報告を要請されている在宅勤務の勤怠報告を報告者及び管理者の双方の観点で業務効率を図るために現場に要望に合わせたWEB勤怠アプリ作成

## 洗い出した要件	
  [![Image from Gyazo](https://i.gyazo.com/6e16857e00ba34916e604978c6e7d7fb.png)](https://gyazo.com/6e16857e00ba34916e604978c6e7d7fb)

## 主な機能
 ユーザー管理機能、日次勤怠、実施内容の報告機能、管理者機能、csv出力機能

## ユーザー管理機能
  新規登録、ログイン・ログアウト、アカウントの編集
[![Image from Gyazo](https://i.gyazo.com/c76048392aae3d1426dfd02ed3599a3e.gif)](https://gyazo.com/c76048392aae3d1426dfd02ed3599a3e)
[![Image from Gyazo](https://i.gyazo.com/0b470d17261a87c646de16761255f65b.gif)](https://gyazo.com/0b470d17261a87c646de16761255f65b)

## 日次勤怠、実施業務の報告機能
  <dl>打刻・報告ページ</dl>
    <dd>① 各打刻時間（勤務開始・休憩開始・終了・勤務終了）のボタンを設置</dd> 
    <dd>② 終業時には実施した実施業務を報告する投稿機能を設置</dd>
  
  <dl>一覧ページ</dl>
    <dd></dd>
    <dd>部内のメンバーにおける勤務状況を共有する勤務状況一覧を表示</dd>
    <dd>※追加機能として編集機能、コメント機能、チャット機能のを対応中</dd>

[![Image from Gyazo](https://i.gyazo.com/cd2547e24b6d4a7a643fe8e8d11f9b54.gif)](https://gyazo.com/cd2547e24b6d4a7a643fe8e8d11f9b54)

## 管理者機能、csv出力機能
  管理者のみ勤怠管理業務の一貫で必要となるデータをcsvでダウンロード可能するボタンを設置
  [![Image from Gyazo](https://i.gyazo.com/89b74704a5691b4739089447546a5fa0.gif)](https://gyazo.com/89b74704a5691b4739089447546a5fa0)
  [![Image from Gyazo](https://i.gyazo.com/d02828bbfba46b80d9b679bc5a3a18b5.gif)](https://gyazo.com/d02828bbfba46b80d9b679bc5a3a18b5)


#テーブル設計

## users テーブル

| Column             | Type    | Options             |
| ------------------ | ------- | ------------------- |
| employee_number    | string  | null: false, unique |
| last_name          | string  | null: false         |
| first_name         | string  | null: false         |
| email              | string  | null: false, unique |
| encrypted_password | string  | null: false         |
| department         | text    | null: false         |
| position           | text    | null: false         |

## reports テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| start_of_work    | datetime   | null: false                    |
| breakstart       | datetime   |                                |
| breakend         | datetime   |                                |
| end_of_work      | datetime   |                                |
| business_content | text       |                                |
| user             | references | null: false, foreign_key: true |
| comment          | references | foreign_key: true              |
| manegement       | references | foreign_key: true              |

## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| text       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| report     | references | null: false, foreign_key: true |
| manegement | references | null: false                    |

## manegements テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| report     | references | foreign_key: true              |
| comment    | references | foreign_key: true              |