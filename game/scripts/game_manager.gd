class_name GameManager extends Node2D
## Manages all data from all systems.
##
## Listens to all signals from each major system.
## Passes data along to where it needs to go.

# Example: customer buys flower -> ShopManager signals GameManager that FlowerData was bought ->
# GameManager tells JournalSystem that a flower was bought ->
# JournalSystem updates JournalPage that contains flower ->
# JournalPage updates numBought display for flower
