#> asset:artifact/0185.increased_cookie/give/2.give
#
# 神器の作成部 ここでID等を定義する
#
# @user
# @within function asset:artifact/0185.increased_cookie/give/1.trigger

# 神器の説明や消費MPなどをここで設定する。
# 最後にasset:artifact/common/giveを実行することで入手可能。

# 神器のID (int) スプレッドシートの値を入れる
    data modify storage asset:artifact ID set value 185
# 神器のベースアイテム
    data modify storage asset:artifact Item set value "minecraft:cookie"
# 神器の名前 (TextComponentString)
    data modify storage asset:artifact Name set value '[{"text":"増えたクッキー","color":"gold"}]'
# 神器の説明文 (TextComponentString[])
    data modify storage asset:artifact Lore set value ['[{"text":"ちょっと不思議なだけの平凡なクッキー"}]']
# MP以外の消費物 (TextComponentString) (オプション)
    # data modify storage asset:artifact CostText set value
# 使用回数 (int) (オプション)
    data modify storage asset:artifact RemainingCount set value 1
# 神器を発動できるスロット (string) Wikiを参照
    data modify storage asset:artifact Slot set value "auto"
# 神器のトリガー (string) Wikiを参照
    data modify storage asset:artifact Trigger set value "itemUse"
# MP消費量 (int)
    data modify storage asset:artifact MPCost set value 0
# MP必要量 (int) (オプション)
    # data modify storage asset:artifact MPRequire set value
# 扱える神 (string[]) Wikiを参照
    data modify storage asset:artifact CanUsedGod set value "ALL"
# カスタムNBT (NBTCompound) 追加で指定したいNBT (オプション)
    # data modify storage asset:artifact CustomNBT set value {}

# 神器の入手用function
    function asset:artifact/common/give