class_name FlowerData extends Resource
## Defines in-game data for each flower.
##
## To be attached to flower items in inventory, flower seeds, and field journal entries.
## Customer will be able to check [FlowerData] when being given flower.
## Customer will be able to then decide their reaction and story outcome.
## Seeds will be able to determine which flower is grown based on which [FlowerData] is attached.
## @experimental
# Will use a separate scene and class for growing flowers


# -- Data to be used in field journal --
# To add to Sprite2D in flower UI scene
# Can also use AnimatedSprite2D for flowers gently waving in wind or something
## Flower sprite to be shown in inventory and field journal.
@export var flower_sprite: Texture2D
## Common name of flower
@export var flower_name: String
## Scientific name of flower
@export var scientific_name: String
## Description of flower.
@export var flower_description: String

# -- Data to be used in interaction with customers -- 
# May not use buying/selling mechanic
## Cost to purchase flower.
@export var buy_cost: int
## Cost when selling flower.
@export var sell_cost: int
# Can use an enumerator for different effects on customers
# Example:
enum qualities {GOOD, BAD}
@export var flower_quality: qualities


# -- Data to be used while growing -- 
## How many days it takes to grow being watered.
@export var days_to_grow: int
## How many days the flower can go without water.
@export var days_until_dehydration: int
# Need to add different growth states of flowers and sprites of flower while growing
# - Need to determine if different flowers have a different number of growth states
# May also include reference to seed item in case we want some sort of composting mechanic
