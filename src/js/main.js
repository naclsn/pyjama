var h = []

  , no_ = l => l.map(v => v ? 0 : 1)

  , cmp_ = (a, b) => a.map((v, k) => v < b[k] ? -1 : v > b[k] ? 1 : 0)
  , add_ = (a, b) => a.map((v, k) => v + b[k])
  , sub_ = (a, b) => a.map((v, k) => v - b[k])
  , mul_ = (a, b) => a.map((v, k) => v * b[k])
  , div_ = (a, b) => a.map((v, k) => (v / b[k])<<0)
  , mod_ = (a, b) => b.map((u, k) => (a[k] % u + u) % u)
  , pow_ = (a, b) => a.map((v, k) => Math.pow(v, b[k])<<0)

  , sum_ = l => l.reduce((p, c) => p+c, 0)
  , prd_ = l => l.reduce((p, c) => p*c, 1)
  , max_ = l => l.length ? Math.max(...l) : 0
  , min_ = l => l.length ? Math.min(...l) : 0

  , v_ = (...vs) => vs
  , s_ = s => s.split(String()).map(c => c.charCodeAt())
  , l_ = l => l[l.length-1]

  , span_ = (sa, so, se) => { var r = []; for (var k = sa; 0 < se ? k < so : so < k; k+= se) r.push(k); return r; }
  , copy_ = (l, c) => Array(c).fill(0).flatMap(_ => l)

  , pick_ = (l, i) => i.map(k => l[k])
  , stow_ = (l, i, v) => (i.map((k, n) => l[k] = v[n]), l)
  , find_ = (l, v) => l.flatMap((e, k) => e == v ? k : [])

  , size_ = l => l.length

  , hold_ = l => (h.push(...l), l)
  , drop_ = (o, c) => h.splice(h.length-o-c, c)

  , does_ = (...ls) => l_(ls)

  , program_ = r => console.log(r)
  , voila_ = _ => 0
;

console.log(JSON.stringify(
// %heretest% (whole line is replaced)
));
