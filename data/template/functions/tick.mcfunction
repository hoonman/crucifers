#built using mc-build (https://github.com/mc-build/mc-build)

execute as @e run function template:health
execute as @a[scores={shakal.hemorrhage=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}}] at @s run function template:hemorrhage
execute as @a[scores={shakal.visceral=1..,sneak=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}}] at @s anchored eyes positioned ~ ~-0.5 ~ run function template:exsan
execute as @a[scores={shakal.visceral=1..},tag=!sneaking,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}}] at @s anchored eyes positioned ~ ~-0.5 ~ run function template:visceral5
execute as @a[scores={shakal.clicked=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}}] at @s anchored eyes positioned ~ ~-0.5 ~ run function template:timer2
execute as @a[tag=shakalhold,nbt=!{Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}]}] run function template:scrutinize
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}]}] unless entity @s[tag=shakalhold] run function template:shakalhold
execute as @a[tag=xynethhold,nbt=!{Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002002}}]}] run function template:putrefaction
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002002}}]}] unless entity @s[tag=xynethhold] run function template:xynethhold
execute as @a[scores={xyneth.radiate=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002002}}}] at @s run function template:radiate
execute as @a[scores={xyneth.skulls_clicked=1..,sneak=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002002}}}] at @s run function template:contaminate
execute as @a[scores={xyneth.skulls=1..},tag=!sneaking,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002002}}}] at @s run function template:skulls
execute as @a[scores={xyneth.skulls_clicked=1..},tag=!sneaking,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002002}}}] at @s run function template:lingering
execute at @e[type=item,nbt={Item:{id:"minecraft:netherite_sword",Count:1b}}] if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot",Count:8b}},distance=..1] run function template:getshakal
execute at @e[type=item,nbt={Item:{id:"minecraft:netherite_axe",Count:1b}}] if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot",Count:8b}},distance=..1] run function template:getxyneth
execute at @e[type=item,nbt={Item:{id:"minecraft:netherite_shovel",Count:1b}}] if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot",Count:8b}},distance=..1] run function template:getwerejix
execute as @a[scores={werejix.ragged=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002003}}}] at @s run function template:ragged
execute as @a[scores={werejix.timer=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002003}}}] at @s run function template:hovering_armor
execute as @a[scores={werejix.timer=1..,sneak=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002003}}}] at @s run function template:stimulus
execute as @a[scores={werejix.timer=1..,sneak=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002003}}}] at @s run function template:stimulus_sound
execute as @a[scores={werejix.timer=1..,sneak=0},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002003}}}] run scoreboard players set @s stim.timer 0
execute as @a[tag=werejixhold,nbt=!{Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002003}}]}] run function template:feral_rage
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002003}}]}] unless entity @s[tag=werejixhold] run function template:werejixhold
execute as @a[scores={sneak=1..}] run scoreboard players set @s sneak 0