#> asset:mob/0023.chainsaw_zombie/tick/2.1.attack
#
#
#
# @within function asset:mob/0023.chainsaw_zombie/tick/2.tick
#> private
# @private
    #declare score_holder $VectorMagnitude

# 演出
    playsound entity.generic.drink master @a ~ ~ ~ 0.8 0.3
    playsound block.soul_sand.place master @a ~ ~ ~ 1.0 0.8
# 突進する
    scoreboard players set $VectorMagnitude Lib 200
    execute facing entity @p feet rotated ~ ~-10 run function lib:motion/

# リセット
    scoreboard players reset $VectorMagnitude