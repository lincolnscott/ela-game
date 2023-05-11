extends Node
enum EnemyType {
	THUG = 0,
	THUGGER = 1,
	THUGGIN = 2,
	THUG_SHAKER = 3
} #ENUMS!!!

const EnemyPaths = {
	EnemyType.THUG: "res://enemies/Thug.tscn",
	EnemyType.THUGGER: "res://enemies/Thugger.tscn",
	EnemyType.THUGGIN: "res://enemies/Thuggin.tscn",
	EnemyType.THUG_SHAKER: "res://enemies/Thug_Shaker.tscn"
}

const UpgradeScenes = [
	"res://Upgrades/MultiBall.tscn",
	"res://Upgrades/FireRate.tscn"
]
