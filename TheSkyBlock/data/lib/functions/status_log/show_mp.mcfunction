#> lib:status_log/show_mp
#
#
#
# @within function lib:mp/fluctuation

#> For Init
# @private
    #declare score_holder $Fluctuation
    #declare tag LogAECInit
    #declare score_holder $isNegative
    #declare tag SummonPosStand

# 負数の場合の処理
    execute store success score $isNegative Temporary if score $Fluctuation Lib matches ..-1
    execute if score $isNegative Temporary matches 1 run scoreboard players operation $Fluctuation Lib *= $-1 Const
# 少数部を取り出す
    scoreboard players operation $Frac Temporary = $Fluctuation Lib
    scoreboard players operation $Frac Temporary /= $10 Const
    scoreboard players operation $Frac Temporary %= $10 Const
# 値は100倍されたもの
    scoreboard players operation $Int Temporary = $Fluctuation Lib
    scoreboard players operation $Int Temporary /= $100 Const
# 整数のみ値の符号を戻す
    execute if score $isNegative Temporary matches 1 run scoreboard players operation $Int Temporary *= $-1 Const
# 設置位置用AEC
    execute anchored eyes positioned ^ ^ ^ run summon armor_stand ~ ~ ~ {Marker:1b,Small:1b,Invisible:1b,Tags:["SummonPosStand"]}
# 表示位置変更
    execute anchored eyes positioned ^ ^ ^ as @e[type=armor_stand,tag=SummonPosStand,distance=..0.001,limit=1] run function lib:status_log/core/set_position
# 描画用AEC
    execute anchored eyes positioned ^ ^ ^ at @e[type=armor_stand,tag=SummonPosStand,distance=..1.5,limit=1] run summon armor_stand ~ ~ ~ {Marker:1b,Small:1b,Invisible:1b,Tags:["LogAEC", "LogAECInit","Object"],CustomName:'""',CustomNameVisible:1b}
# 表示文字列生成
    loot replace block 10000 0 10000 container.0 loot lib:status_log/mp
# 文字列描画
    execute anchored eyes positioned ^ ^ ^ run data modify entity @e[type=armor_stand,tag=LogAECInit,distance=..1.5,limit=1] CustomName set from block 10000 0 10000 Items[0].tag.display.Name
# タグ削除
    execute anchored eyes positioned ^ ^ ^ run tag @e[type=armor_stand,tag=LogAECInit,distance=..1.5,limit=1] remove LogAECInit
# リセット
    execute anchored eyes positioned ^ ^ ^ run kill @e[type=armor_stand,tag=SummonPosStand,distance=..1.5,limit=1]
    scoreboard players reset $Fluctuation Lib
    scoreboard players reset $Frac Temporary
    scoreboard players reset $Int Temporary
    scoreboard players reset $isNegative Temporary