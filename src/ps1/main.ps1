$h = New-Object System.Collections.ArrayList

#$c = Get-Content $myInvocation.MyCommand.Path
#function w($c) { Invoke-Expression($c[($c.IndexOf("program_(")+1)..($c.IndexOf("voila_()")-1)]-join""-split"`""|%{$_-replace"_\(","_ @("})-join"`"" }
function w($c) {
    $clean = $c[($c.IndexOf("`nprogram_(`n")+10)..($c.IndexOf("`nvoila_()`n"))]-join""
    $chunks = $clean[0..($clean.LastIndexOf(",")-1)]-join"" -split '"'
    $k = 0
    $preprocessed = ($chunks |% { ++$k -band 1 ? $_-replace"_\s*\(","_ @(`$("-replace"\)","))"-replace",","),`$(" : $_ }) -join "'"
    # Write-Host $preprocessed
    Invoke-Expression $preprocessed
}
function zap($ab, $do) {
    $a = $null -ne $ab[0] ? $ab[0] : @()
    $b = $null -ne $ab[1] ? $ab[1] : @()
    $c = $a.Count-1
    if (0 -le $c) { 0..$c |% { $v = $a[$_]; $u = $b[$_]; . $do } }
}
function powu($a, $b) {
    if (1 -eq $b) {
        $a
    } elseif (0 -eq $b) {
        1
    } else {
        $c = [int]($b / 2)
        $d = [int](powu $a $c)
        $s = $d * $d
        if ($b % 2) { $s = $s * $a }
        $s
    }
}

function no_($l) { if ($null -ne $l[0]) { $l |% { 0+!$_ } } }

function cmp_($ab) { zap $ab { $v -lt $u ? -1 : $v -gt $u ? 1 : 0 } }
function add_($ab) { zap $ab { $v + $u } }
function sub_($ab) { zap $ab { $v - $u } }
function mul_($ab) { zap $ab { $v * $u } }
function div_($ab) { zap $ab { [int]($v / $u) } }
function mod_($ab) { zap $ab { ($v % $u + $u) % $u } }
function pow_($ab) { zap $ab { powu $v $u } }

function sum_($l) { $r = 0; if ($null -ne $l[0]) { $l |% { $r+= $_ } } $r }
function prd_($l) { $r = 1; if ($null -ne $l[0]) { $l |% { $r*= $_ } } $r }
function max_($l) { ($l | sort)[-1] }
function min_($l) { ($l | sort)[0] }

function v_($vs) { $vs }
function s_($s) { [int[]][char[]]$s[0] }
function l_($l) { $l[-1] }

function span_($s) { $s[0]-$s[1] ? ($s[0]..($s[1]-1) |? { !(($_-$s[0]) % $s[2]) }) : @() }
function copy_($lc) { (1 -eq $lc[0].Count ? @($lc[0]) : $lc[0]) * $lc[1] }

function pick_($li) { $null -ne $li[0] -and $null -ne $li[1] ? ($li[1] |% { $li[0][$_] }) : @() }
function stow_($liv) { if (0 -ne $liv[1].Count) { (0..($liv[1].Count-1)) |% { $liv[0][$liv[1][$_]] = $liv[2][$_] } } $liv[0] }
function find_($lv) { $null -ne $lv[0] ? (0..($lv[0].Count) |? { $lv[0][$_] -eq $lv[1] }) : @() }

function size_($l) { $null -ne $l[0] ? $l.GetLength(0) : 0 }

function hold_($l) { $h.AddRange($l); $l }
function drop_($oc) { $z = $h.Count-$oc[0]-$oc[1]; $r = @($h.GetRange($z, $oc[1])); $h.RemoveRange($z, $oc[1]); $r }

function does_($ls) { l_ $ls }


w '
program_(
    %heretest% (whole line is replaced)
voila_()
)
'
