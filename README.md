# using_provider

ChangeNotifierとProviderを利用したflutterアプリのアーキテクチャ勉強用リポジトリ

## このリポジトリで何ができるの？

```
・ChangeNotifierとProviderを利用した状態管理
・共通コンポーネントでの状態管理(atom/InputText)
・SnackBarの利用方法(util/snack_message)
・Navigatorの利用方法(util/navigate)
・ripositoryをProviderで管理する方法(repository)
・例外発生時の補足(main.dart)
・ローディングの利用方法(atom/loading.dart)
```

## 今後やるかどうか迷ってる点

状態へのアクセス方法が利便性重視でcontext.read, context.selectを利用している。  
SelectorやConsumerを利用した方が、リビルド時の範囲を制限できるので、パフォーマンスが悪そうならその方法に置き換える。