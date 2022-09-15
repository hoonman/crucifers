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
execute as @a[tag=rhakalhold,nbt=!{Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002011}}]}] at @s run function template:awaken
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002011}}]}] unless entity @s[tag=rhakalhold] run function template:rhakalhold
execute as @a[tag=rhakalhold2,nbt=!{Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002004}}]}] at @s run function template:revert
execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002004}}]}] unless entity @s[tag=rhakalhold2] run function template:rhakalhold2
execute as @a[scores={carrot.dmg=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002004}}}] at @s run function template:scythe
execute as @a[scores={carrot.dmg=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002011}}}] at @s run function template:pound
execute as @a[scores={carrot.use=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002011}}}] at @s run function template:lunge
execute as @a[tag=!sneaking,scores={carrot.use=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002004}}}] at @s run function template:hovering_rhakal
execute as @a[tag=!sneaking,scores={carrot.use2=1..,sneak=0},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002004}}}] unless entity @s[tag=scythe] at @s run function template:blink
execute as @a[scores={carrot.use2=1..,sneak=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002004}}}] unless entity @s[tag=scythe] at @s run function template:doom_portal
execute as @a[scores={sneak=0}] run scoreboard players set @s flight.timer 0
execute as @a[scores={carrot.use=1..,sneak=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002004}}}] unless entity @s[tag=scythe] at @s run function template:flight
execute as @a if entity @a[tag=Air] run tag @a remove Air
execute as @a[nbt={Inventory:[{Slot:-106b,tag:{ItemType:"karbane"}}]}] run function template:dual
execute as @a[nbt={Inventory:[{Slot:-106b,tag:{ItemType:"head"}}]}] run function template:dual2
execute as @a[tag=!mawhook,tag=!sneaking,scores={carrot.use=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002005}}}] at @s run function template:hovering_piranha
execute as @a[tag=!mawhook,scores={carrot.dmg=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002005}}}] at @s run function template:piranha
execute as @a[tag=!mawhook,tag=!sneaking,scores={carrot.use=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002006}}}] at @s run function template:hovering_piranha2
execute as @a[tag=!mawhook,scores={carrot.dmg=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002006}}}] at @s run function template:piranha2
execute as @a[tag=!mawhook,tag=!sneaking,scores={snowball.use=1..,sneak=0},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002006}}}] at @s run function template:piranha2
execute as @a[scores={snowball.use=1..,sneak=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002006}}}] at @s run function template:mawhook
execute as @a[tag=mawhook,scores={snowball.use2=2..}] at @s run function template:mawhook_hook
execute as @a[scores={sneak=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002006}}}] at @s run function template:havoc
execute as @a[scores={sneak=0},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002006}}}] at @s run scoreboard players set @s carrot.timer3 0
execute as @a[scores={sneak=1..}] run scoreboard players set @s sneak 0