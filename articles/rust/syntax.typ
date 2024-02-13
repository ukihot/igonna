#import "@preview/codly:0.2.0": *
#let ruby(rt, rb, size: 0.4em, alignment: "between") = {
    let gutter = if (alignment=="center" or alignment=="start") {h(0pt)} else if (alignment=="between" or alignment=="around") {h(1fr)}
    let chars = if(alignment=="around") {
        [#h(0.5fr)#rt.clusters().join(gutter)#h(0.5fr)]
    } else {
        rt.clusters().join(gutter)
    }
    style(st=> {
        let bodysize = measure(rb, st)
        let rt_plain = text(size: size, rt)
        let width = if(measure(rt_plain, st).width > bodysize.width) {measure(rt_plain, st).width} else {bodysize.width}
        let rubytext = box(width: width, align(if(alignment=="start"){left}else{center}, text(size: size, chars)))
        let textsize = measure(rubytext, st)
        let x = if(alignment=="start"){0pt}else{bodysize.width/2-textsize.width/2}
        box[#place(top+left, dx: x, dy: -size*1.2, rubytext)#rb]
    })
}
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
  rust: (name: "Rust", icon: icon("brand-rust.svg"), color: rgb("#CE412B")),
))

== コーディング <syntax>

プログラムを開発する作業全般をプログラミングといい，特にソースコードを書く工程をコーディングという。
コーディングにおいて、シンタックスとデザインパターンは中核を成す。

シンタックスとは、プログラミング言語の仕様として定められた構文規則を指す。
デザインパターンについてはWiki#footnote[https://w.wiki/rvm]を引用する。

#quote(attribution: [Wikipedia])[ソフトウェア開発におけるデザインパターンまたは設計パターン（英: design pattern）とは、過去のソフトウェア設計者が発見し編み出した設計ノウハウを蓄積し、名前をつけ、再利用しやすいように特定の規約に従ってカタログ化したものである。]

これより、シンタックスに関連する事項を説明する。
通常、伝統的なアプローチでは「ハローワールド関数」から始めることが一般的だが、本書では変数に関する説明から始める。

== 変数

以下のコードはどのような処理か考えてみよう。

```rust
let x = 4;
```

`x`は変数、4は整数リテラル#footnote[リテラルとはソースコードに生で書かれたデータであり、値そのものである。例えば、4(リテラル)に5(値)を束縛することはできない。]である。
それと同時に、`x`は4を束縛(bind)する所有者である。
`let`は変数宣言のキーワードとなっており、以下の構文を想定している。

```rust
let PATTERN = EXPRESSION;
```

整数リテラル4単体であっても、右辺は式である。
式が返却する値は4であり、左辺のパターン`x`に当てはめて束縛される。

パターンであるという認識はとても重要で、以下はエラーにならない。
```rust
let (a, b) = (4, 5);
```

ただし、パターンには2つの形式が存在する。上記の_Irrefutable_(#ruby("ろんばく")[論駁]不可能)なパターンと、`let`式で扱うことができない_Refutable_(論駁可能)なパターンである。
この_Refutability_(論駁可能性)の概念については、エラーメッセージで見かけた際に対応できるように、慣れておく必要がある。
_Refutable_なパターンはまた別の章で触れる。

変数宣言は、値`4`に別のラベル`x`を張り替えるような作業ではなく、所有者`x`に`4`が束縛されるという認識をもってほしい。

== 型

Rust標準のプリミティブ型を表にした。
型の名前に含まれる数字は、ポインタのサイズ(ビット)を指す。

#table(
  columns: (1fr, auto),
  inset: 1em,
  align: horizon,
  [*基本データ型*], [*型*],
  "符号付き整数",
  "isize, i8, i16, i32, i64",
  "符号無し整数",
  "usize, u8, u16, u32, u64",
  "浮動小数点数",
  "f32, f64",
  "文字(Unicodeのスカラー値)",
  "char"
)

特に数値を表す型の許容値は以下となる。

#table(columns: (1fr, 1fr, auto),align: auto,
  [*型*], [*MIN*], [*MAX*],
  "i8", $-128$, $127$,
  "i16", $-32768$, $32767$,
  "i32", $-2^32$, $2^32-1$,
  "i64", $-2^64$, $-2^64-1$,
  "u8", $0$, $255$,
  "u16", $0$, $65535$,
  "u32", $0$, $2^32$,
  "u64", $0$, $2^64$,
  "f32", "凡そ-21億", "凡そ+21億",
  "f64", "凡そ-9京", "凡そ+9京",
)

isizeおよびusizeは実行環境PCのCPUのビット数によって適切なサイズに変化する。

=== 型推論

初期化の際に評価値の型をチェックするだけでなく、その後にどのような使われ方をしているかを見て推論する。

== 関数


ハローワールドプログラムを観察する。

```rust
fn main() {
    println!("Hello, world!");
}
```

== コメント

== 制御フロー

=== if

=== loop

=== while


=== for