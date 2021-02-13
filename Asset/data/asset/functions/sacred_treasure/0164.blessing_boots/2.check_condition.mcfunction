#> asset:sacred_treasure/0164.blessing_boots/2.check_condition
#
# 神器の発動条件をチェックします
#
# @within function asset:sacred_treasure/0164.blessing_boots/1.trigger

# 神器の基本的な条件の確認を行うfunction、成功している場合CanUsedタグが付く auto/feet/legs/chest/head/mainhand/offhandを記載してね
    function asset:sacred_treasure/lib/check_condition/feet
# 他にアイテム等確認する場合はここに書く

# Y座標が0未満のみ処理
    execute if entity @s[y=0,dy=255] run tag @s remove CanUsed

# CanUsedタグをチェックして3.main.mcfunctionを実行する
    execute if entity @s[tag=CanUsed] run function asset:sacred_treasure/0164.blessing_boots/3.main