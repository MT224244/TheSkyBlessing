#> asset:sacred_treasure/0710.mage_boots/trigger/3.main
#
# 神器のメイン処理部
#
# @within function asset:sacred_treasure/0710.mage_boots/trigger/2.check_condition

# 基本的な使用時の処理(MP消費や使用回数の処理など)を行う
    function asset:sacred_treasure/lib/use/feet

# ここから先は神器側の効果の処理を書く

# 魔法ダメージ量+7.5%
    data modify storage api: Argument.UUID set value [I;1,1,710,3]
    data modify storage api: Argument.Amount set value 0.075
    data modify storage api: Argument.Operation set value "multiply_base"
    function api:player_modifier/attack/magic/add

# 魔法耐性+5%
    data modify storage api: Argument.UUID set value [I;1,1,710,3]
    data modify storage api: Argument.Amount set value 0.05
    data modify storage api: Argument.Operation set value "multiply_base"
    function api:player_modifier/defense/magic/add

# MP回復量+7.5%
    data modify storage api: Argument.UUID set value [I;1,1,710,3]
    data modify storage api: Argument.Amount set value 0.075
    data modify storage api: Argument.Operation set value "multiply_base"
    function api:player_modifier/mp_regen/add

# 演出
    particle witch ~ ~0.3 ~ 0.3 0.1 0.3 1 10 normal @a
    particle enchant ~ ~0.3 ~ 0.4 0.1 0.4 0 30 normal @a
    playsound minecraft:block.enchantment_table.use master @a ~ ~ ~ 0.8 0 0