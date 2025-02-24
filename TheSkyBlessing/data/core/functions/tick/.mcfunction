#> core:tick/
#
# #tick時に毎回実行される処理群
#
# ここには多くの処理を書かないこと
#
# @within tag/function minecraft:tick

#> Val
# @private
#declare score_holder $4tInterval

# デバッグ用TickRate操作システム
    execute if data storage global {IsProduction:0b} if score $AwaitTime Global matches -2147483648..2147483647 run function debug:tps/watch

# 現在の時間をglobalに代入する
    execute store result storage global Time int 1 run time query gametime
# プレイヤー数をGlobalオブジェクトに設定する
    execute store result score $PlayerCount Global if entity @a

# 難易度
    function world_manager:force_difficulty

# プレイヤー事前処理
    execute as @a at @s run function core:tick/player/pre

# 4tick毎のワールド側処理
    scoreboard players add $4tInterval Global 1
    scoreboard players operation $4tInterval Global %= $4 Const
    execute if score $4tInterval Global matches 0 run function core:tick/4_interval

# 6tick分散ワールド処理
    function core:tick/6_distributed_interval

# 神器のグローバルtick処理
    function asset_manager:artifact/tick/

# プレイヤー処理部
    execute as @a at @s run function core:tick/player/

# asset:contextの明示的な全削除
    function asset_manager:common/reset_all_context

# 解呪処理
    execute as @e[type=armor_stand,tag=CursedArtifact,tag=!DispelledCursedArtifact] at @s run function asset_manager:island/tick/

# スポナー処理部
    execute as @e[type=snowball,tag=Spawner,tag=!BreakSpawner] at @s if entity @p[distance=..40] run function asset_manager:spawner/tick/

# テレポーター
    function asset_manager:teleporter/tick/global

# ワールドギミック
    function world_manager:gimmick/

# Mob処理部
    # AssetMobのグローバル処理
        function asset_manager:mob/tick/global
    # データ初期化部
        execute as @e[type=#lib:living,type=!player,tag=!AlreadyInitMob] run function mob_manager:init/
    # MobAsset処理
        execute as @e[tag=AllowProcessingCommonTag] at @s run function asset_manager:mob/common_tag/
        execute as @e[tag=AssetMob] at @s run function asset_manager:mob/tick/

# asset:contextの明示的な全削除
    function asset_manager:common/reset_all_context

# ItemMetaDataチェック
    execute as @e[type=item,tag=!ItemMetaChecked] run function core:tick/check_item_meta/entity

# ダメージログに対するtick処理
    execute as @e[type=armor_stand,tag=LogAEC] at @s run function lib:status_log/tick

# tick処理後のプレイヤー処理部
    execute as @a at @s run function core:tick/player/post

# 攻撃元/先の紐づけをリセット
    execute if entity @a[scores={AttackingEntity=0..}] run function mob_manager:entity_finder/attacking_entity/reset
    execute if entity @a[scores={AttackedEntity=0..}] run function mob_manager:entity_finder/attacked_entity/reset

# 0-0-0-0-0消失警告
    execute if entity @p[predicate=api:is_completed_player_chunk_load_waiting_time,distance=..80] unless entity 0-0-0-0-0 run tellraw @a [{"storage":"global","nbt":"Prefix.ERROR"},{"text":"0-0-0-0-0が参照できません。システム内で重大な問題が発生する可能性があります。"}]