h = {}

unpack = table.unpack or unpack
function map(a, f, b, r) b, r = b or {}, {} for k,v in ipairs(a) do r[k] = f(v, b[k]) end return r end

function no_(l) return map(l, function(v) return 0 == v and 1 or 0 end) end

function cmp_(a, b) return map(a, function(v, u) return v < u and -1 or v > u and 1 or 0 end, b) end
function add_(a, b) return map(a, function(v, u) return v + u end, b) end
function sub_(a, b) return map(a, function(v, u) return v - u end, b) end
function mul_(a, b) return map(a, function(v, u) return v * u end, b) end
function div_(a, b) return map(a, function(v, u) return v // u end, b) end
function mod_(a, b) return map(a, function(v, u) return v % u end, b) end
function pow_(a, b) return map(a, function(v, u) return math.floor(v ^ u) end, b) end

function sum_(l, r) r = 0 map(l, function(v) r = r + v end) return r end
function prd_(l, r) r = 1 map(l, function(v) r = r * v end) return r end
function max_(l) return math.max(unpack(l)) end
function min_(l) return math.min(unpack(l)) end

function v_(...) return { ... } end
function s_(s, r) r = {} for k=1,#s do r[k] = string.byte(s, k) end return r end
function l_(l) return l[#l] end

function span_(sa, so, se, r) r = {} for k=sa,so-1,se do r[#r+1] = k end return r end
function copy_(l, c, r) r = {} for k=1,c do for n=1,#l do r[#r+1] = l[n] end end return r end

function pick_(l, i) return map(i, function(k) return l[k+1] end) end
function stow_(l, i, v) for n,k in ipairs(i) do l[k+1] = v[n] end return l end
function find_(l, v, n, r) n, r = 1, {} for k,e in ipairs(l) do if e == v then r[n], n = k-1, n+1 end end return r end

function size_(l) return #l end

function hold_(l) for k,v in ipairs(l) do h[#h+1] = v end return l end
function drop_(o, c, r) r = {} for k=#h-o+1-c,#h do if k < #h-o+1 then r[#r+1] = h[k] end h[k] = h[k+c] end return r end

function does_(...) return l_{ ... } end

function program_(r) w = v_ if type{} == type(r) then print(unpack(r)) else print(r) end return 0 end
function voila_() end

print((function(f,o)return f(o,f)end)(function(o,f,r,s)if"table"==type(o)then r="{"for _,p in ipairs(o)do r,s=r..(s or"")..f(p,f),","end r=r.."}"else r=""..(o or"nil")end return r end,
-- %heretest% (whole line is replaced)
0
))
