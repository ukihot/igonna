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

== バブルソート

バブルソートの最悪の計算量は$cal(O)(n^2)$である。
全ての要素を比較し、必要に応じてスワップ操作を行うことにより、入力配列が逆順にソートされている場合は最大限の比較とスワップが必要になる。

```rust
fn bubble_sort<T: Ord>(arr: &mut [T]) {
    if arr.is_empty() {
        return;
    }
    let mut sorted = false;
    let mut n = arr.len();
    while !sorted {
        sorted = true;
        for i in 0..n - 1 {
            if arr[i] > arr[i + 1] {
                arr.swap(i, i + 1);
                sorted = false;
            }
        }
        n -= 1;
    }
}
```

== 選択ソート


== 挿入ソート


== シェルソート


== バケットソート


== 分布数え上げソート



== 基数ソート


== マージソート


== ヒープソート


== クイックソート
