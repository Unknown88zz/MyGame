--[[
    DefaultStats (ModuleScript)
    Path: ServerScriptService → Components
    Parent: Components
    Exported: 2025-12-16 21:47:50
]]
return {
	Coins = 100000000000000000,
	Rebirth = 10,
	Steals = 0,

	LifetimeCoins = 100000000000000000,

	AnimalPodiums = {
		[1] = "Empty",
		[2] = "Empty",
		[3] = "Empty",
		[4] = "Empty",
		[5] = "Empty",
		[6] = "Empty",
		[7] = "Empty",
		[8] = "Empty",
		[9] = "Empty",
		[10] = "Empty",
	},

	Settings = {
		["Sound Effects"] = true,
		["Base Skin"] = "Normal",
		["Chat Tips"] = true,
		Music = true,
		VFX = true,
	},

	Index = {},

	TutorialFinished = true,
	ExistCounterVersion = 3,

	InventoryLayoutOrder = {
		[1] = "Bat",
	},

	BloodmoonSpinWheel = {
		LuckSpins = 0,
		Spins = 0,
		LastDailyDiscount = 0,
		PaidSpins = {
			x3 = 0,
			x1 = 0,
			x10 = 0,
		},
		LastFreeClaimed = 0
	},

	RainbowSpinWheel = {
		LuckSpins = 0,
		Spins = 0,
		LastDailyDiscount = 0,
		PaidSpins = {
			x3 = 0,
			x1 = 0,
			x10 = 0,
		},
		LastFreeClaimed = 0
	},

	CandySpinWheel = {
		LuckSpins = 0,
		Spins = 0,
		LastDailyDiscount = 0,
		PaidSpins = {
			x3 = 0,
			x1 = 0,
			x10 = 0,
		},
		LastFreeClaimed = 0
	},

	MoltenSpinWheel = {
		LuckSpins = 0,
		Spins = 0,
		LastDailyDiscount = 0,
		PaidSpins = {
			x3 = 0,
			x1 = 0,
			x10 = 0,
		},
		LastFreeClaimed = 0
	},

	GalaxySpinWheel = {
		LuckSpins = 0,
		Spins = 0,
		LastDailyDiscount = 0,
		PaidSpins = {
			x3 = 0,
			x1 = 0,
			x10 = 0,
		},
		LastFreeClaimed = 0,
	},

	YinYangSpinWheel = {
		LuckSpins = 0,
		Spins = 0,
		LastDailyDiscount = 0,
		PaidSpins = {
			x3 = 0,
			x1 = 0,
			x10 = 0,
		},
		LastFreeClaimed = 0
	},

	RadioactiveSpinWheel = {
		LuckSpins = 0,
		Spins = 67,
		LastDailyDiscount = 0,
		PaidSpins = {
			x3 = 0,
			x1 = 0,
			x10 = 0,
		},
		LastFreeClaimed = 0
	},

	LastPlot = nil,

	Gamepass = {},

	StealHistory = {},

	AutoBuy = {},

	FuseMachine = {
		OutputRarityOdds = {},
		InstantReveals = 0,
		FuseLuckMultiplier = 1,
		TimesFused = 0,
		Slots = {}
	},

	TrackedItems = {
		Brainrot = {},
	},
	CraftingMachine = {
		Id = "",
		InstantCrafts = {},
	},

	AnimalsQueue = {},

	TimesJoined = 0,
	PurchaseHistory = {},
	AnimalAddedOrRemoved = false,
	Items = {
		Bat = true,
	},

	Generation = 0,

	TrackedBrainrots = {},
	UnlockedBaseSkinsVersion = 1,
	UnlockedBaseSkins = {
		Gold = true,
		Diamond = true,
		Bloodrot = true,
		Rainbow = true,
		Candy = true,
		Lava = true,
		Galaxy = true,
		YinYang = true,
		Aquatic = true,
		Radioactive = true,
		Halloween = true,
	}
}