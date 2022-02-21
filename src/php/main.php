<?php
$h = array();

function no_($l) { return array_map(function($v) { return 1-!!$v; }, $l); }

function cmp_($a, $b) { return array_map(function($v, $u) { return $v < $u ? -1 : ($v > $u ? 1 : 0); }, $a, $b); }
function add_($a, $b) { return array_map(function($v, $u) { return $v + $u; }, $a, $b); }
function sub_($a, $b) { return array_map(function($v, $u) { return $v - $u; }, $a, $b); }
function mul_($a, $b) { return array_map(function($v, $u) { return $v * $u; }, $a, $b); }
function div_($a, $b) { return array_map(function($v, $u) { return intdiv($v, $u); }, $a, $b); }
// function mod_($a, $b) { return array_map(function($v, $u) { return $v % $u; }, $a, $b); }
function mod_($a, $b) { return array_map(function($v, $u) { return ($v % $u + $u) % $u; }, $a, $b); }
function pow_($a, $b) { return array_map(function($v, $u) { return pow($v, $u); }, $a, $b); }

function sum_($l) { return array_sum($l); }
function prd_($l) { return array_product($l); }
function max_($l) { return max($l); }
function min_($l) { return min($l); }

function v_(...$vs) { return $vs; }
function s_($s) { return array_map('ord', $s ? str_split($s) : array()); }
function l_($l) { return $l[count($l)-1]; }

function span_($sa, $so, $se) { return $sa == $so ? array() : range($sa, $so-1, $se); }
function copy_($l, $c) { return array_merge(...array_fill(0, $c, $l)); }

function pick_($l, $i) { $r = array(); foreach ($i as $k) array_push($r, $l[$k]); return $r; }
function stow_($l, $i, $v) { foreach ($i as $n => $k) $l[$k] = $v[$n]; return $l; }
function find_($l, $v) { $r = array(); foreach ($l as $k => $e) if ($e == $v) array_push($r, $k); return $r; }

function size_($l) { return count($l); }

function hold_($l) { global $h; array_push($h, ...$l); return $l; }
function drop_($o, $c) { global $h; return array_splice($h, count($h)-$o-$c, $c); }

function does_(...$ls) { return l_($ls); }

function program_() {}
function voila_() { die; }

echo(function($o){return is_array($o)?"array(".implode(", ",$o).")":$o;})(
// %heretest% (whole line is replaced)
);

?>
