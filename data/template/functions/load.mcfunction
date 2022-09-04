#built using mc-build (https://github.com/mc-build/mc-build)

execute as @a run say reloaded!
scoreboard objectives add timer dummy
scoreboard objectives add timer2 dummy
scoreboard objectives add gravity dummy
scoreboard objectives add exsan.sound dummy
scoreboard objectives add radiate_timer dummy
scoreboard objectives add skulls_timer dummy
scoreboard objectives add visceral.rot1 dummy
scoreboard objectives add visceral.rot2 dummy
scoreboard objectives add raycast.use minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add sneak minecraft.custom:minecraft.sneak_time
scoreboard objectives add shakal.hemorrhage minecraft.custom:damage_dealt
scoreboard objectives add shakal.attacked minecraft.custom:damage_dealt
scoreboard objectives add shakal.visceral minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add shakal.clicked minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add shakal.hold minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add xyneth.radiate minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add xyneth.skulls minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add xyneth.skulls_clicked minecraft.used:minecraft.carrot_on_a_stick
team add scrutinized
team modify scrutinized color dark_red
data merge storage minecraft:rot1 {rot1:1f}
data merge storage minecraft:rot2 {rot2:1f}