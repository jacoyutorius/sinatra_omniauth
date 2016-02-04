## SinatraOmniauth

Sinatra + Omniauth


## Install

~/.bash_profile

```
export FACEBOOK_APP_ID=""
export FACEBOOK_APP_SECRET=""
export GOOGLE_APP_ID=""
export GOOGLE_APP_SECRET=""
export GITHUB_APP_ID=""
export GITHUB_APP_SECRET=""
```


```
bundle install --path .bundle
bundle exec ruby app.rb
```


## Provider

- 今の時点ではGoogleでの認証に成功していない。
- TwitterはlocalhostでCallbackURLの登録に失敗するのと、携帯電話番号を設定する必要があるため今回はやっていない


#### [Facebook for developpers](https://developers.facebook.com/)
#### [Twitter Developpers](https://apps.twitter.com/)
#### [Github Applications](https://github.com/settings/applications)

## 参考

[OmniAuthを使って見る](http://qiita.com/tyfkda/items/38da1bb173775f70a15a)
