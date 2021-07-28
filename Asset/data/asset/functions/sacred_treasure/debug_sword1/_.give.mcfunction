#> asset:sacred_treasure/debug_sword1/_.give
#
# 神器の作成部 ここでID等を定義する
#
# @user
# @private

# 神器の説明や消費MPなどをここで設定する。
# 最後にasset:sacred_treasure/lib/giveを実行することで入手可能。

# 神器のID (int) スプレッドシートの値を入れる
    data modify storage asset:sacred_treasure ID set value 10000
# 神器のベースアイテム
    data modify storage asset:sacred_treasure Item set value "minecraft:stick"
# 神器の名前 (TextComponentString)
    data modify storage asset:sacred_treasure Name set value '{"text":"バランス調整用1","color":"aqua"}'
# 神器の説明文 (TextComponentString[])
    data modify storage asset:sacred_treasure Lore set value []
# 神器を発動できるスロット (string) Wikiを参照
    data modify storage asset:sacred_treasure Slot set value "mainhand"
# 神器のトリガー (string) Wikiを参照
    data modify storage asset:sacred_treasure Trigger set value "onAttackByMelee"
# MP消費量 (int)
    data modify storage asset:sacred_treasure MPCost set value 0
# 神器のクールダウン (int) (オプション)
    data modify storage asset:sacred_treasure LocalCooldown set value 20
# 扱える神 (string[]) Wikiを参照
    data modify storage asset:sacred_treasure CanUsedGod set value [Flora,Urban,Nyaptov,Wi-ki,Rumor]

# 神器の入手用function
    function asset:sacred_treasure/lib/give