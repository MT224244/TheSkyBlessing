#> asset:artifact/0328.attract_hook_shot/give/2.give
#
# 神器の作成部 ここでID等を定義する
#
# @user
# @within function asset:artifact/0328.attract_hook_shot/give/1.trigger

# 神器の説明や消費MPなどをここで設定する。
# 最後にasset:artifact/common/giveを実行することで入手可能。

# 神器のID (int) スプレッドシートの値を入れる
    data modify storage asset:artifact ID set value 328
# 神器のベースアイテム
    data modify storage asset:artifact Item set value "minecraft:bow"
# 神器の名前 (TextComponentString)
    data modify storage asset:artifact Name set value '{"text":"引き寄せフックショット","color":"yellow"}'
# 神器の説明文 (TextComponentString[])
    data modify storage asset:artifact Lore set value ['[{"text":"ヒットした","color":"white"},{"text":"敵","color":"red"},{"text":"を使用者の手前まで","color":"white"},{"text":"テレポート","color":"yellow"},{"text":"させる。","color":"white"}]']
# MP以外の消費物 (TextComponentString) (オプション)
    # data modify storage asset:artifact CostText set value
# 使用回数 (int) (オプション)
    # data modify storage asset:artifact RemainingCount set value
# 神器を発動できるスロット (string) Wikiを参照
    data modify storage asset:artifact Slot set value "mainhand"
# 神器のトリガー (string) Wikiを参照
    data modify storage asset:artifact Trigger set value "onAttackByProjectile"
# 神器の発動条件 (TextComponentString) (オプション)
    # data modify storage asset:artifact Condition set value
# MP消費量 (int)
    data modify storage asset:artifact MPCost set value 20
# MP必要量 (int) (オプション)
    # data modify storage asset:artifact MPRequire set value
# 神器のクールダウン (int) (オプション)
    # data modify storage asset:artifact LocalCooldown set value
# グローバルクールダウン (int) (オプション)
    # data modify storage asset:artifact SpecialCooldown set value
# 扱える神 (string[]) Wikiを参照
    data modify storage asset:artifact CanUsedGod set value ["Urban", "Nyaptov", "Rumor"]
# カスタムNBT (NBTCompound) 追加で指定したいNBT (オプション)
    # data modify storage asset:artifact CustomNBT set value {}

# 神器の入手用function
    function asset:artifact/common/give