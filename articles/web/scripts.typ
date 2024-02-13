#import "@preview/codly:0.2.0": *
#let icon(codepoint) = {
  box(
    height: 0.8em,
    baseline: 0.05em,
    image(codepoint)
  )
  h(0.1em)
}

#show: codly-init.with()
#codly(languages: (
  html: (name: "HTML", icon: icon("html5.svg"), color: rgb("#ff6a25")),
))


== JavaScript

Javascriptは1995年にBrendan Eich氏によって開発された。
クライアントサイド#footnote[サーバではなくユーザー側のモバイルやPC上を指す。]で動作するスクリプト言語として誕生し、HTMLに動きや対話性をもたらした。

HTMLで定義された要素に対し、イベントや条件に応じて操作や変更を行うことも機能の一つである。
例えば、ボタンをクリックしたときにアラートを表示したり、入力フォームの値を検証したり、画像を切り替えたり、アニメーションやゲームを作ることも可能である。
JavaScriptライブラリ#footnote[流行り廃りは https://stateofjs.com から確認できる。]を利用して高度なWebアプリケーションも開発されている。

著名なSNSもすべて、ブラウザ上ではJavaScriptが動いている。

== JavaScriptエンジン

JavaScriptコードを解析するコアプログラムをJavaScriptエンジンという。
Webブラウザはエンジンを搭載されているため、JavaScriptを実行できる。

#table(
  columns: (1fr, auto),
  inset: 1em,
  align: horizon,
  [*Browser*], [*Engine*],
  "Google Chrome",
  "V8",
  "Microsoft Edge",
  "V8",
  "FireFox",
  "SpiderMonkey",
  "Safari",
  "JavaScriptCore"
)

JavaScriptエンジンを独自に再開発するプロジェクト#footnote[https://github.com/boa-dev/boa]も存在する。

== JavaScriptランタイム

JavaScriptエンジンを含む、JavaScript実行環境をランタイムという。

- Node.js(V8を採用)
- Bun.sh(JavaScriptCoreを採用)
- Deno(V8を採用)

== JavaScriptを動かしてみる

任意のディレクトリで新規のHTMLファイルを作成する。
```sh
toucn index.html
```

以下はいわゆるトースト通知を実装したスクリプトである。
このままコピー&ペーストし、`index.html`をWebブラウザで開くとJavaScriptの挙動を確認できる。JavaScriptが埋め込まれたHTMLファイルは、特別なコマンドや操作は必要とせず、Webブラウザに自動的に実行される。

```html
<!DOCTYPE html>
<html lang="jp">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Exaple</title>
    <style>
      #toast {
        display: flex;
        visibility: hidden;
        height: 60px;
        width: 300px;
        border: 1px solid rgba(0, 0, 0, 0.1);
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
      }
      #toast > p {
        margin: auto 8px;
        font-size: 14px;
        color: #155724;
        letter-spacing: 0;
        line-height: 18px;
      }
    </style>
  </head>
  <body>
    <div id="toast">
      <p>Hello, JavaScript!</p>
    </div>
    <button class="button">Enter</button>

    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const toast = document.querySelector("#toast");
        const button = document.querySelector(".button");

        button.addEventListener("click", () => {
          toast.style.visibility = "visible";
          setTimeout(function () {
            toast.style.visibility = "hidden";
          }, 3000);
        });
      });
    </script>
  </body>
</html>
```

`<script>`タグで囲まれている箇所がJavaScriptにあたる。
本書では、JavaScriptのシンタックスについては触れないが、`Coding`セクションが理解できていれば問題ない。
既に`Rust`がプログラミング言語の中で母国語のような存在に昇格できていれば，おそらく`JavaScript`もある一定レベルまで読むことができるだろう。

また、上記のHTMLには最低限の`CSS`によってスタイリングされている。
削除した場合にどのようなふるまいになるか，確認してみるといい。

== DOM
