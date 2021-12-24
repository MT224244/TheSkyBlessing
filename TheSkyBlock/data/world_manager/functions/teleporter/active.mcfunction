#> world_manager:teleporter/active
#
#
#
# @within function world_manager:teleporter/

# どうせ使うのでthisをつける
    tag @s add this

# スコア増加
    scoreboard players add @s Teleporter 1
# VFX
    execute if score @s Teleporter matches 1..39 run function world_manager:teleporter/vfx/pre-tp/
    execute if score @s Teleporter matches 40 run function world_manager:teleporter/vfx/teleport/from
# TPする
    execute if score @s Teleporter matches 40 as @e[type=marker,tag=FromTeleporter,distance=..1,limit=1] run function world_manager:teleporter/tp/
# リセット
    tag @s remove this