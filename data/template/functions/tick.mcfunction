#built using mc-build (https://github.com/mc-build/mc-build)

execute as @a[scores={raycast.use=1..,sneak=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002999}}}] at @s anchored eyes run function template:cruiser
execute as @a[scores={raycast.use=1..},tag=!sneaking,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002999}}}] at @s anchored eyes run function template:raycast
execute as @a[scores={sneak=1..}] run scoreboard players set @s sneak 0
execute as @a[scores={shakal.hemorrhage=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}}] at @s run function template:hemorrhage
execute as @a[scores={shakal.visceral=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}}] at @s run function template:visceral
execute as @a[scores={xyneth.radiate=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002002}}}] at @s run function template:radiate