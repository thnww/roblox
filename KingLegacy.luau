function runAutoAccept()
	local tbl = {"EnterTheGame", {}}
	local ok, result = pcall(function()
		game:GetService(
			"ReplicatedStorage"
		).Chest.Remotes.Functions.EtcFunction:InvokeServer(unpack(tbl))
	end)

	if ok then
		print("AutoAccept executed successfully.")
		return true
	end

	warn("Failed to execute AutoAccept: ", result)
	return false
end

runAutoAccept()
wait(1)
local Players = game:GetService("Players")

repeat
	Client = Players.LocalPlayer
	wait()
until Client

game:GetService("TeleportService")
local client = Client
Char = client.Character
local flag = false
client.CharacterAdded:Connect(function(character)
	Char = character
	flag = false
end)
vu = game:GetService("VirtualUser")
Sea1 = game.PlaceId == 4520749081
Sea2 = game.PlaceId == 6381829480
Sea3 = game.PlaceId == 15759515082
MaxLevelOfSea = MaxLevelOfSea or 0
MinLevelOfSea = MinLevelOfSea or 0
cheatKey = cheatKey or {}
myWeapon = {Melee = "", Sword = "", Fruit = ""}
addSkill = "?"
_G.Weapon = _G.Weapon or "Combat"

_G.Settings = {
	Select_Weapon = "Sword",
	Weapon = "Combat",
	Auto_Sea31 = false,
	Select_Skill = true,
	SkillZ = false,
	SkillX = false,
	SkillC = false,
	SkillV = false,
	SkillB = false,
	SkillE = false
}

_G.redcircle = "🔴"
_G.greencircle = "🟢"
_G.HopDelay = _G.HopDelay or 5
_G.Settings.HopDelay = _G.Settings.HopDelay or 5
_G.Settings.PositionFarm = _G.Settings.PositionFarm or "Above"
_G.Settings.Bring_Nearest_Mobs_Together = _G.Settings.Bring_Nearest_Mobs_Together or false
_G.Settings.ObservationHak = _G.Settings.ObservationHak or false
_G.Settings.Auto_Farm_Level1 = _G.Settings.Auto_Farm_Level1 or false
_G.Settings.Auto_Sea21 = _G.Settings.Auto_Sea21 or false
_G.Settings.Monter_Hop = _G.Settings.Monter_Hop or false
_G.Settings.auto_third_event = _G.Settings.auto_third_event or false
_G.Settings.auto_jacko = _G.Settings.auto_jacko or false
SelectMaterial = SelectMaterial or "Rusted Scrap"
MMon = MMon or ""
selectedBoss = selectedBoss or ""
Spectate = Spectate or false
Flys = Flys or false
InfGeppo = InfGeppo or false
BuyDevilFruit = BuyDevilFruit or false
BringDevilFruit = BringDevilFruit or false
DevilFruitSelected = DevilFruitSelected or ""
PlayerESP = PlayerESP or false
DevilFruitESP = DevilFruitESP or false
LegacyIslandESP = LegacyIslandESP or false
HydraIslandESP = HydraIslandESP or false
GhostShipESP = GhostShipESP or false
Number = Number or math.random(1, 1000000)
Default = Default or "None"
DropdownInfo = DropdownInfo or {}
selectbosss = selectbosss or {}
Speed = Speed or 25
local v1 = Client.Name .. " Config.json"

function SaveSettings()
	if not writefile then
		warn("SaveSettings: writefile not available")
		return
	end

	local ok, result = pcall(function()
		return game:GetService("HttpService"):JSONEncode(_G.Settings)
	end)

	if not ok then
		warn("SaveSettings: JSONEncode failed", result)
		return
	end

	pcall(function()
		if not isfolder("zensave1") then
			makefolder("zensave1")
		end

		if not isfolder("zensave1/King Legacy") then
			makefolder("zensave1/King Legacy")
		end

		writefile("zensave1/King Legacy" .. "/" .. v1, result)
	end)
end

function LoadSettings()
	local HttpService = game:GetService("HttpService")
	local v2 = "zensave1" .. "/King Legacy/" .. v1

	if not isfile or not isfile(v2) then
		return
	end

	local ok, result = pcall(function()
		return HttpService:JSONDecode(readfile(v2))
	end)

	if ok and type(result) == "table" then
		for k, v3 in pairs(result) do
			_G.Settings[k] = v3
		end
	else
		warn("LoadSettings failed or corrupt config")
	end
end

LoadSettings()
task.spawn(function()
	while task.wait(2) do
		pcall(function()
			if not Client or not Client.Character then
				return
			end

			for _, child in pairs(Client.Character:GetChildren()) do
				if child:IsA("Tool") then
					local ToolTip = child.ToolTip
					if ToolTip == "Combat" or ToolTip == "Melee" then
						myWeapon.Melee = child.Name
						if _G.Settings.Select_Weapon == "Melee" then
							_G.Weapon = child.Name
						end
					elseif ToolTip == "Sword" then
						myWeapon.Sword = child.Name
						if _G.Settings.Select_Weapon == "Sword" then
							_G.Weapon = child.Name
						end
					elseif ToolTip == "Fruit Power" then
						local myWeaponRef = myWeapon
						myWeaponRef.Fruit = child.Name
						myWeaponRef["Fruit Power"] = child.Name

						if _G.Settings.Select_Weapon == "Fruit" then
							_G.Weapon = child.Name
						end
					end
				end
			end

			for _, child1 in pairs(Client.Backpack:GetChildren()) do
				if child1:IsA("Tool") then
					local ToolTip1 = child1.ToolTip
					if ToolTip1 == "Combat" or ToolTip1 == "Melee" then
						myWeapon.Melee = child1.Name
					elseif ToolTip1 == "Sword" then
						myWeapon.Sword = child1.Name
					elseif ToolTip1 == "Fruit Power" then
						local myWeaponRef1 = myWeapon
						myWeaponRef1.Fruit = child1.Name
						myWeaponRef1["Fruit Power"] = child1.Name
					end
				end
			end
		end)
	end
end)
Client.Idled:connect(function()
	vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	task.wait(1)
	vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)
GUI = Client.PlayerGui
Repli = game:GetService("ReplicatedStorage")
QuestManager = game:GetService("ReplicatedStorage").Chest.Modules.QuestManager
task.spawn(function()
	while task.wait() do
		pcall(function()
			if flag then
				if Client then
					if
						Client:FindFirstChild("Character") and Client.Character.Humanoid.Sit == true
					then
						Client.Character.Humanoid.Sit = false
					end
				end

				for _, descendant in pairs(Char:GetDescendants()) do
					if descendant:IsA("BasePart") then
						descendant.CanCollide = false
					end
				end

				if Char and not Char.UpperTorso:FindFirstChild("BodyClip") then
					local bodyVelocity = Instance.new("BodyVelocity")
					bodyVelocity.Parent = Char.UpperTorso
					bodyVelocity.Name = "BodyClip"
					local vector3 = Vector3.new(math.huge, math.huge, math.huge)
					bodyVelocity.Velocity = Vector3.new(0, 1, 0)
					bodyVelocity.MaxForce = vector3
				else
					if
						not (Char
							and (Char.UpperTorso:FindFirstChild("BodyClip")
								and Char
								and Char.UpperTorso:FindFirstChild("BodyClip")))
					then
						return
					end

					Char.UpperTorso:FindFirstChild(
						"BodyClip"
					).MaxForce = Vector3.new(math.huge, math.huge, math.huge)
					Char.UpperTorso:FindFirstChild("BodyClip").Velocity = Vector3.new(0, 0, 0)
				end
			else
				if not (Char and Char.UpperTorso:FindFirstChild("BodyClip")) then
					return
				end
				Char.UpperTorso:FindFirstChild("BodyClip"):Destroy()
			end
		end)
	end
end)
local str3
local ToolTip

function getTool()
	for _, child in pairs(Client.Character:GetChildren()) do
		if child:IsA("Tool") then
			if child.ToolTip == "Fruit Power" then
				addSkill = "DF"
			end

			str3 = tostring(child.Name)
			ToolTip = child.ToolTip
		end
	end
	return str3
end

local tbl = {
	CheckOnCooldown = function(arg1)
		getTool()
		local v1 = string.upper(arg1 or "Z")
		local SkillCooldown = Client.PlayerGui.SkillCooldown
		local DFFrame

		if ToolTip ~= "Sword" then
			if ToolTip ~= "Combat" then
				if ToolTip ~= "Fruit Power" then
					if nil and (nil):FindFirstChild(v1) then
						local v2 = (nil)[v1]
						return
							not v2:FindFirstChild("Locked").Visible
								and v2.Frame.Frame.AbsoluteSize.X > 0
								and true
								or false
					end
					return true
				end
				DFFrame = SkillCooldown:FindFirstChild("DFFrame")
			else
				DFFrame = SkillCooldown:FindFirstChild("FSFrame")
			end
		else
			DFFrame = SkillCooldown:FindFirstChild("SWFrame")
		end

		if DFFrame and DFFrame:FindFirstChild(v1) then
			local v3 = DFFrame[v1]
			return
				not v3:FindFirstChild("Locked").Visible
					and v3.Frame.Frame.AbsoluteSize.X > 0
					and true
					or false
		end

		return true
	end,
}

function getPlayerMaterial(arg1)
	local ok, result = pcall(function()
		local HttpService = game:GetService("HttpService")
		local v1 =
			Client.PlayerStats:FindFirstChild("Material") and Client.PlayerStats.Material.Value

		if not v1 or v1 == "" then
			return {}
		end

		return HttpService:JSONDecode(v1)
	end)

	if not ok or type(result) ~= "table" then
		return 0
	end

	for k, v1 in pairs(result) do
		if k == arg1 then
			return v1
		end
	end

	return 0
end

QuestMaterial = {
	["3350"] = {
		Material = "Ice Crystal",
		Kills = "Azlan [Lv. 3300]",
		QuestTitle = "Kill 4 Azlan",
		Level = 3300
	},
	["3375"] = {
		Material = "Magma Crystal",
		Kills = "The Volcano [Lv. 3325]",
		QuestTitle = "Kill 4 The Volcano",
		Level = 3325
	},
	["3475"] = {
		Material = "Dark Beard's Totem",
		Kills = "Sally [Lv. 3450]",
		QuestTitle = "Kill 1 Sally",
		Level = 3450
	},
	["3575"] = {
		Material = "Lucidus's Totem",
		Kills = "Vice Admiral [Lv. 3500]",
		QuestTitle = "Kill 5 Vice Admiral",
		Level = 3500
	}
}

function GetQuestData(arg1)
	local Value = Client.PlayerStats.lvl.Value
	local ok, result = pcall(function()
		return require(game.ReplicatedStorage.Chest.Modules.QuestManager)
	end)

	if not ok or not result then
		warn("QuestManager require failed")
		return
			{
				LevelRequired = 1,
				Mob = "Bandit [Lv. 5]",
				QuestTitle = "Kill 5 Bandit",
				NPC = {CFrame = CFrame.new(0, 0, 0)}
			}
	end

	local v1, v2, v3 = pairs(result)
	local v4 = v3
	local tbl = {}
	local v5 = tbl

	while true do
		tbl = nil
		local v6, v7 = v1(v2, v4)
		v4 = v6
		tbl = v7

		if v6 == nil then
			break
		end

		if not tbl.DailyQuest then
			tonumber(tbl.Mob:match("Lv%. (%d+)"))
			if tbl.Mob:match("Lv") and (arg1 or tbl.Level <= Value) then
				table.insert(
					v5,
					{
						LevelRequired = tbl.Level or 1,
						Mob = Value >= 3300 and Value < 3375 and "Azlan [Lv. 3300]" or tbl.Mob,
						QuestTitle = Value >= 3300 and Value < 3375 and "Kill 4 Azlan" or v6,
						NPC = (function()
							local v1, v2, v3 = pairs(
								game:GetService("Workspace"):FindFirstChild("AllNPC"):GetChildren()
							)
							local v4 = v3
							local tbl1 = {}

							while true do
								local v5, v6 = v1(v2, v4)
								v4 = v5

								if v5 == nil then
									break
								end

								if
									v6:GetAttribute("LevelMin")
										and tbl.Level >= v6:GetAttribute("LevelMin")
								then
									tbl1[#tbl1
										+ 1] = {
										Level = v6:GetAttribute("LevelMin"),
										CFrame = v6.CFrame
									}
								end
							end

							table.sort(
								tbl1,
								function(a, b)
									return a.Level > b.Level
								end
							)
							return tbl1[1]
						end)()
					}
				)
			end
		end
	end

	table.sort(
		v5,
		function(a, b)
			return a.LevelRequired > b.LevelRequired
		end
	)

	if MaxLevelOfSea > Value or not Sea2 then
		if MaxLevelOfSea > Value or not Sea1 then
			local v8, v9, v10 = pairs(QuestMaterial)
			v69 = v8
			v70 = v9
			v71 = v10

			while true do
				local v11, v12 = v69(v70, v71)
				v71 = v11

				if v71 == nil then
					break
				end

				if v5[1] and v5[1].LevelRequired == tonumber(v71) then
					local v13, v14, v15 = pairs(SafeMonsters("Mon"))
					local v16 = v15
					local flag

					while true do
						local v17, v18 = v13(v14, v16)
						v16 = v17

						if v17 == nil then
							break
						end

						if
							v18.Name == v5[1].Mob
								and (v18:FindFirstChild("Humanoid")
									and (v18:FindFirstChild("HumanoidRootPart")
										and v18.Humanoid.Health > 0))
						then
							flag = true
						end
					end

					local v19, v20, v21 = pairs(SafeMonsters("Boss"))
					local v22 = v21

					while true do
						local v23, v24 = v19(v20, v22)
						v22 = v23

						if v23 == nil then
							break
						end

						if
							v24.Name == v5[1].Mob
								and (v24:FindFirstChild("Humanoid")
									and (v24:FindFirstChild("HumanoidRootPart")
										and v24.Humanoid.Health > 0))
						then
							flag = true
						end
					end

					local v25, v26, v27 = pairs(
						game:GetService("ReplicatedStorage").MOB:GetChildren()
					)
					local v28 = v27

					while true do
						local v29, v30 = v25(v26, v28)
						v28 = v29

						if v29 == nil then
							break
						end

						if
							v30.Name == v5[1].Mob
								and (v30:FindFirstChild("Humanoid")
									and (v30:FindFirstChild("HumanoidRootPart")
										and v30.Humanoid.Health > 0))
						then
							flag = true
						end
					end

					if getPlayerMaterial(v12.Material) > 0 or flag then
						if getPlayerMaterial(v12.Material) > 0 and not flag then
							local tbl1 = {
								SuccessQuest = "Quest Accepted.",
								BossName = v5[1].Mob,
								LevelNeed = v5[1].LevelRequired,
								QuestName = v5[1].QuestTitle,
								MaterialNeed = v12.Material
							}
							game:GetService("ReplicatedStorage")
								:WaitForChild("Chest")
								:WaitForChild("Remotes")
								:WaitForChild("Functions")
								:WaitForChild("EtcFunction")
								:InvokeServer(unpack({"QuestSpawnBoss", tbl1}))
						end
					else
						v5[1].Mob = v12.Kills
						v5[1].LevelRequired = v12.Level
						v5[1].QuestTitle = v12.QuestTitle
					end
				end
			end

			return
				v5[1]
					or {
						LevelRequired = 1,
						Mob = "Bandit [Lv. 5]",
						QuestTitle = "Kill 5 Bandit",
						NPC = {CFrame = CFrame.new()}
					}
		end

		if not v5[1] then
			v5[1] = {
				LevelRequired = 2200,
				Mob = "Seasoned Fishman [Lv. 2200]",
				QuestTitle = "Kill 1 Seasoned Fishman",
				NPC = {CFrame = CFrame.new()}
			}
		end

		v5[1].Mob = "Seasoned Fishman [Lv. 2200]"
		v5[1].LevelRequired = 2200
		v5[1].QuestTitle = "Kill 1 Seasoned Fishman"
	else
		if not v5[1] then
			v5[1] = {
				LevelRequired = 3950,
				Mob = "Ryu [Lv. 3975]",
				QuestTitle = "Kill 1 Ryu",
				NPC = {CFrame = CFrame.new()}
			}
		end

		v5[1].Mob = "Ryu [Lv. 3975]"
		v5[1].LevelRequired = 3950
		v5[1].QuestTitle = "Kill 1 Ryu"
	end

	local v31, v32, v33 = pairs(QuestMaterial)
	local v34 = v33

	while true do
		local v35, v36 = v31(v32, v34)
		v34 = v35

		if v35 == nil then
			break
		end

		if v5[1] and v5[1].LevelRequired == tonumber(v35) then
			local v37, v38, v39 = pairs(SafeMonsters("Mon"))
			local v40 = v39
			local flag1

			while true do
				local v41, v42 = v37(v38, v40)
				v40 = v41

				if v41 == nil then
					break
				end

				if
					v42.Name == v5[1].Mob
						and (v42:FindFirstChild("Humanoid")
							and (v42:FindFirstChild("HumanoidRootPart")
								and v42.Humanoid.Health > 0))
				then
					flag1 = true
				end
			end

			local v43, v44, v45 = pairs(SafeMonsters("Boss"))
			local v46 = v45

			while true do
				local v47, v48 = v43(v44, v46)
				v46 = v47

				if v47 == nil then
					break
				end

				if
					v48.Name == v5[1].Mob
						and (v48:FindFirstChild("Humanoid")
							and (v48:FindFirstChild("HumanoidRootPart")
								and v48.Humanoid.Health > 0))
				then
					flag1 = true
				end
			end

			local v49, v50, v51 = pairs(game:GetService("ReplicatedStorage").MOB:GetChildren())
			local v52 = v51

			while true do
				local v53, v54 = v49(v50, v52)
				v52 = v53

				if v53 == nil then
					break
				end

				if
					v54.Name == v5[1].Mob
						and (v54:FindFirstChild("Humanoid")
							and (v54:FindFirstChild("HumanoidRootPart")
								and v54.Humanoid.Health > 0))
				then
					flag1 = true
				end
			end

			if getPlayerMaterial(v36.Material) > 0 or flag1 then
				if getPlayerMaterial(v36.Material) > 0 and not flag1 then
					local tbl2 = {
						SuccessQuest = "Quest Accepted.",
						BossName = v5[1].Mob,
						LevelNeed = v5[1].LevelRequired,
						QuestName = v5[1].QuestTitle,
						MaterialNeed = v36.Material
					}
					game:GetService("ReplicatedStorage")
						:WaitForChild("Chest")
						:WaitForChild("Remotes")
						:WaitForChild("Functions")
						:WaitForChild("EtcFunction")
						:InvokeServer(unpack({"QuestSpawnBoss", tbl2}))
				end
			else
				v5[1].Mob = v36.Kills
				v5[1].LevelRequired = v36.Level
				v5[1].QuestTitle = v36.QuestTitle
			end
		end
	end

	return
		v5[1]
			or {
				LevelRequired = 1,
				Mob = "Bandit [Lv. 5]",
				QuestTitle = "Kill 5 Bandit",
				NPC = {CFrame = CFrame.new()}
			}
end

local v2, v3, v4 = pairs(game:GetService("Workspace"):FindFirstChild("AllNPC"):GetChildren())
local v5 = v4

while true do
	local v6, v7 = v2(v3, v5)
	v445 = v7
	v5 = v6

	if v6 == nil then
		break
	end

	if v445:GetAttribute("LevelMax") then
		lvmax = v445:GetAttribute("LevelMax")
		if not MaxLevelOfSea or lvmax > MaxLevelOfSea then
			MaxLevelOfSea = lvmax
		end
	end

	if v445:GetAttribute("LevelMin") then
		lvmin = v445:GetAttribute("LevelMin")
		if not MinLevelOfSea or lvmin < MinLevelOfSea then
			MinLevelOfSea = lvmin
		end
	end
end

function tp(arg1)
	pcall(function()
		local v1 = Client and Client.Character

		if not (v1:FindFirstChild("Humanoid") and v1.Humanoid.Sit == true) then
			flag = true
			v76 = {
				Target = arg1.Target or print("mae mung tai."),
				Mod = arg1.Mod or CFrame.new(0, 0, 0)
			}
			local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")

			if HumanoidRootPart then
				local v2 = v76
				HumanoidRootPart.CFrame = v2.Target * v2.Mod
			end

			return
		end

		v1.Humanoid.Sit = false
		flag = true
		local tbl = {
			Target = arg1.Target or print("mae mung tai."),
			Mod = arg1.Mod or CFrame.new(0, 0, 0)
		}
		local HumanoidRootPart1 = v1:FindFirstChild("HumanoidRootPart")

		if HumanoidRootPart1 then
			HumanoidRootPart1.CFrame = tbl.Target * tbl.Mod
		end
	end)
end

function Tp(cFrame)
	local v1 = Client and Client.Character

	if not v1 then
		return
	end

	local Humanoid = v1:FindFirstChild("Humanoid")
	local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")

	if not HumanoidRootPart then
		return
	end

	if Humanoid and Humanoid.Sit then
		Humanoid.Sit = false
	end

	for _, descendant in pairs(v1:GetDescendants()) do
		if descendant:IsA("BasePart") then
			descendant.CanCollide = false
		end
	end

	if HumanoidRootPart:FindFirstChild("BodyClip") then
		HumanoidRootPart.CFrame = cFrame
		return
	end

	local bodyVelocity = Instance.new("BodyVelocity")
	bodyVelocity.Parent = HumanoidRootPart
	bodyVelocity.Name = "BodyClip"
	bodyVelocity.Velocity = Vector3.new(0, 0, 0)
	bodyVelocity.MaxForce = Vector3.new(5, math.huge, 5)
	HumanoidRootPart.CFrame = cFrame
end

function tp1(cFrame)
	local LocalPlayer = game.Players.LocalPlayer
	if
		LocalPlayer
			and LocalPlayer.Character
			and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	then
		LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = cFrame
	else
		warn("Player's character or HumanoidRootPart not found!")
	end
end

local function func(name)
	local Monster = workspace:FindFirstChild("Monster")

	if not Monster then
		return {}
	end

	local v1 = Monster:FindFirstChild(name)
	return v1 and v1:GetChildren() or {}
end

function SafeNPC(name)
	return workspace:FindFirstChild("AllNPC") and workspace.AllNPC:FindFirstChild(name)
end

local function func1(arg1, ...)
	local v1 = SafeNPC(arg1)

	if not v1 then
		warn("NPC not found:", arg1)
		return
	end

	toQuest(v1.CFrame, ...)
end

function EquipTools(name)
	if not Client.Backpack:FindFirstChild(name) then
		return
	end

	local v1 = Client.Backpack:FindFirstChild(name)
	Client.Character.Humanoid:EquipTool(v1)
end

function UnEquipTools(name)
	if not Client.Character:FindFirstChild(name) then
		return
	end

	wait(0.5)
	Client.Character:FindFirstChild(name).Parent = Client.LocalPlayer.Backpack
	wait(0.1)
end

local tbl1 = {"Melee", "Sword", "Fruit Power"}
local num = 1

function Attack()
	_G.Weapon = _G.Weapon or myWeapon.Melee or myWeapon.Sword or myWeapon.Fruit or "Combat"

	if not _G.Weapon or _G.Weapon == "" then
		return
	end

	if _G.Settings.Select_Weapon ~= "Melee" then
		if _G.Settings.Select_Weapon ~= "Sword" then
			if _G.Settings.Select_Weapon ~= "all In One" then
				game:GetService(
					"ReplicatedStorage"
				).Chest.Remotes.Functions.SkillAction:InvokeServer("FS_" .. _G.Weapon .. "_M1")
			else
				local v1 = tbl1[num]

				if v1 == "Sword" then
					addSkill = "SW"
					delay(
						0.1,
						function()
							game:GetService(
								"ReplicatedStorage"
							).Chest.Remotes.Functions.SkillAction:InvokeServer(
								"SW_" .. myWeapon.Sword .. "_M1"
							)
						end
					)
				elseif v1 == "Melee" then
					addSkill = "FS"
					game:GetService(
						"ReplicatedStorage"
					).Chest.Remotes.Functions.SkillAction:InvokeServer(
						"FS_" .. myWeapon.Melee .. "_M1"
					)
				elseif v1 == "Fruit Power" then
					addSkill = "FP"
					game:GetService(
						"ReplicatedStorage"
					).Chest.Remotes.Functions.SkillAction:InvokeServer(
						"FP_" .. myWeapon["Fruit Power"] .. "_M1"
					)
				end

				EquipTools(myWeapon[v1])
				num = num + 1

				if num > #tbl1 then
					num = 1
				end
			end
		else
			addSkill = "SW"
			game:GetService(
				"ReplicatedStorage"
			).Chest.Remotes.Functions.SkillAction:InvokeServer("SW_" .. _G.Weapon .. "_M1")
		end
	else
		addSkill = "FS"
		game:GetService(
			"ReplicatedStorage"
		).Chest.Remotes.Functions.SkillAction:InvokeServer("FS_" .. _G.Weapon .. "_M1")
	end

	if _G.Settings.Select_Weapon == "all In One" then
		return
	end

	EquipTools(_G.Weapon)
end

local tbl2 = {Z = 0, X = 0, C = 0, V = 0, B = 0, E = 0}

local function func2()
	if not _G.Settings.Select_Skill then
		return
	end
	for _, v1 in
		ipairs(
			{
				{key = "Z", enabled = _G.Settings.SkillZ, holdTime = tbl2.Z},
				{key = "X", enabled = _G.Settings.SkillX, holdTime = tbl2.X},
				{key = "C", enabled = _G.Settings.SkillC, holdTime = tbl2.C},
				{key = "V", enabled = _G.Settings.SkillV, holdTime = tbl2.V},
				{key = "B", enabled = _G.Settings.SkillB, holdTime = tbl2.B},
				{key = "E", enabled = _G.Settings.SkillE, holdTime = tbl2.E}
			}
		)
	do
		if v1.enabled and not tbl.CheckOnCooldown(v1.key) then
			local VirtualInputManager = game:GetService("VirtualInputManager")
			VirtualInputManager:SendKeyEvent(true, v1.key, false, game)
			wait(v1.holdTime)
			VirtualInputManager:SendKeyEvent(false, v1.key, false, game)
		end
	end
end

local function func3(selectedObject)
	if selectedObject then
		game:GetService("GuiService").SelectedObject = selectedObject
		task.wait(0.1)
		local VirtualInputManager = game:GetService("VirtualInputManager")
		VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
		task.wait(0.1)
		local VirtualInputManager1 = game:GetService("VirtualInputManager")
		VirtualInputManager1:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
		task.wait(0.1)
		game:GetService("GuiService").SelectedObject = nil
	else
		warn("Invalid UI path provided to ClickUI")
	end
end

function click(arg1)
	for _ = 1, tonumber(arg1 or 3) do
		game:GetService("VirtualUser"):Button1Down(Vector2.new(1, 1))
		game:GetService("VirtualUser"):Button1Up(Vector2.new(1, 1))
	end
end

function Click(arg1)
	for _ = 1, tonumber(arg1 or 3) do
		game:GetService("VirtualUser"):Button1Down(Vector2.new(1, 1))
		game:GetService("VirtualUser"):Button1Up(Vector2.new(1, 1))
	end
end

function toQuest(arg1, arg2, arg3)
	local v1 = arg3 or true
	local v2 = arg2 or "QuestLvl"
	local v3 = arg1 or (Sea1 and "Elite Pirate" or (Sea3 and "The Squid" or arg1))
	local v4 = arg2 == 1 and Sea2 and "Elite Pirate" or (arg2 == 3 and Sea2 and "The Squid" or v3)
	local v5 = workspace.AllNPC:FindFirstChild(v4)

	if v5 then
		v4 = v5.CFrame
	elseif typeof(v4) ~= "CFrame" then
		warn("toQuest: NPC not found ->", tostring(v4))
		return
	end

	if v1 and v4 then
		local HumanoidRootPart = Client.Character:FindFirstChild("HumanoidRootPart")
		if HumanoidRootPart then
			HumanoidRootPart.CFrame = v4 * CFrame.new(0, 0, -3)
		end
	end

	local HumanoidRootPart1 = game.Players.LocalPlayer.Character.HumanoidRootPart

	if not HumanoidRootPart1 then
		vu:Button1Down(Vector2.new(1, 1))
		vu:Button1Up(Vector2.new(1, 1))
		wait(0.5)
		local v6, v7, v8 = pairs(Client.PlayerGui:GetChildren())
		v122 = v6
		v123 = v7
		v124 = v8

		while true do
			local v9, v10 = v122(v123, v124)
			v124 = v9

			if v124 == nil then
				break
			end

			if string.find(v10.Name, v2) then
				local Dialogue = v10:FindFirstChild("Dialogue")
				if Dialogue and Dialogue:FindFirstChild("Accept") then
					local Accept = Dialogue.Accept

					if game.PlaceId == 4520749081 or (game.PlaceId == 6381829480 or v1) then
						Accept.Size = UDim2.new(1001, 0, 1001, 0)
						Accept.Text.TextTransparency = 1
						Accept.Position = UDim2.new(0.5, 0, 0.5, 0)
						Accept.AnchorPoint = Vector2.new(0.5, 0.5)
					else
						local v11, v12, v13 = pairs(Dialogue:GetChildren())
						local v14 = v13

						while true do
							local v15, v16 = v11(v12, v14)
							v14 = v15

							if v15 == nil then
								break
							end

							if string.find(v16.Name, "Quest") or v16.Name == "QuestAccept" then
								v16.Size = UDim2.new(1001, 0, 1001, 0)
								v16.Text.TextTransparency = 1
								v16.Position = UDim2.new(0.5, 0, 0.5, 0)
								v16.AnchorPoint = Vector2.new(0.5, 0.5)
							end
						end

						if string.find(v10.Text.Text, "Talk") then
							local QuestAccept = Dialogue:FindFirstChild("QuestAccept")
							if QuestAccept then
								QuestAccept.Size = UDim2.new(1001, 0, 1001, 0)
								QuestAccept.Text.TextTransparency = 1
								QuestAccept.Position = UDim2.new(0.5, 0, 0.5, 0)
								QuestAccept.AnchorPoint = Vector2.new(0.5, 0.5)
							end
						end
					end

					if Accept then
						Accept:Click()
					end
				end
			end
		end

		return
	end

	HumanoidRootPart1.Anchored = true
	wait(0.1)
	HumanoidRootPart1.Anchored = false
	vu:Button1Down(Vector2.new(1, 1))
	vu:Button1Up(Vector2.new(1, 1))
	wait(0.5)
	local v17, v18, v19 = pairs(Client.PlayerGui:GetChildren())
	local v20 = v19

	while true do
		local v21, v22 = v17(v18, v20)
		v20 = v21

		if v21 == nil then
			break
		end

		if string.find(v22.Name, v2) then
			local Dialogue1 = v22:FindFirstChild("Dialogue")
			if Dialogue1 and Dialogue1:FindFirstChild("Accept") then
				local Accept1 = Dialogue1.Accept

				if game.PlaceId == 4520749081 or (game.PlaceId == 6381829480 or v1) then
					Accept1.Size = UDim2.new(1001, 0, 1001, 0)
					Accept1.Text.TextTransparency = 1
					Accept1.Position = UDim2.new(0.5, 0, 0.5, 0)
					Accept1.AnchorPoint = Vector2.new(0.5, 0.5)
				else
					local v23, v24, v25 = pairs(Dialogue1:GetChildren())
					local v26 = v25

					while true do
						local v27, v28 = v23(v24, v26)
						v26 = v27

						if v27 == nil then
							break
						end

						if string.find(v28.Name, "Quest") or v28.Name == "QuestAccept" then
							v28.Size = UDim2.new(1001, 0, 1001, 0)
							v28.Text.TextTransparency = 1
							v28.Position = UDim2.new(0.5, 0, 0.5, 0)
							v28.AnchorPoint = Vector2.new(0.5, 0.5)
						end
					end

					if string.find(v22.Text.Text, "Talk") then
						local QuestAccept1 = Dialogue1:FindFirstChild("QuestAccept")
						if QuestAccept1 then
							QuestAccept1.Size = UDim2.new(1001, 0, 1001, 0)
							QuestAccept1.Text.TextTransparency = 1
							QuestAccept1.Position = UDim2.new(0.5, 0, 0.5, 0)
							QuestAccept1.AnchorPoint = Vector2.new(0.5, 0.5)
						end
					end
				end

				if Accept1 then
					Accept1:Click()
				end
			end
		end
	end
end

function Serverhop()
	HopServer(true)
end

function HopServer(arg1)
	local v1 = arg1 or false
	local HttpService = game:GetService("HttpService")
	local PlaceId = game.PlaceId
	local v2 =
		"https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
	local v7
	local v5

	for _ = 1, 5 do
		local v3 = v7
		local ok, result = pcall(function()
			return HttpService:JSONDecode(game:HttpGet(v2 .. (v3 and "&cursor=" .. v3 or "")))
		end)
		local resultRef

		if ok then
			resultRef = result
		else
			local tbl = {data = {}}
			tbl.nextPageCursor = nil
			resultRef = tbl
		end

		if resultRef and resultRef.data and #resultRef.data > 0 then
			for _, v4 in ipairs(resultRef.data) do
				if
					v4.id
						and v4.id ~= game.JobId
						and (not v4.playing or v4.playing < (v4.maxPlayers or 100))
				then
					v5 = v4
					break
				end
			end
		end

		if not v5 then
			local v6 = resultRef and resultRef.nextPageCursor
			v7 = v6

			if v6 then
				continue
			end
		end

		break
	end

	if v1 then
		if request then
			local tbl1 = {}
			local ok1, result1 = pcall(function()
				return
					request(
						{
							Url = string.format(
								"https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true",
								game.PlaceId
							)
						}
					)
			end)

			if ok1 and result1 and result1.Body then
				local v8 = HttpService:JSONDecode(result1.Body)
				if v8 and v8.data then
					for _, v9 in pairs(v8.data) do
						if
							type(v9) == "table"
								and tonumber(v9.playing)
								and tonumber(v9.maxPlayers)
								and v9.playing < v9.maxPlayers
								and v9.id ~= game.JobId
						then
							table.insert(tbl1, v9.id)
						end
					end
				end
			end

			if #tbl1 <= 0 then
				return "Couldn't find a server."
			end

			game:GetService("TeleportService")
				:TeleportToPlaceInstance(game.PlaceId, tbl1[math.random(1, #tbl1)], Client)
		else
			warn("request() not available")
		end
	elseif v5 and v5.id then
		game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceId, v5.id, Client)
	else
		warn("HopServer: no valid server found")
	end
end

function dist(arg1, arg2, arg3)
	local client = Client

	if not client then
		v148 = arg2 or client.HumanoidRootPart.Position
		v149 = Vector3.new
		v150 = arg1.X
		local num

		if arg3 then
			num = 0
		else
			num = arg1.Y
		end

		v151 = v149(v150, num, arg1.Z)
		v152 = Vector3.new
		v153 = v148.X
		local num1

		if arg3 then
			num1 = 0
		else
			num1 = v148.Y
		end

		return (v151 - v152(v153, num1, v148.Z)).magnitude
	end

	local Character = Client.Character
	local v1 = arg2 or Character.HumanoidRootPart.Position
	local new = Vector3.new
	local X = arg1.X
	local num2

	if arg3 then
		num2 = 0
	else
		num2 = arg1.Y
	end

	local v2 = new(X, num2, arg1.Z)
	local new1 = Vector3.new
	local X1 = v1.X
	local num3

	if arg3 then
		num3 = 0
	else
		num3 = v1.Y
	end

	return (v2 - new1(X1, num3, v1.Z)).magnitude
end

local num1 = 0

function seaChest()
	wait(3)
	local flag = false
	pcall(function()
		local SeaMonster = workspace:FindFirstChild("SeaMonster")
		local seaMonster = SeaMonster

		if SeaMonster then
			if SeaMonster:FindFirstChild("SeaKing") then
				flag = true
				return
			end
			seaMonster = SeaMonster:FindFirstChild("HydraSeaKing")
		end

		if seaMonster then
			flag = true
		end
	end)

	if
		flag
			or not ((function()
				for _, v1 in
					ipairs({"Legacy Island1", "Legacy Island2", "Legacy Island3", "Legacy Island4"})
				do
					local v2 = game:GetService("Workspace").Island:FindFirstChild(v1)
					if v2 then
						return v2
					end
				end
				return nil
			end)()
				or (function()
					for _, v1 in
						pairs(
							workspace:FindFirstChild("Island") and workspace.Island:GetChildren()
								or {}
						)
					do
						if v1.Name:match("Sea King") then
							return true
						end
					end
					return false
				end)())
	then
		return
	end

	for _, v1 in ipairs({"Legacy Island1", "Legacy Island2", "Legacy Island3", "Legacy Island4"}) do
		local Island = game:GetService("Workspace"):FindFirstChild("Island")
		local v2 = Island and Island:FindFirstChild(v1)

		if v2 then
			tp({Target = v2.ChestSpawner.CFrame})
			wait(3)

			if
				dist(v2.ChestSpawner.Position, Client.Character.HumanoidRootPart.Position) < 10
					and Client.PlayerStats.beli.Value > num1 + 1
			then
				print(num1, " : ", Client.PlayerStats.beli.Value)
				if _G.Settings.Monter_Hop or _G.Settings.Auto_Sea31 then
					task.wait(3.5)
					HopServer(false)
				end
			end
		end
	end

	for _, v3 in
		pairs(workspace:FindFirstChild("Island") and workspace.Island:GetChildren() or {})
	do
		if v3.Name:match("Sea King") then
			tp({Target = v3.HydraStand.CFrame})
		end
	end
end

local function func4(...)
	local tbl = {...}
	local v1 = tbl[1]
	local p

	if type(v1) ~= "vector" then
		if type(v1) ~= "userdata" then
			if type(v1) ~= "number" then
				v179 = math.huge
				local v2, v3, v4 = pairs(workspace.Island:GetChildren())
				v180 = v2
				v181 = v3
				v182 = v4
				v183 = nil

				while true do
					local v5, v6 = v180(v181, v182)
					v182 = v5

					if v182 == nil then
						break
					end

					if v6:IsA("Model") then
						local Magnitude = (nil - v6:GetModelCFrame().p).Magnitude
						if Magnitude < v179 then
							v183 = v6.Name
							v179 = Magnitude
						end
					end
				end

				if v183 then
					return v183
				end

				return
			end
			p = CFrame.new(unpack(tbl)).p
		else
			p = v1.Position
		end
	else
		p = v1
	end

	local huge = math.huge
	local v7, v8, v9 = pairs(workspace.Island:GetChildren())
	local v10 = v9
	local Name1

	while true do
		local v11, v12 = v7(v8, v10)
		v10 = v11

		if v11 == nil then
			break
		end

		if v12:IsA("Model") then
			local Magnitude1 = (p - v12:GetModelCFrame().p).Magnitude
			if Magnitude1 < huge then
				Name1 = v12.Name
				huge = Magnitude1
			end
		end
	end

	if Name1 then
		return Name1
	end
end

local tbl3 = {}

local function func5(arg1)
	for _, child in pairs(workspace.AllNPC:GetChildren()) do
		local v1 = func4(child.CFrame)
		if v1 == func4(arg1) then
			if not tbl3[v1] then
				tbl3[v1] = {}
			end
			table.insert(tbl3[v1], child.CFrame)
		end
	end
end

local tbl4 = {}

function adjustPosition(arg1, arg2)
	local v1 = _G.Disfarm or 7.5
	return
		arg1
			* (({
				Above = CFrame.new(0, v1, 0),
				Beside = CFrame.new(v1, 0, 0),
				Lower = CFrame.new(0, -v1, 0)
			})[arg2]
				or CFrame.new())
end

function getTargetPosition(character, arg2)
	local HumanoidRootPart = character:FindFirstChild("HumanoidRootPart")

	if HumanoidRootPart then
		local Position = HumanoidRootPart.Position
		local v1 =
			Position
				+ (({
					Above = Vector3.new(0, _G.Disfarm or 7.5, 0),
					Beside = Vector3.new(_G.Disfarm or 7.5, 0, 0),
					Lower = Vector3.new(0, -(_G.Disfarm or 7.5), 0)
				})[arg2]
					or Vector3.new())

		if arg2 ~= "Beside" then
			if arg2 ~= "Lower" then
				return CFrame.new(v1)
			end
		end

		return CFrame.new(v1, Position)
	end

	return nil
end

function tbl4.Bring(arg1, cFrame)
	if _G.Settings.Bring_Nearest_Mobs_Together then
		for _, v1 in pairs((func("Mon"))) do
			local Humanoid = v1:FindFirstChild("Humanoid")
			local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")

			if
				v1.Name == arg1.Name and (Humanoid and (Humanoid.Health > 0 and HumanoidRootPart))
			then
				HumanoidRootPart.CFrame = cFrame
				Humanoid.PlatformStand = true
				Humanoid:ChangeState(11)
				Humanoid:ChangeState(14)
				pcall(function()
					setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
				end)
			end
		end
	end
end

function tbl4.attack(arg1, arg2, _)
	local v1 = GetQuestData()
	local v2, v3

	if Sea2 then
		v2 =
			game:GetService("Workspace"):FindFirstChild("SeaMonster")
				and game:GetService("Workspace").SeaMonster:GetChildren()
				or {}
		local GhostMonster = game.Workspace:FindFirstChild("GhostMonster")
		v3 = GhostMonster and GhostMonster:GetChildren() or {}
	elseif Sea3 then
		v2 =
			game:GetService("Workspace"):FindFirstChild("SeaMonster")
				and game:GetService("Workspace").SeaMonster:GetChildren()
				or {}
		v3 = {}
	else
		local MOB = game:GetService("ReplicatedStorage"):FindFirstChild("MOB")
		local v4 = MOB and MOB:GetChildren() or {}
		v2 = v4
		v3 = v4
	end

	local function func1(character)
		if
			character
				and (character:FindFirstChild("Humanoid")
					and character:FindFirstChild("HumanoidRootPart"))
		then
			local v2 = math.floor(character.Humanoid.Health / character.Humanoid.MaxHealth * 100)
			local v3 = character.Humanoid.Health > 0 and "Alive" or "Dead"
			_G.LabelAutoFarm = string.format("Farming: %s", character.Name)
			_G.Questname = string.format("Quest: %s", v1.QuestTitle)
			_G.LabelHealth = string.format("Status: %s | Health: %d%%", v3, v2)
		else
			_G.LabelAutoFarm = "No target detected."
		end
	end

	local function func3(character)
		if not (_G.Settings[arg2] and character.Parent) then
			return
		end
		repeat
			task.wait()
			if
				character:FindFirstChild("Humanoid")
					and character:FindFirstChild("HumanoidRootPart")
			then
				local Health = character.Humanoid.Health
				local Y = character.HumanoidRootPart.Position.Y
				func1(character)

				if 0 < Health and (-100 < Y and Y < 1500) then
					tp(
						{
							Target = getTargetPosition(character, _G.Settings.PositionFarm),
							Mod = _G.Settings.PositionFarm == "Above"
								and CFrame.Angles(-5156.620156177409, 0, 0)
								or CFrame.new()
						}
					)
					task.spawn(function()
						Attack()
						getgenv().PosMonSkill = character.HumanoidRootPart
						func2()
					end)

					if not character:FindFirstChild("Next") then
						tbl4.Bring(character, character.HumanoidRootPart.CFrame)
						local next1 = Instance.new("Folder", character)
						next1.Name = "Next"
						task.delay(
							1,
							function()
								next1:Destroy()
							end
						)
					end
				end
			end
		until character.Humanoid.Health <= 0 or not (character.Parent and _G.Settings[arg2])
	end

	for _, v5 in
		ipairs(
			{
				func("Boss"),
				func("Mon"),
				game:GetService("Workspace").SeaMonster:GetChildren(),
				v3,
				v2,
				game:GetService("ReplicatedStorage").MOB:GetChildren()
			}
		)
	do
		for _, v6 in ipairs(v5) do
			if table.find(arg1, v6.Name) then
				func3(v6)
			elseif
				v6:FindFirstChild("Humanoid")
					and (v6:FindFirstChild("HumanoidRootPart") and v6.Humanoid.Health > 0)
			then
				tp({Target = v6.HumanoidRootPart.CFrame * CFrame.new(0, 200, 0)})
			end
		end
	end
end

function tbl4:find()
	local v1, v2

	if Sea2 then
		v1 =
			game:GetService("Workspace"):FindFirstChild("SeaMonster")
				and game:GetService("Workspace").SeaMonster:GetChildren()
				or {}
		local GhostMonster = game.Workspace:FindFirstChild("GhostMonster")
		v2 = GhostMonster and GhostMonster:GetChildren() or {}
	elseif Sea3 then
		v1 =
			game:GetService("Workspace"):FindFirstChild("SeaMonster")
				and game:GetService("Workspace").SeaMonster:GetChildren()
				or {}
		v2 =
			game:GetService("ReplicatedStorage"):FindFirstChild("MOB")
				and game:GetService("ReplicatedStorage").MOB:GetChildren()
				or {}
	else
		local MOB = game:GetService("ReplicatedStorage"):FindFirstChild("MOB")
		local v3 = MOB and MOB:GetChildren() or {}
		v1 = v3
		v2 = v3
	end

	local function func1(arg1)
		for _, v1 in pairs(arg1) do
			if table.find(self, v1.Name) then
				local Humanoid = v1:FindFirstChild("Humanoid")
				local v2

				if Humanoid then
					v2 = v1.Humanoid.Health > 0
				else
					v2 = Humanoid
				end

				if v2 then
					return true
				end
			end
		end
		return false
	end

	return
		func1(
			workspace:FindFirstChild("Monster")
				and workspace.Monster:FindFirstChild("Mon")
				and func("Mon")
				or {}
		)
			or (func1(
				workspace:FindFirstChild("Monster")
					and workspace.Monster:FindFirstChild("Boss")
					and func("Boss")
					or {}
			)
				or (func1(v2) or func1(v1))
				or func1(game:GetService("ReplicatedStorage").MOB:GetChildren())
				or (func1(
					workspace:FindFirstChild("Monster")
						and workspace.Monster:FindFirstChild("Mon")
						and func("Mon")
						or {}
				)
					or func1(
						workspace:FindFirstChild("Monster")
							and workspace.Monster:FindFirstChild("Boss")
							and func("Boss")
							or {}
					)))
end

function tbl4.attackMon(arg1, arg2, _)
	local v1 =
		Client.PlayerGui:FindFirstChild("MainGui")
			and Client.PlayerGui.MainGui:FindFirstChild("QuestFrame")
			and Client.PlayerGui.MainGui.QuestFrame:FindFirstChild("QuestBoard")
	local v2, v3

	if Sea2 or Sea3 then
		v2 =
			game:GetService("Workspace"):FindFirstChild("SeaMonster")
				and game:GetService("Workspace").SeaMonster:GetChildren()
				or {}
		local GhostMonster = game.Workspace:FindFirstChild("GhostMonster")
		v3 = GhostMonster and GhostMonster:GetChildren() or {}
	else
		local MOB = game:GetService("ReplicatedStorage"):FindFirstChild("MOB")
		local v4 = MOB and MOB:GetChildren() or {}
		v2 = v4
		v3 = v4
	end

	local function func1(character)
		local v1 =
			character:FindFirstChild("Humanoid") and character:FindFirstChild("HumanoidRootPart")

		if not v1 then
			return v1
		end

		return
			character.Humanoid.Health > 0
				and (character.HumanoidRootPart.Position.Y > -100
					and character.HumanoidRootPart.Position.Y < 1500)
	end

	local function func3(character)
		repeat
			task.wait()
			if func1(character) then
				tp(
					{
						Target = getTargetPosition(character, _G.Settings.PositionFarm),
						Mod = _G.Settings.PositionFarm == "Above"
							and CFrame.Angles(-5156.620156177409, 0, 0)
							or CFrame.new()
					}
				)
				task.spawn(function()
					Attack()
					getgenv().PosMonSkill = character.HumanoidRootPart
					func2()
				end)
			end
		until
			not (_G.Settings[arg2] ~= nil
				and (arg2 ~= "Auto_Farm_Level1"
					or v1.Visible
						and v1.TextFrame.QuestCount.Text:find(
							character.Name:gsub("%[Lv%.%s*%d+%]", "")
						))
				and (character.Parent
					and (character.Humanoid.Health > 0
						and (character:FindFirstChild("HumanoidRootPart")
							and (character.HumanoidRootPart.Position.Y >= -100
								and character.HumanoidRootPart.Position.Y <= 1500)))))
	end;

	(function(arg3)
		for _, v1 in ipairs(arg3) do
			for _, v2 in ipairs(v1) do
				if table.find(arg1, v2.Name) and _G.Settings[arg2] ~= nil then
					local v3 =
						v2:FindFirstChild("Humanoid") and v2:FindFirstChild("HumanoidRootPart")
					local v4

					if v3 then
						v4 =
							v2.Humanoid.Health > 0
								and (v2.HumanoidRootPart.Position.Y > -100
									and v2.HumanoidRootPart.Position.Y < 1500)
					else
						v4 = v3
					end

					if v4 then
						func3(v2)
					elseif v1 == game:GetService("ReplicatedStorage").MOB:GetChildren() then
						Tp(v2.HumanoidRootPart.CFrame * CFrame.new(0, 200, 0))
					end
				end
			end
		end
	end)(
		{func("Boss"), func("Mon"), v3, v2, game:GetService("ReplicatedStorage").MOB:GetChildren()}
	)
end

function loadIslandForAllNPCs(arg1, arg2)
	local v1 = tbl3[arg1]

	if _G.Settings.Auto_Farm_Level1 and not tbl4.find({arg2}) then
		if v1 and #v1 > 0 then
			local v2, v3, v4 = pairs(v1)
			local v5 = v4

			while true do
				local v6, v7 = v2(v3, v5)
				v5 = v6

				if v6 == nil or (not _G.Settings.Auto_Farm_Level1 or tbl4.find({arg2})) then
					break
				end

				local v8 = Client.Character and Client.Character:FindFirstChild("HumanoidRootPart")

				if v8 then
					v8.CFrame = v7 * CFrame.new(0, 50, -math.random(5, 10))
				end

				wait(0.5)
			end

			return "Loaded all NPC positions on island: " .. arg1
		end
		return "No NPCs found on island: " .. arg1
	end

	return "Entity Spawn"
end

local function func6(arg1, arg2)
	if arg1.LevelRequired ~= 3750 then
		if arg1.LevelRequired ~= 3775 then
			if arg1.LevelRequired ~= 4750 then
				func5(arg2)
				loadIslandForAllNPCs(func4(arg2), arg1.Mob)
			else
				tp(
					{
						Target = workspace.Island["Forgotten Coliseum"].Vacuus.Base:GetChildren()[179].CFrame
							* CFrame.new(0, 20, 0)
					}
				)
			end
		else
			tp(
				{
					Target = workspace.Island["H - Fiore"].Italian.Base.Mountain.Model:GetChildren()[9].CFrame
						* CFrame.new(0, 20, 0)
				}
			)
		end
	else
		tp({Target = workspace.Island["H - Fiore"].Lab.Lab.Base.CFrame * CFrame.new(0, 20, 0)})
	end
end

local tbl5 = {}
local v40
GetQuestData()

function tbl5.Auto_Spawn_Kaido()
	while _G.Settings.Auto_Spawn_Kaido and task.wait(2) do

	end
end

function tbl5.Bring_Nearest_Mobs_Together()
	while _G.Settings.Bring_Nearest_Mobs_Together and task.wait(2) do

	end
end

function tbl5.Auto_Farm_Level1()
	while _G.Settings.Auto_Farm_Level1 and task.wait(0.3) do
		local ok, result = pcall(function()
			local v1 = GetQuestData()

			if not v1 or not v1.Mob then
				return
			end

			local cFrame = CFrame.new()
			local str, v2, v3

			if v1.NPC and typeof(v1.NPC) == "table" and v1.NPC.CFrame then
				cFrame = v1.NPC.CFrame
			else
				if v1.NPC then
					if typeof(v1.NPC) == "CFrame" then
						cFrame = v1.NPC
						str = ""
						pcall(function()
							str = tostring(Client.CurrentQuest.Value)
						end)

						if str ~= v1.QuestTitle or str == "" then
							tp({Target = cFrame})
							pcall(function()
								Repli:WaitForChild(
									"Chest"
								).Remotes.Functions.Quest:InvokeServer("take", v1.QuestTitle)
							end)
							task.wait(0.5)
						else
							if v1.Mob == "Dough Master [Lv. 3275]" and v1.LevelRequired == 3275 then
								tp(
									{
										Target = CFrame.new(
											30279.0625,
											69.36441802978516,
											93166.2734375
										)
									}
								)
							else
								v2 =
									Repli:FindFirstChild("MOB") and Repli.MOB:FindFirstChild(v1.Mob)
								if v2 then
									v3 = v2.GetModelCFrame and v2:GetModelCFrame()

									if not v3 then
										v3 =
											v2:FindFirstChild("HumanoidRootPart")
												and v2.HumanoidRootPart.CFrame
										if not v3 then
											if not tbl4.find({v1.Mob}) then
												return
											end

											task.delay(
												0.5,
												function()
													v40 = nil
												end
											)
											tbl4.attack({v1.Mob}, "Auto_Farm_Level1")
											task.delay(
												0.5,
												function()
													pcall(function()
														v40 =
															Client.Character
																and Client.Character:FindFirstChild("HumanoidRootPart")
																and Client.Character.HumanoidRootPart.CFrame
													end)
												end
											)
											return
										end
									end

									tp({Target = v3 * CFrame.new(0, 20, 0)})
								elseif v1.LevelRequired < 3265 or v40 ~= nil then
									tp({Target = v40 or cFrame})
								elseif func6 then
									func6(v1, cFrame)
								else
									tp({Target = cFrame})
								end
							end

							if not tbl4.find({v1.Mob}) then
								return
							end

							task.delay(
								0.5,
								function()
									v40 = nil
								end
							)
							tbl4.attack({v1.Mob}, "Auto_Farm_Level1")
							task.delay(
								0.5,
								function()
									pcall(function()
										v40 =
											Client.Character
												and Client.Character:FindFirstChild("HumanoidRootPart")
												and Client.Character.HumanoidRootPart.CFrame
									end)
								end
							)
						end

						return
					end
				end
				if v1.NPC and v1.NPC.CFrame then
					cFrame = v1.NPC.CFrame
				end
			end

			str = ""
			pcall(function()
				str = tostring(Client.CurrentQuest.Value)
			end)

			if str ~= v1.QuestTitle or str == "" then
				tp({Target = cFrame})
				pcall(function()
					Repli:WaitForChild(
						"Chest"
					).Remotes.Functions.Quest:InvokeServer("take", v1.QuestTitle)
				end)
				task.wait(0.5)
			else
				if v1.Mob == "Dough Master [Lv. 3275]" and v1.LevelRequired == 3275 then
					tp({Target = CFrame.new(30279.0625, 69.36441802978516, 93166.2734375)})
				else
					v2 = Repli:FindFirstChild("MOB") and Repli.MOB:FindFirstChild(v1.Mob)
					if v2 then
						v3 = v2.GetModelCFrame and v2:GetModelCFrame()

						if not v3 then
							v3 =
								v2:FindFirstChild("HumanoidRootPart") and v2.HumanoidRootPart.CFrame
							if not v3 then
								if not tbl4.find({v1.Mob}) then
									return
								end

								task.delay(
									0.5,
									function()
										v40 = nil
									end
								)
								tbl4.attack({v1.Mob}, "Auto_Farm_Level1")
								task.delay(
									0.5,
									function()
										pcall(function()
											v40 =
												Client.Character
													and Client.Character:FindFirstChild("HumanoidRootPart")
													and Client.Character.HumanoidRootPart.CFrame
										end)
									end
								)
								return
							end
						end

						tp({Target = v3 * CFrame.new(0, 20, 0)})
					elseif v1.LevelRequired < 3265 or v40 ~= nil then
						tp({Target = v40 or cFrame})
					elseif func6 then
						func6(v1, cFrame)
					else
						tp({Target = cFrame})
					end
				end

				if not tbl4.find({v1.Mob}) then
					return
				end

				task.delay(
					0.5,
					function()
						v40 = nil
					end
				)
				tbl4.attack({v1.Mob}, "Auto_Farm_Level1")
				task.delay(
					0.5,
					function()
						pcall(function()
							v40 =
								Client.Character
									and Client.Character:FindFirstChild("HumanoidRootPart")
									and Client.Character.HumanoidRootPart.CFrame
						end)
					end
				)
			end
		end)
		if not ok then
			warn(tostring(result), ": Auto_Farm_Level1")
		end
	end
end

function tbl5.Auto_Sea21()
	while _G.Settings.Auto_Sea21 and task.wait(0.5) do
		local ok, result = pcall(function()
			if not Sea1 then
				return
			end

			local Value = Client.PlayerStats.lvl.Value

			if Value < 2250 or Value >= 4000 then
				return
			end

			if _G.Settings.Auto_Farm_Level1 then
				_G.Settings.Auto_Farm_Level1 = false
			end

			local str = ""
			pcall(function()
				str = tostring(Client.PlayerStats.SecondSeaProgression.Value)
			end)

			if str ~= "Yes" then
				if getPlayerMaterial("Map") <= 0 then
					local flag = false
					pcall(function()
						local MainGui = Client.PlayerGui:FindFirstChild("MainGui")
						local v1 = MainGui and MainGui:FindFirstChild("QuestFrame")
						local v2 = v1 and v1:FindFirstChild("QuestBoard")
						flag = v2 and v2.Visible
					end)

					if flag then
						local v1 =
							Repli:FindFirstChild("MOB")
								and Repli.MOB:FindFirstChild("Seasoned Fishman [Lv. 2200]")

						if v1 then
							local v2 =
								v1.GetPivot and v1:GetPivot()
									or v1:FindFirstChild("HumanoidRootPart")
										and v1.HumanoidRootPart.CFrame
							if v2 then
								tp({Target = v2})
							end
						else
							tp({Target = CFrame.new(-1865.43481, 45.2696266, 6722.8501)})
						end

						if tbl4.find({"Seasoned Fishman [Lv. 2200]"}) then
							tbl4.attack({"Seasoned Fishman [Lv. 2200]"}, "Auto_Sea21")
						end
					else
						func1("Traveler")
						task.wait(0.5)
						local v3 = SafeNPC("Traveler")

						if v3 then
							tp({Target = v3.CFrame * CFrame.new(0, 0, -10)})
						end
					end
				else
					func1("Traveler")
					task.wait(0.5)
					local v4 = SafeNPC("Traveler")

					if v4 then
						tp({Target = v4.CFrame * CFrame.new(0, 0, -10)})
					end
				end
			else
				local v5 = SafeNPC("Traveler") or SafeNPC("Elite Pirate")
				if v5 then
					toQuest(v5.CFrame, 2)
				else
					warn("Auto_Sea21: Traveler/Elite Pirate not found")
				end
			end
		end)
		if not ok then
			warn(result, ": Auto_Sea21")
		end
	end
end

function tbl5.Auto_Sea31()
	while _G.Settings.Auto_Sea31 and task.wait(1) do
		local ok, result = pcall(function()
			v307 =
				v307
					or {
						Log = 50,
						["Pile of Bones"] = 10,
						["Fresh Fish"] = 50,
						["Angellic's Feather"] = 14,
						["Sea King's Blood"] = 1
					}
			local v1 = v308

			if not v1 then
				local tbl1 = {}
				local v2 = SafeNPC("Elite Pirate")
				local CFrame1

				if v2 then
					CFrame1 = v2.CFrame
				else
					CFrame1 = CFrame.new()
				end

				tbl1.Sea1 = CFrame1
				local v3 = SafeNPC("Traveler")
				local CFrame2

				if v3 then
					CFrame2 = v3.CFrame
				else
					CFrame2 = CFrame.new()
				end

				if not CFrame2 then
					local v4 = SafeNPC("Elite Pirate")
					if v4 then
						CFrame2 = v4.CFrame
					else
						CFrame2 = CFrame.new()
					end
				end

				tbl1.Sea2 = CFrame2
				v1 = tbl1
			end

			v308 = v1
			v316 = v316 or nil

			if getPlayerMaterial("Kraken's Cache") > 0 then
				return
			end

			local num

			if tbl4.find({"Tentacle"}) then
				num = 13
			elseif getPlayerMaterial("Heart of Sea") > 0 then
				num = 16
			elseif getPlayerMaterial("Log") < (v307.Log or 50) then
				num = 27
			else
				num = 28
			end

			local num1 = 0

			while true do
				num1 = num1 + 1

				if num1 > 50 then
					warn("Auto_Sea31: safety break")
				elseif num < 27 then
					if num < 13 then
						if num < 10 then
							if num == 3 then
								return
							end
						elseif num < 11 then
							if num == 10 then
								func1("The Squid")
								wait(0.5)
								local tpRef = tp
								local tbl2 = {}
								local v5 = SafeNPC("The Squid")
								local CFrame3

								if v5 then
									CFrame3 = v5.CFrame
								else
									CFrame3 = CFrame.new()
								end

								tbl2.Target = CFrame3 * CFrame.new(0, 10, -10)
								tpRef(tbl2)
							end
						elseif num == 11 then
							if tbl4.find({"Tentacle"}) then
								num = 13
							else
								num = 14
							end
							continue
						end
					elseif num < 16 then
						if num < 14 then
							if num == 13 then
								tbl4.attackMon({"Tentacle"}, "Auto_Sea31", 10)
							end
						elseif num == 14 then
							if getPlayerMaterial("Heart of Sea") <= 0 then
								num = 17
							else
								num = 16
							end
							continue
						end
					elseif num < 17 then
						if num == 16 then
							if Client.PlayerGui:FindFirstChild("CraftingMaterialUI") then
								Client.PlayerGui:FindFirstChild("CraftingMaterialUI"):Destroy()
								Client.Character.Humanoid:ChangeState(15)
							else
								func1("Summon Tentacle")
							end
						end
					elseif num == 17 then
						if not (getPlayerMaterial("Kraken's Cache") <= 0) then
							return
						end

						if tbl4.find({"Tentacle"}) then
							return
						end

						local tbl3 = {
							Log = 50,
							["Pile of Bones"] = 10,
							["Fresh Fish"] = 50,
							["Angellic's Feather"] = 14,
							["Sea King's Blood"] = 1
						}

						local tbl5 = {
							Sea1 = (workspace.AllNPC:FindFirstChild("Elite Pirate")
								or workspace.AllNPC:FindFirstChild("The Squid")
								or {CFrame = CFrame.new()}).CFrame,
							Sea2 = (workspace.AllNPC:FindFirstChild("Elite Pirate")
								or workspace.AllNPC:FindFirstChild("Traveler")
								or {CFrame = CFrame.new()}).CFrame
						}

						v307 = tbl3
						v308 = tbl5

						if getPlayerMaterial("Log") >= tbl3.Log then
							num = 28
						else
							num = 27
						end

						continue
					end
				elseif num < 40 then
					if num < 32 then
						if num < 28 then
							if num == 27 then
								if not Sea2 then
									toQuest(v308 and v308.Sea2 or CFrame.new())
									return
								end

								local v6, v7 = pairs(game:GetService("Workspace"):GetDescendants())
								v310 = v6
								v311 = v7
								num = 32
								continue
							end
						elseif num == 28 then
							if
								getPlayerMaterial("Pile of Bones")
									>= (v307 and v307["Pile of Bones"] or 10)
							then
								if
									getPlayerMaterial("Fresh Fish")
										>= (v307 and v307["Fresh Fish"] or 50)
								then
									if
										getPlayerMaterial("Angellic's Feather")
											>= (v307 and v307["Angellic's Feather"] or 14)
									then
										if
											getPlayerMaterial("Sea King's Blood")
												>= (v307 and v307["Sea King's Blood"] or 1)
										then
											if Sea2 then
												func1("Jack Stones")
												for _, child in pairs(Client.PlayerGui:GetChildren()) do
													if child.Name == "CraftingMaterialUI" then
														if
															child:FindFirstChild("Frame")
																and child.Frame.OrbName.Text ~= "Heart of Sea"
														then
															child.Frame.Materials.AnchorPoint = Vector2.new(0, 0)
															child.Frame.Materials.Position = UDim2.new(0, 0, 0, 0)
															child.Frame.Materials.Visible = true

															if
																child.Frame.Materials:FindFirstChild("ScrollingFrame")
															then
																child.Frame.Materials:FindFirstChild(
																	"ScrollingFrame"
																).ClipsDescendants =
																	false

																if
																	child.Frame.Materials:FindFirstChild("ScrollingFrame")
																		:FindFirstChild("UIGridLayout")
																then
																	child.Frame.Materials:FindFirstChild("ScrollingFrame")
																		:FindFirstChild(
																			"UIGridLayout"
																		).CellSize = UDim2.new(1001, 0, 1001, 0)
																end

																if
																	child.Frame.Materials:FindFirstChild("ScrollingFrame")
																		:FindFirstChild("Diamond Key")
																then
																	child.Frame.Materials:FindFirstChild("ScrollingFrame")
																		:FindFirstChild("Diamond Key").Visible =
																		false
																end

																game:GetService("VirtualUser")
																	:Button1Down(Vector2.new(1, 1))
																game:GetService("VirtualUser"):Button1Up(Vector2.new(1, 1))
															end
														elseif child.Frame.OrbName.Text == "Heart of Sea" then
															child.Frame.CraftButton.Size = UDim2.new(1001, 0, 1001, 0)
															game:GetService("VirtualUser")
																:Button1Down(Vector2.new(1, 1))
															game:GetService("VirtualUser"):Button1Up(Vector2.new(1, 1))
														end
													end
												end
											else
												toQuest(v308 and v308.Sea2 or CFrame.new())
											end
										elseif Sea2 then
											warn("Sea King's Blood Not Have")
											if tbl4.find({"SeaKing", "HydraSeaKing"}) then
												tbl4.attack({"SeaKing", "HydraSeaKing"}, "Auto_Sea31")
											else
												seaChest()
											end
										else
											toQuest(v308 and v308.Sea2 or CFrame.new())
										end
									elseif Sea1 then
										if
											tbl4.find({"Sky Soldier [Lv. 800]", "Ball Man [Lv. 850]"})
										then
											tbl4.attack(
												{"Sky Soldier [Lv. 800]", "Ball Man [Lv. 850]"},
												"Auto_Sea31"
											)
										else
											tp(
												{
													Target = workspace.Island["H - Skyland"].Sky.Base:GetChildren()[4].CFrame
												}
											)
										end
									else
										toQuest(v308 and v308.Sea1 or CFrame.new())
									end
								elseif Sea1 then
									if
										tbl4.find(
											{
												"Karate Fishman [Lv. 200]",
												"Fighter Fishman [Lv. 180]",
												"Shark Man [Lv. 230]"
											}
										)
									then
										tbl4.attack(
											{
												"Karate Fishman [Lv. 200]",
												"Fighter Fishman [Lv. 180]",
												"Shark Man [Lv. 230]"
											},
											"Auto_Sea31"
										)
									else
										tp(
											{
												Target = workspace.Island["D - Shark Island"].D.Base:GetChildren()[57].CFrame
											}
										)
									end
								else
									toQuest(v308 and v308.Sea1 or CFrame.new())
								end
							elseif Sea2 then
								if tbl4.find({"Skull Pirate [Lv. 3050]"}) then
									tbl4.attack({"Skull Pirate [Lv. 3050]"}, "Auto_Sea31")
								else
									tp(
										{
											Target = CFrame.new(
												-5996.76953125,
												462.4600524902344,
												7296.43115234375
											)
												* CFrame.new(0, -50, 0)
										}
									)
								end
							else
								toQuest(v308 and v308.Sea2 or CFrame.new())
							end
						end
					elseif num < 36 then
						if num == 32 then
							local v8, v9 = v310(v311, nil)

							if v8 == nil then
								return
							end

							if
								string.find(v9.Name, "Tree")
									and (v9:FindFirstChild("Part") and v9.Part.Transparency == 0)
							then
								v316 = v9
								num = 40
							else
								num = 36
							end

							continue
						end
					elseif num == 36 then
						if
							not (_G.Settings.Auto_Sea31
								and (getPlayerMaterial("Log") < (v307 and v307.Log or 50)
									and (not tbl4.find({"Tentacle"})
										and getPlayerMaterial("Kraken's Cache") <= 0)))
						then
							return
						end
					end
				elseif num < 49 then
					if num < 43 then
						if num == 40 then
							task.wait(1.5)

							if not _G.Settings.Auto_Sea31 then
								if
									not (getPlayerMaterial("Log")
										<= (v307 and (v307 and v307.Log or 50) or 50))
								then
									tbl4.find({"Tentacle"})
								end
							end

							num = 43
							continue
						end
					elseif num == 43 then
						wait()

						local tbl6 = {
							Target = v316 and v316.GetModelCFrame and v316:GetModelCFrame()
								or Client.Character
									and Client.Character:FindFirstChild("HumanoidRootPart")
									and Client.Character.HumanoidRootPart.CFrame
								or CFrame.new()
						}

						tp(tbl6)

						if
							not (Client.Backpack:FindFirstChild("Bisento")
								or Client.Character:FindFirstChild("Bisento"))
						then
							game:GetService("ReplicatedStorage")
								:WaitForChild("Chest")
								:WaitForChild("Remotes")
								:WaitForChild("Functions")
								:WaitForChild("InventoryEq")
								:InvokeServer(unpack({"Bisento"}))
						end

						num = 49
						continue
					end
				elseif num < 134 then
					if num == 49 then
						EquipTools("Bisento")

						if not (tbl.CheckOnCooldown("Z") and tbl.CheckOnCooldown("X")) then
							local VirtualInputManager = game:GetService("VirtualInputManager")
							VirtualInputManager:SendKeyEvent(true, "Z", false, game)
							game:GetService("VirtualInputManager")
								:SendKeyEvent(false, "Z", false, game)
							game:GetService("VirtualInputManager")
								:SendKeyEvent(true, "X", false, game)
							game:GetService("VirtualInputManager")
								:SendKeyEvent(false, "X", false, game)
						end

						if _G.Settings.Auto_Sea31 then
							if not tbl.CheckOnCooldown("Z") then
								if not tbl.CheckOnCooldown("X") then
									if not tbl4.find({"Tentacle"}) then
										getPlayerMaterial("Kraken's Cache")
									end
								end
							end
						end
					end
				elseif num == 134 then
					if Client.PlayerStats.lvl.Value < 4000 or Sea3 then
						return
					end

					if _G.Settings.Auto_Farm_Level1 then
						_G.Settings.Auto_Farm_Level1 = false
					end

					getPlayerMaterial("Kraken's Cache")
				end

				break
			end
		end)
		if not ok then
			warn(result, ": Auto_Sea31")
		end
	end
end

local tbl6 = {}

function tbl5.Auto_Kill_Minion1()
	while _G.Settings.Auto_Kill_Minion1 and task.wait() do
		local ok, result = pcall(function()
			local Children = workspace.EventSpawns:GetChildren()
			local flag = false

			for _, v1 in pairs(Children) do
				if v1.Name == "Spawn" and v1:FindFirstChild("Chest") then
					local CFrame1 = v1.Chest.RootPart.CFrame
					if not tbl6[CFrame1] then
						tbl6[CFrame1] = true
						tp({Target = CFrame1})

						for i = 1, 7 do
							local v2 = "Chest" .. i
							local v3 = game:GetService("Workspace"):FindFirstChild(v2)

							if v3 then
								pcall(function()
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
										v3.RootPart.CFrame
								end)
							end
						end
					end
				end
				if tbl4.find({"Minion", "Boss"}) then
					tbl4.attack({"Minion", "Boss"}, "Auto_Kill_Minion1")
					flag = true
					break
				end
			end

			if flag then
				return
			end

			for _, v4 in pairs(Children) do
				if v4.Name == "Spawn" then
					pcall(function()
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v4.CFrame
					end)
					task.wait(1)

					if tbl4.find({"Minion", "Boss"}) then
						tbl4.attack({"Minion", "Boss"}, "Auto_Kill_Minion1")
						break
					end
				end
			end
		end)
		if not ok then
			warn(result, ": Auto_Kill_Minion1")
		end
	end
end

function tbl5.Auto_Farm_Nearest_Mob()
	while _G.Settings.Auto_Farm_Nearest_Mob and task.wait() do
		local ok, result = pcall(function()
			for _, child in pairs(game:GetService("Workspace").Monster.Mon:GetChildren()) do
				local Humanoid = child:FindFirstChild("Humanoid")
				local HumanoidRootPart = child:FindFirstChild("HumanoidRootPart")

				if
					Humanoid
						and (HumanoidRootPart
							and (Humanoid.Health > 0
								and ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position
									- HumanoidRootPart.Position).Magnitude
									<= 1000
									and tbl4.find({child.Name}))))
				then
					tbl4.attack({child.Name}, "Auto_Farm_Nearest_Mob")
				end
			end
		end)
		if not ok then
			warn(result, ": Auto_Farm_Nearest_Mob")
		end
	end
end

function tbl5.Auto_Kill_Sea_King1()
	while _G.Settings.Auto_Kill_Sea_King1 and task.wait() do
		local ok, result = pcall(function()
			if tbl4.find({"SeaKing"}) then
				tbl4.attack({"SeaKing"}, "Auto_Kill_Sea_King1")
			else
				seaChest()
			end
		end)
		if not ok then
			warn(result, ": Auto_Kill_Sea_King1")
		end
	end
end

function tbl5.Auto_Kill_GhostMonster1()
	while _G.Settings.Auto_Kill_GhostMonster1 and task.wait() do
		local ok, result = pcall(function()
			if tbl4.find({"Ghost Ship"}) then
				num1 = Client.PlayerStats.beli.Value
				tbl4.attack({"Ghost Ship"}, "Auto_Kill_GhostMonster1")
			else
				for _, child in pairs(game.Workspace:GetChildren()) do
					if
						child.Name:match("Chest")
							and (child.PrimaryPart
								and (cheatKey[child.PrimaryPart.CFrame] == false
									or cheatKey[child.PrimaryPart.CFrame] == nil))
					then
						Tp(child.PrimaryPart.CFrame)
						cheatKey[child.PrimaryPart.CFrame] = true
						task.wait(0.3)
					end
				end
			end
		end)

		if not ok then
			print("Error in Auto_Kill_GhostMonster1:", result)
		end

		task.wait()
	end
end

function tbl5.Abyssal_Tyrant()
	while _G.Settings.Abyssal_Tyrant and task.wait() do
		local ok, result = pcall(function()
			if not tbl4.find({"SeaDragon"}) then
				return
			end
			tbl4.attack({"SeaDragon"}, "Abyssal_Tyrant")
		end)
		if not ok then
			warn(result, ": Abyssal_Tyrant")
		end
	end
end

function tbl5.Chaos_Kraken()
	while _G.Settings.Chaos_Kraken and task.wait() do
		local ok, result = pcall(function()
			if not tbl4.find({"FuryTentacle"}) then
				return
			end
			tbl4.attack({"FuryTentacle"}, "Chaos_Kraken")
		end)
		if not ok then
			warn(result, ": Chaos_Kraken")
		end
	end
end

function tbl5.Deepsea_Crusher()
	while _G.Settings.Deepsea_Crusher and task.wait() do
		local ok, result = pcall(function()
			if not tbl4.find({"ThirdSeaEldritch Crab"}) then
				return
			end
			tbl4.attack({"ThirdSeaEldritch Crab"}, "Deepsea_Crusher")
		end)
		if not ok then
			warn(result, ": Deepsea_Crusher")
		end
	end
end

function tbl5.auto_draken()
	while _G.Settings.auto_draken and task.wait() do
		local ok, result = pcall(function()
			if not tbl4.find({"ThirdSeaDragon"}) then
				return
			end
			tbl4.attack({"ThirdSeaDragon"}, "auto_draken")
		end)
		if not ok then
			warn(result, ": auto_draken")
		end
	end
end

function tbl5.Auto_Kill_Hydar_Sea_King1()
	while _G.Settings.Auto_Kill_Hydar_Sea_King1 and task.wait() do
		local ok, result = pcall(function()
			if tbl4.find({"HydraSeaKing"}) then
				tbl4.attack({"HydraSeaKing"}, "Auto_Kill_Hydar_Sea_King1")
			else
				seaChest()
			end
		end)
		if not ok then
			warn(result, ": Auto_Kill_Hydar_Sea_King1")
		end
	end
end

function tbl5.Auto_Kill_Kaido1()
	while _G.Settings.Auto_Kill_Kaido1 and task.wait() do
		local ok, result = pcall(function()
			if tbl4.find({"Dragon [Lv. 5000]"}) then
				tbl4.attack({"Dragon [Lv. 5000]"}, "Auto_Kill_Kaido1")
			elseif getPlayerMaterial("Dragon's Orb") <= 0 or not _G.Settings.Auto_Spawn_Kaido then
				if tbl4.find({"Elite Skeleton [Lv. 3100]"}) then
					tbl4.attack({"Elite Skeleton [Lv. 3100]"}, "Auto_Kill_Kaido1")
				else
					tp(
						{
							Target = CFrame.new(-5996.76953125, 462.4600524902344, 7296.43115234375)
								* CFrame.new(0, -50, 0)
						}
					)
				end
			else
				func1("SummonDragon", "SummonDragon")
			end
		end)
		if not ok then
			warn(result, ": Auto_Kill_Kaido1")
		end
	end
end

function tbl5.Auto_Expert_Swordman1()
	while _G.Settings.Auto_Expert_Swordman1 and task.wait() do
		local ok, result = pcall(function()
			if not tbl4.find({"Expert Swordman [Lv. 3000]"}) then
				return
			end
			tbl4.attack({"Expert Swordman [Lv. 3000]"}, "Auto_Expert_Swordman1")
		end)
		if not ok then
			warn(result, ": Auto_Expert_Swordman1")
		end
	end
end

function tbl5.auto_bushido()
	while _G.Settings.auto_bushido and task.wait() do
		local ok, result = pcall(function()
			if not tbl4.find({"Bushido Ape [Lv. 5000]"}) then
				return
			end
			tbl4.attack({"Bushido Ape [Lv. 5000]"}, "auto_bushido")
		end)
		if not ok then
			warn(result, ": auto_bushido")
		end
	end
end

function tbl5.auto_lordsaber()
	while _G.Settings.auto_lordsaber and task.wait() do
		local ok, result = pcall(function()
			if not tbl4.find({"Lord of Saber [Lv. 8500]"}) then
				return
			end
			tbl4.attack({"Lord of Saber [Lv. 8500]"}, "auto_lordsaber")
		end)
		if not ok then
			warn(result, ": auto_lordsaber")
		end
	end
end

function tbl5.auto_jacko()
	while _G.Settings.auto_jacko and task.wait() do
		local ok, result = pcall(function()
			if tbl4.find({"Jack o lantern [Lv. 10000]"}) then
				tbl4.attack({"Jack o lantern [Lv. 10000]"}, "auto_jacko")
			else
				local v1 =
					(getPlayerMaterial("Candy") > 50 and _G.Settings.auto_jacko and true or false)
						and workspace.AllNPC:FindFirstChild("SummonJackolantern")

				if not v1 then
					return
				end

				toQuest(v1.CFrame, "SummonJackolantern")
			end
		end)
		if not ok then
			warn(result, ": auto_jacko")
		end
	end
end

function tbl5.auto_skull()
	while _G.Settings.auto_skull and task.wait() do
		local ok, result = pcall(function()
			if not tbl4.find({"Skull King"}) then
				return
			end
			tbl4.attack({"Skull King"}, "auto_skull")
		end)
		if not ok then
			warn(result, ": auto_skull")
		end
	end
end

function tbl5.auto_farm_candy()
	while _G.Settings.auto_farm_candy and task.wait() do
		local ok, result = pcall(function()
			if Sea1 then
				if not tbl4.find({"Zombie [Lv. 1500]"}) then
					return
				end
				tbl4.attack({"Zombie [Lv. 1500]"}, "auto_farm_candy")
			elseif Sea2 then
				if tbl4.find({"Elite Skeleton [Lv. 3100]"}) then
					tbl4.attack({"Elite Skeleton [Lv. 3100]"}, "auto_farm_candy")
				elseif tbl4.find({"Skull Pirate [Lv. 3050]"}) then
					tbl4.attack({"Skull Pirate [Lv. 3050]"}, "auto_farm_candy")
				else
					tp(
						{
							Target = CFrame.new(-5996.76953125, 462.4600524902344, 7296.43115234375)
								* CFrame.new(0, -50, 0)
						}
					)
				end
			else
				if not (Sea3 and tbl4.find({"Wilderness Gorilla [Lv. 4325]"})) then
					return
				end
				tbl4.attack({"Wilderness Gorilla [Lv. 4325]"}, "auto_farm_candy")
			end
		end)
		if not ok then
			warn(result, ": auto_farm_candy")
		end
	end
end

function tbl5.auto_third_event()
	_G.Settings.auto_third_event = _G.Settings.auto_third_event or false

	local tbl = {
		{name = "SeaDragon"},
		{name = "ThirdSeaEldritch Crab"},
		{name = "ThirdSeaDragon"},
		{name = "FuryTentacle"}
	}

	while _G.Settings.auto_third_event and task.wait(1) do
		for _, v1 in ipairs(tbl) do
			if _G.Settings[v1.name] then
				local ok, result = pcall(function()
					tbl4.attack({v1.name}, "auto_third_event")
				end)
				if not ok then
					warn("Error in " .. "auto_third_event" .. ": " .. result)
				end
			end
		end
	end
end

function tbl5.goriila()
	while _G.Settings.goriila and task.wait() do
		local ok, result = pcall(function()
			if not tbl4.find({"Jungle Gorilla [Lv. 4300]"}) then
				return
			end
			tbl4.attack({"Jungle Gorilla [Lv. 4300]"}, "goriila")
		end)
		if not ok then
			warn(result, ": goriila")
		end
	end
end

function tbl5.Auto_Kill_BigMom()
	while _G.Settings.Auto_Kill_BigMom and task.wait() do
		local ok, result = pcall(function()
			if tbl4.find({"Ms. Mother [Lv. 7500]"}) then
				tbl4.attack({"Ms. Mother [Lv. 7500]"}, "Auto_Kill_BigMom")
			else
				tp(CFrame.new(-343, 177, 9087))
			end
		end)
		if not ok then
			warn(result, ": Auto_Kill_BigMom")
		end
	end
end

function tbl5.King_Samurai()
	while _G.Settings.King_Samurai and task.wait() do
		local ok, result = pcall(function()
			if not tbl4.find({"King Samurai [Lv. 3500]"}) then
				return
			end
			tbl4.attack({"King Samurai [Lv. 3500]"}, "King_Samurai")
		end)
		if not ok then
			warn(result, ": King_Samurai")
		end
	end
end

function tbl5.auto_quake()
	while _G.Settings.auto_quake and task.wait() do
		local ok, result = pcall(function()
			if not tbl4.find({"Quake Woman [Lv. 1925]"}) then
				return
			end
			tbl4.attack({"Quake Woman [Lv. 1925]"}, "auto_quake")
		end)
		if not ok then
			warn(result, ": auto_quake")
		end
	end
end

function tbl5.AUTOOBSERVE2()
	while _G.Settings.AUTOOBSERVE2 and task.wait() do
		local ok, result = pcall(function()
			func1("Stranger Uncle", "Stranger Uncle")

			if tbl4.find({"LeePung [Lv. 5000]"}) then
				tbl4.attack({"LeePung [Lv. 5000]"}, "AUTOOBSERVE2")
			else
				func1("Stranger Uncle", "Stranger Uncle")
			end

			func1("Stranger Uncle", "Stranger Uncle")
		end)
		if not ok then
			warn(result, ": AUTOOBSERVE2")
		end
	end
end

local tbl7 = {
	["Jack o lantern [Lv. 10000]"] = "Jack o lantern",
	["King Samurai [Lv. 3500]"] = "King Samurai",
	["Dragon [Lv. 5000]"] = "Dragon",
	["Ms. Mother [Lv. 7500]"] = "Ms. Mother",
	["Lord of Saber [Lv. 8500]"] = "Lord of Saber",
	["Bushido Ape [Lv. 5000]"] = "Bushido Ape"
}

function tbl5.auto_hop_boss()
	while _G.Settings.auto_hop_boss do
		local ok, result = pcall(function()
			local flag = false

			for _, v1 in pairs(_G.Settings.selectbosss or {}) do
				if tbl4.find({v1}) then
					print("Entity found: " .. (tbl7[v1] or v1) .. ". Stopping auto-hop.")
					_G.Settings.auto_hop_boss = false
					flag = true
					break
				end
			end

			if flag then
				return
			end

			print(
				"No selected entities found. Waiting "
					.. _G.Settings.HopDelay .. " seconds before hopping..."
			)
			task.wait(_G.Settings.HopDelay or _G.HopDelay or 5)
			HopServer()
		end)

		if not ok then
			warn(result, ": auto_hop_boss")
		end

		if not _G.Settings.auto_hop_boss then
			return
		end
	end
	print("Auto-hop disabled. Stopping the function.")
end

local tbl8 = {
	FuryTentacle = "Chaos Kraken",
	["ThirdSeaEldritch Crab"] = "Deepsea Crusher",
	ThirdSeaDragon = "Drakenfyr the Inferno King",
	SeaDragon = "Abyssal Tyrant",
	["Skull King"] = "Skull King",
	["Ghost Ship"] = "Ghost Ship",
	HydraSeaKing = "Hydra Sea King",
	SeaKing = "Sea King"
}

function tbl5.auto_hop()
	while wait() do
		if not _G.Settings.auto_hop then
			print("Auto-hop disabled. Stopping the function.")
			break
		end

		local ok, result = pcall(function()
			local flag = false

			for _, v1 in pairs(_G.Settings.SelectedEntities or {}) do
				if tbl4.find({v1}) then
					print("Entity found: " .. (tbl8[v1] or v1) .. ". Stopping auto-hop.")
					_G.Settings.auto_hop = false
					flag = true
					break
				end
			end

			if flag then
				return
			end

			HopServer()
		end)

		if not ok then
			warn(result, ": auto_hop")
		end

		if not _G.Settings.auto_hop then
			return
		end
	end
end

function tbl5.auto_hakiv2()
	while _G.Settings.auto_hakiv2 and task.wait() do
		local ok, result = pcall(function()
			if tbl4.find({"Dark Beard [Lv. 3475]"}) then
				tbl4.attack({"Dark Beard [Lv. 3475]"}, "auto_hakiv2")
			elseif getPlayerMaterial("Dark Beard's Totem") <= 0 then
				if tbl4.find({"Sally [Lv. 3450]"}) then
					tbl4.attack({"Sally [Lv. 3450]"}, "auto_hakiv2")
				else
					func1("Lee", "Lee")
					wait(5)
					func1("Pung", "Pung")
					wait(5)

					if
						getPlayerMaterial("Dark Beard's Totem") <= 0
							and tbl4.find({"Sally [Lv. 3450]"})
					then
						tbl4.attack({"Sally [Lv. 3450]"}, "auto_hakiv2")
					end

					if getPlayerMaterial("Dark Beard's Totem") <= 0 then
						return
					end

					game:GetService("ReplicatedStorage")
						:WaitForChild("Chest")
						:WaitForChild("Remotes")
						:WaitForChild("Functions")
						:WaitForChild("EtcFunction")
						:InvokeServer(
							unpack(
								{
									"QuestSpawnBoss",
									{
										SuccessQuest = "Quest Accepted.",
										BossName = "Dark Beard [Lv. 3475]",
										LevelNeed = 3475,
										QuestName = "Kill 1 Dark Beard",
										MaterialNeed = "Dark Beard's Totem",
										AI_Name = "Dark Beard",
										LevelLow = "You must be Level 3,475 to accept this quest."
									}
								}
							)
						)
				end
			else
				game:GetService("ReplicatedStorage")
					:WaitForChild("Chest")
					:WaitForChild("Remotes")
					:WaitForChild("Functions")
					:WaitForChild("EtcFunction")
					:InvokeServer(
						unpack(
							{
								"QuestSpawnBoss",
								{
									SuccessQuest = "Quest Accepted.",
									BossName = "Dark Beard [Lv. 3475]",
									LevelNeed = 3475,
									QuestName = "Kill 1 Dark Beard",
									MaterialNeed = "Dark Beard's Totem",
									AI_Name = "Dark Beard",
									LevelLow = "You must be Level 3,475 to accept this quest."
								}
							}
						)
					)
			end
		end)
		if not ok then
			warn(result, ": auto_hakiv2")
		end
	end
end

function MaterialMon()
	if SelectMaterial ~= "Rusted Scrap" then
		if SelectMaterial ~= "Iron Ingot" then
			if SelectMaterial ~= "Leather" then
				if SelectMaterial ~= "Angellic's Feather" then
					if SelectMaterial ~= "Carrot" then
						if SelectMaterial ~= "Gun Powder" then
							if SelectMaterial ~= "Fresh Fish" then
								if SelectMaterial ~= "Undead Ooze" then
									if SelectMaterial ~= "Shark Canine" then
										if SelectMaterial ~= "Bread Crumps" then
											if SelectMaterial ~= "Pile of Bones" then
												if SelectMaterial ~= "Thief's Rag" then
													if SelectMaterial ~= "Dragon Orb" then
														if SelectMaterial ~= "Lucidu's Totem" then
															if SelectMaterial ~= "Dark Beard Totem" then
																if SelectMaterial ~= "Magma Crystal" then
																	if SelectMaterial ~= "Ice Crystals" then
																		if SelectMaterial ~= "Samurai Bandage" then
																			if SelectMaterial ~= "Lost Ruby" then
																				if SelectMaterial ~= "Essence of Fire" then
																					if SelectMaterial ~= "Twilight Orb" then
																						if SelectMaterial ~= "Vital Fluid" then
																							if SelectMaterial ~= "Coral and Pearl" then
																								if SelectMaterial ~= "Shark Fin" then
																									if SelectMaterial ~= "Diverse Sphere" then
																										return
																									end
																									MMon = "Gazelle Man [Lv. 2350]"
																								else
																									MMon = "Fishman Guardian [Lv. 4150]"
																								end
																							else
																								MMon = "Fugitive [Lv. 4050]"
																							end
																						else
																							MMon = "Shadow Master [Lv. 1650]"
																						end
																					else
																						MMon = "Shadow Master [Lv. 1600]"
																					end
																				else
																					MMon = "Flame User [Lv. 3200]"
																				end
																			else
																				MMon = "Anubis [Lv. 3150]"
																			end
																		else
																			MMon = "Kitsune Samurai [Lv. 2650]"
																		end
																	else
																		MMon = "Azlan [Lv. 3300]"
																	end
																else
																	MMon = "The Volcano [Lv. 3325]"
																end
															else
																MMon = "Dark Beard Servant [Lv. 3400]"
															end
														else
															MMon = "Vice Admiral [Lv. 3500]"
														end
													else
														MMon = "Elite Skeleton [Lv. 3100]"
													end
												else
													MMon = "Desert Thief [Lv. 3125]"
												end
											else
												MMon = "Skull Pirate [Lv. 3050]"
											end
										else
											MMon = "Chess Soldier [Lv. 3200]"
										end
									else
										MMon = "Seasoned Fishman [Lv. 2200]"
									end
								elseif Sea1 then
									MMon = "Zombie [Lv. 1500]"
								else
									if not Sea2 then
										return
									end
									MMon = "Sally [Lv. 3450]"
								end
							else
								MMon = "Karate Fishman [Lv. 200]"
							end
						elseif Sea1 then
							MMon = "Ball Man [Lv. 850]"
						else
							if not Sea2 then
								return
							end
							MMon = "Lomeo [Lv. 3675]"
						end
					else
						MMon = "Beast Swordman [Lv. 2300]"
					end
				else
					MMon = "Sky Soldier [Lv. 800]"
				end
			elseif Sea1 then
				MMon = "Commander [Lv. 100]"
			else
				if not Sea2 then
					return
				end
				MMon = "Duke [Lv. 2550]"
			end
		else
			MMon = "Beast Pirate [Lv. 2250]"
		end
	elseif Sea1 then
		MMon = "Elite Soldier [Lv. 1000]"
	else
		if not Sea2 then
			return
		end
		MMon = "Beast Swordman [Lv. 2300]"
	end
end

if Sea1 then
	MonsterList = {
		"Soldier [Lv. 1]",
		"Clown Pirate [Lv. 10]",
		"Smoky [Lv. 20]",
		"Tashi [Lv. 30]",
		"Clown Swordman [Lv. 50]",
		"The Clown [Lv. 75]",
		"Commander [Lv. 100]",
		"Captain [Lv. 120]",
		"The Barbaric [Lv. 145]",
		"Fighter Fishman [Lv. 180]",
		"Karate Fishman [Lv. 200]",
		"Shark Man [Lv. 230]",
		"Trainer Chef [Lv. 250]",
		"Dark Leg [Lv. 300]",
		"Dory [Lv. 350]",
		"Snow Soldier [Lv. 400]",
		"King Snow [Lv. 450]",
		"Little Dear [Lv. 500]",
		"Candle Man [Lv. 525]",
		"Bomb Man [Lv. 625]",
		"King of Sand [Lv. 725]",
		"Sky Soldier [Lv. 800]",
		"Ball Man [Lv. 850]",
		"Rumble Man [Lv. 900]",
		"Elite Soldier [Lv. 1000]",
		"Leader [Lv. 1100]",
		"Pasta [Lv. 1150]",
		"Wolf [Lv. 1250]",
		"Giraffe [Lv. 1325]",
		"Leo [Lv. 1400]",
		"Zombie [Lv. 1500]",
		"Shadow Master [Lv. 1600]",
		"New World Pirate [Lv. 1700]",
		"Rear Admiral [Lv. 1800]",
		"True Karate Fishman [Lv. 1850]",
		"Quake Woman [Lv. 1925]",
		"Fishman [Lv. 2000]",
		"Combat Fishman [Lv. 2050]",
		"Sword Fishman [Lv. 2100]",
		"Soldier Fishman [Lv. 2150]",
		"Seasoned Fishman [Lv. 2200]"
	}
elseif Sea2 then
	MonsterList = {
		"Beast Pirate [Lv. 2250]",
		"Beast Swordman [Lv. 2300]",
		"Gazelle Man [Lv. 2350]",
		"Bandit Beast Pirate [Lv. 2400]",
		"Powerful Beast Pirate [Lv. 2450]",
		"Violet Samurai [Lv. 2500]",
		"Duke [Lv. 2550]",
		"Magician [Lv. 2600]",
		"Kitsune Samurai [Lv. 2650]",
		"Elite Beast Pirate [Lv. 2700]",
		"Bear Man [Lv. 2750]",
		"Bean [Lv. 2800]",
		"Meji [Lv. 2850]",
		"Pachy Woman [Lv. 2950]",
		"Kappa [Lv. 2950]",
		"Joey [Lv. 3000]",
		"Skull Pirate [Lv. 3050]",
		"Elite Skeleton [Lv. 3100]",
		"Desert Thief [Lv. 3125]",
		"Anubis [Lv. 3150]",
		"Pharaoh [Lv. 3175]",
		"Flame User [Lv. 3200]",
		"Chess Soldier [Lv. 3200]",
		"Sunken Vessel [Lv. 3225]",
		"Biscuit Man [Lv. 3250]",
		"Azlan [Lv. 3300]",
		"The Volcano [Lv. 3325]",
		"Dark Beard Servant [Lv. 3400]",
		"Supreme Swordman [Lv. 3425]",
		"Sally [Lv. 3450]",
		"Vice Admiral [Lv. 3500]",
		"Pondere [Lv. 3525]",
		"Hefty [Lv. 3550]",
		"Lucidus [Lv. 3575]",
		"Fiore Gladiator [Lv. 3600]",
		"Fiore Fighter [Lv. 3625]",
		"Fiore Pirate [Lv. 3650]",
		"Lomeo [Lv. 3675]",
		"Prince Aria [Lv. 3700]",
		"Devastate [Lv. 3725]",
		"Physicus [Lv. 3750]",
		"Floffy [Lv. 3775]",
		"Dead Troupe [Lv. 3800]",
		"Dead Troupe Captain [Lv. 3850]",
		"Ryu [Lv. 3975]"
	}
elseif Sea3 then
	MonsterList = {"Fugitive [Lv. 4050]", "Fishman Guardian [Lv. 4150]"}
end

local v8 =
	Sea1
		and {
			"Rusted Scrap",
			"Leather",
			"Angellic's Feather",
			"Gun Powder",
			"Fresh Fish",
			"Undead Ooze",
			"Shark Canine"
		}
		or (Sea2
			and {
				"Rusted Scrap",
				"Leather",
				"Iron Ingot",
				"Carrot",
				"Mystic Droplet",
				"Gun Powder",
				"Bread Crumps",
				"Undead Ooze",
				"Pile of Bones",
				"Thief's Rag",
				"Dragon Orb",
				"Lucidu's Totem",
				"Dark Beard Totem",
				"Ice Crystals",
				"Magma Crystal",
				"Samurai Bandage",
				"Lost Ruby",
				"Essence of Fire",
				"Twilight Orb",
				"Vital Fluid",
				"Phoenix Tear",
				"Diverse Sphere"
			}
			or (Sea3 and {"Coral and Pearl", "Shark Fin"} or nil))

local tbl9 = {
	"Gazelle Man [Lv. 2350]",
	"Violet Samurai [Lv. 2500]",
	"Duke [Lv. 2550]",
	"Magician [Lv. 2600]",
	"Kitsune Samurai [Lv. 2650]",
	"Bear Man [Lv. 2750]",
	"Bean [Lv. 2800]",
	"Meji [Lv. 2850]",
	"Petra [Lv. 2900]",
	"Kappa [Lv. 2950]",
	"Joey [Lv. 3000]",
	"Elite Skeleton [Lv. 3100]",
	"Desert Thief [Lv. 3125]",
	"Anubis [Lv. 3150]",
	"Pharaoh [Lv. 3175]",
	"Flame User [Lv. 3200]",
	"Sunken Vessel [Lv. 3225]",
	"Biscuit Man [Lv. 3250]",
	"Dough Master [Lv. 3275]",
	"Supreme Swordman [Lv. 3425]",
	"Sally [Lv. 3450]",
	"Pondere [Lv. 3525]",
	"Hefty [Lv. 3550]",
	"Lomeo [Lv. 3675]",
	"Prince Aria [Lv. 3700]",
	"Devastate [Lv. 3725]",
	"Physicus [Lv. 3750]",
	"Floffy [Lv. 3775]",
	"Ryu [Lv. 3975]"
}

local tbl10 = {
	"Fugitive [Lv. 4050]",
	"The deep one [Lv. 4200]",
	"Fishman King's Guard [Lv. 4250]",
	"Cyborg Gorilla [Lv. 4375]",
	"Ripcurrent Raider [Lv. 4400]",
	"Tidal Warrior [Lv. 4450]",
	"Ocean Gladiator [Lv. 4500]",
	"Electro Abyss Warrior [Lv. 4600]",
	"Inferno Diver [Lv. 4650]",
	"Tempest Tidebreaker [Lv. 4700]",
	"Abyssal Swordman [Lv. 4750]"
}

local v9 = tbl10

if Sea1 then
	v9 = {
		"Smoky [Lv. 20]",
		"Tashi [Lv. 30]",
		"The Clown [Lv. 75]",
		"Captain [Lv. 120]",
		"The Barbaric [Lv. 145]",
		"Karate Fishman [Lv. 200]",
		"Shark Man [Lv. 230]",
		"Dark Leg [Lv. 300]",
		"Dory [Lv. 350]",
		"King Snow [Lv. 450]",
		"Little Dear [Lv. 500]",
		"Candle Man [Lv. 525]",
		"Bomb Man [Lv. 625]",
		"King of Sand [Lv. 725]",
		"Ball Man [Lv. 850]",
		"Rumble Man [Lv. 950]",
		"Leader [Lv. 1100]",
		"Pasta [Lv. 1150]",
		"Wolf [Lv. 1250]",
		"Giraffe [Lv. 1300]",
		"Leo [Lv. 1450]",
		"Shadow Master [Lv. 1650]",
		"True Karate Fishman [Lv. 1850]",
		"Quake Woman [Lv. 1925]",
		"Combat Fishman [Lv. 2050]",
		"Sword Fishman [Lv. 2100]",
		"Seasoned Fishman [Lv. 2200]"
	}
elseif Sea2 then
	v9 = tbl9
elseif not Sea3 then
	v9 = tbl10 or {}
end

local v10, v11, v12 = pairs(game:GetService("Workspace").Areas:GetChildren())
local v13 = v12
local tbl11 = {}

while true do
	local v14, v15 = v10(v11, v13)
	v471 = v15
	v13 = v14

	if v14 == nil then
		break
	end

	if v471.Name ~= "Sea of dust" then
		table.insert(tbl11, v471.Name)
	end
end

function tbl5.autofarmbosses()
	while _G.Settings.autofarmbosses and task.wait() do
		if tbl4.find({selectedBoss}) then
			tbl4.attack({selectedBoss}, "autofarmbosses")
		end
	end
end

function tbl5.AutoFarmMaterial()
	while _G.Settings.AutoFarmMaterial and task.wait() do
		MaterialMon()
		if MMon and tbl4.find({MMon}) then
			tbl4.attack({MMon}, "AutoFarmMaterial")
		end
	end
end

function getSpawn()
	task.spawn(function()
		while task.wait(1) do
			local ok, result = pcall(function()
				local Backpack = game.Players.LocalPlayer.Backpack

				if
					_G.Settings.Select_Weapon == "Melee"
						or (_G.Settings.Select_Weapon == "Sword"
							or _G.Settings.Select_Weapon == "Fruit Power")
				then
					local v1 =
						_G.Settings.Select_Weapon == "Melee" and "Combat"
							or (_G.Settings.Select_Weapon == "Sword" and "Sword" or "Fruit Power")
					for _, child in pairs(Backpack:GetChildren()) do
						if child.ClassName == "Tool" and child.ToolTip == v1 then
							_G.Weapon = tostring(child.Name)
						end
					end
				elseif _G.Settings.Select_Weapon ~= "all In One" then
					_G.Settings.Select_Weapon = "Melee"
				else
					for _, child1 in pairs(Backpack:GetChildren()) do
						if child1.ClassName == "Tool" then
							if child1.ToolTip ~= "Sword" then
								if child1.ToolTip ~= "Combat" then
									if child1.ToolTip == "Fruit Power" then
										myWeapon["Fruit Power"] = tostring(child1.Name)
									end
								else
									myWeapon.Melee = tostring(child1.Name)
								end
							else
								myWeapon.Sword = tostring(child1.Name)
							end
						end
					end
				end

				for _, child2 in pairs(Backpack:GetChildren()) do
					if child2.ClassName == "Tool" and child2.ToolTip == "Fruit Power" then
						myWeapon.Fruit = tostring(child2.Name)
					end
				end
			end)
			if not ok then
				print("Error in getSpawn: ", result)
			end
		end
	end)
end

local PlaceId = game.PlaceId

if PlaceId ~= 4520749081 then
	if PlaceId ~= 6381829480 then
		if PlaceId == 5931540094 then
			Colossuem = true
		end
	else
		Sea2 = true
	end
else
	Sea1 = true
end

game:GetService("Players")
game:GetService("TextService")
game:GetService("TweenService")
game:GetService("UserInputService")
game:GetService("HttpService")
game:GetService("CoreGui")
local LocalPlayer = game:GetService("Players").LocalPlayer
game:GetService("UserInputService")
game:GetService("TweenService")
game:GetService("RunService")
LocalPlayer:GetMouse()
game:GetService("VirtualInputManager")
game:GetService("VirtualUser")
game:GetService("HttpService")
game:GetService("Lighting")
game:GetService("ReplicatedStorage")
game:GetService("TeleportService")
game:GetService("StarterGui")
game:GetService("Players")
local TextService = game:GetService("TextService")
local TweenService = game:GetService("TweenService")
game:GetService("UserInputService")
game:GetService("HttpService")
game:GetService("CoreGui")
local LocalPlayer1 = game:GetService("Players").LocalPlayer
local UserInputService = game:GetService("UserInputService")
game:GetService("TweenService")
game:GetService("RunService")
LocalPlayer1:GetMouse()
game:GetService("VirtualInputManager")
game:GetService("VirtualUser")
game:GetService("HttpService")
game:GetService("Lighting")
game:GetService("ReplicatedStorage")
game:GetService("TeleportService")
game:GetService("StarterGui")
local tbl12 = {Bind = Enum.KeyCode.RightControl}
local UserInputService1 = game:GetService("UserInputService")

local tbl13 = {
	Config = {
		MainColor = Color3.fromRGB(138, 43, 226),
		DropColor = Color3.fromRGB(20, 0, 30),
		["UI Size"] = UDim2.new(0.1, 400, 0.1, 250)
	},
	CoreGui = game:FindFirstChild("CoreGui") or game.Players.LocalPlayer.PlayerGui,
	Windows = {}
}

local v16 = protectgui or (syn and syn.protect_gui or function() end)

local function func7(parent)
	local textButton = Instance.new("TextButton")
	textButton.Size = UDim2.new(1, 0, 1, 0)
	textButton.BackgroundTransparency = 1
	textButton.TextTransparency = 1
	textButton.Text = ""
	textButton.Parent = parent
	textButton.ZIndex = 5000
	return textButton
end

function tbl13:GetTextSize(arg2)
	return
		TextService:GetTextSize(
			arg2.Text,
			arg2.TextSize,
			arg2.Font,
			Vector2.new(math.huge, math.huge)
		)
end

function tbl13:NewWindow(_, arg3, arg4)
	local v1 = arg4 or "0"
	local tbl = {Toggle = Enum.KeyCode.LeftControl, Tabs = {}, TabSelect = 1}
	local screenGui = Instance.new("ScreenGui")
	local frame = Instance.new("Frame")
	local uiCorner = Instance.new("UICorner")
	local imageLabel = Instance.new("ImageLabel")
	local frame1 = Instance.new("Frame")
	local imageLabel1 = Instance.new("ImageLabel")
	local uiCorner1 = Instance.new("UICorner")
	local textLabel = Instance.new("TextLabel")
	local textLabel1 = Instance.new("TextLabel")
	local uiGradient = Instance.new("UIGradient")
	Instance.new("UIGradient")
	local frame2 = Instance.new("Frame")
	local scrollingFrame = Instance.new("ScrollingFrame")
	local uiListLayout = Instance.new("UIListLayout")
	local frame3 = Instance.new("Frame")
	local imageLabel2 = Instance.new("ImageLabel")
	local uiCorner2 = Instance.new("UICorner")
	local uiCorner3 = Instance.new("UICorner")
	local frame4 = Instance.new("Frame")
	local uiCorner4 = Instance.new("UICorner")
	screenGui.Name = "Main"
	screenGui.Parent = tbl13.CoreGui
	screenGui.ResetOnSpawn = false
	screenGui.IgnoreGuiInset = true
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
	v16(screenGui)
	frame.Parent = screenGui
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.BackgroundColor3 = Color3.fromRGB(12, 8, 18)
	frame.BackgroundTransparency = 0
	frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	frame.BorderSizePixel = 0
	frame.Position = UDim2.new(0.5, 0, 0.5, 0)
	frame.Size = UDim2.fromScale(0, 0)
	frame.SizeConstraint = Enum.SizeConstraint.RelativeYY
	frame.ClipsDescendants = true
	TweenService:Create(frame, TweenInfo.new(1.5), {Size = tbl13.Config["UI Size"]}):Play()
	uiCorner.Parent = frame
	imageLabel.Name = "DropShadow"
	imageLabel.Parent = frame
	imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	imageLabel.BackgroundTransparency = 1
	imageLabel.BorderSizePixel = 0
	imageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	imageLabel.Size = UDim2.new(1, 47, 1, 47)
	imageLabel.ZIndex = 0
	imageLabel.Image = "rbxassetid://6015897843"
	imageLabel.ImageColor3 = Color3.fromRGB(0, 0, 0)
	imageLabel.ImageTransparency = 0.5
	imageLabel.ScaleType = Enum.ScaleType.Slice
	imageLabel.SliceCenter = Rect.new(49, 49, 450, 450)
	imageLabel.Rotation = 0.01
	frame1.Name = "Topbar"
	frame1.Parent = frame
	frame1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	frame1.BackgroundTransparency = 1
	frame1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	frame1.BorderSizePixel = 0
	frame1.Size = UDim2.new(1, 0, 0.09, 0)
	frame1.ZIndex = 2
	frame4.Parent = frame
	frame4.AnchorPoint = Vector2.new(0.5, 0.5)
	frame4.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
	frame4.BorderColor3 = Color3.fromRGB(0, 0, 0)
	frame4.BorderSizePixel = 0
	frame4.BackgroundTransparency = 0.5
	frame4.Position = UDim2.new(0.5, 0, 0.1, 0)
	frame4.Size = UDim2.new(0.95, 0, 0.005, 0)
	frame4.ZIndex = 5
	local uiGradient1 = Instance.new("UIGradient")
	uiGradient1.Color = ColorSequence.new(
		{
			ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(221, 160, 221)),
			ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
		}
	)
	uiGradient1.Transparency = NumberSequence.new(
		{
			NumberSequenceKeypoint.new(0, 0.5),
			NumberSequenceKeypoint.new(0.6, 0),
			NumberSequenceKeypoint.new(1, 0.5)
		}
	)
	uiGradient1.Parent = frame4
	uiCorner4.CornerRadius = UDim.new(0, 3)
	uiCorner4.Parent = frame4
	imageLabel1.Name = "HubLogo"
	imageLabel1.Parent = frame1
	imageLabel1.AnchorPoint = Vector2.new(0.5, 0.5)
	imageLabel1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	imageLabel1.BackgroundTransparency = 1
	imageLabel1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	imageLabel1.BorderSizePixel = 0
	imageLabel1.Position = UDim2.new(0.0450000018, 0, 0.6, 0)
	imageLabel1.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
	imageLabel1.SizeConstraint = Enum.SizeConstraint.RelativeYY
	imageLabel1.ZIndex = 3
	imageLabel1.Image = v1
	uiCorner1.Parent = imageLabel1
	textLabel.Name = "TextTitle"
	textLabel.Parent = frame1
	textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	textLabel.BackgroundTransparency = 1
	textLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	textLabel.BorderSizePixel = 0
	textLabel.Position = UDim2.new(0.103366353, 0, 0.2099998972, 0)
	textLabel.Size = UDim2.new(0.896555603, 0, 0.433997005, 0)
	textLabel.ZIndex = 3
	textLabel.Font = Enum.Font.GothamBold
	textLabel.Text = "Akuma <font color='rgb(160,32,240)'>HUB</font>"
	textLabel.RichText = true
	textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	textLabel.TextScaled = true
	textLabel.TextSize = 14
	textLabel.TextWrapped = true
	textLabel.TextXAlignment = Enum.TextXAlignment.Left
	textLabel1.Name = "TextDescription"
	textLabel1.Parent = frame1
	textLabel1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	textLabel1.BackgroundTransparency = 1
	textLabel1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	textLabel1.BorderSizePixel = 0
	textLabel1.Position = UDim2.new(0.103366353, 0, 0.65399694, 0)
	textLabel1.Size = UDim2.new(0, 80, 0.300000012, 0)
	textLabel1.ZIndex = 3
	textLabel1.Font = Enum.Font.GothamBold
	textLabel1.Text = arg3 or "..."
	textLabel1.TextColor3 = Color3.fromRGB(255, 255, 255)
	textLabel1.TextScaled = false
	textLabel1.TextSize = 10
	textLabel1.TextWrapped = true
	textLabel1.TextXAlignment = Enum.TextXAlignment.Left
	game:GetService("TweenService")
	local exit = Instance.new("ImageButton")
	exit.Name = "Exit"
	exit.Parent = frame1
	exit.AnchorPoint = Vector2.new(1, 0)
	exit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	exit.BackgroundTransparency = 1
	exit.BorderSizePixel = 0
	exit.BorderColor3 = Color3.fromRGB(0, 0, 0)
	exit.Position = UDim2.new(1, -8, 0, 10)
	exit.Size = UDim2.new(0, 20, 0, 20)
	exit.Image = "rbxassetid://10747384394"
	local minimize = Instance.new("ImageButton")
	minimize.Name = "Minimize"
	minimize.Parent = frame1
	minimize.AnchorPoint = Vector2.new(1, 0)
	minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	minimize.BackgroundTransparency = 1
	minimize.BorderSizePixel = 0
	minimize.BorderColor3 = Color3.fromRGB(0, 0, 0)
	minimize.Position = UDim2.new(1, -33, 0, 10)
	minimize.Size = UDim2.new(0, 20, 0, 20)
	minimize.Image = "rbxassetid://10734896206"
	minimize.MouseButton1Click:Connect(function()
		frame.Visible = not frame.Visible
	end)
	exit.MouseButton1Click:Connect(function()
		pcall(function()
			screenGui:Destroy()
		end)
		pcall(function()
			frame:Destroy()
		end)
	end);
	(function()
		local TextSize = tbl13:GetTextSize(textLabel1)
		TweenService:Create(
			textLabel1,
			TweenInfo.new(0.5),
			{Size = UDim2.new(0, TextSize.X, 0.3, 0)}
		)
			:Play()
	end)()
	uiGradient.Color = ColorSequence.new(
		{
			ColorSequenceKeypoint.new(0, tbl13.Config.MainColor),
			ColorSequenceKeypoint.new(1, tbl13.Config.DropColor)
		}
	)
	uiGradient.Parent = textLabel1
	frame2.Name = "MenuFrames"
	frame2.Parent = frame
	frame2.AnchorPoint = Vector2.new(0.5, 0)
	frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	frame2.BackgroundTransparency = 1
	frame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	frame2.BorderSizePixel = 0
	frame2.Position = UDim2.new(0.5, 0, 0.075000003, 0)
	frame2.Size = UDim2.new(0.949999988, 0, 0.0799999982, 0)
	frame2.ZIndex = 2
	scrollingFrame.Name = "MenuScroll"
	scrollingFrame.Parent = frame2
	scrollingFrame.Active = true
	scrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	scrollingFrame.BackgroundTransparency = 1
	scrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	scrollingFrame.BorderSizePixel = 0
	scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
	scrollingFrame.ZIndex = 3
	scrollingFrame.CanvasSize = UDim2.new(2, 0, 0, 0)
	scrollingFrame.ScrollBarThickness = 0
	scrollingFrame.TopImage = ""
	task.spawn(function()
		local UIListLayout = scrollingFrame:WaitForChild("UIListLayout", 9999999)
		scrollingFrame.CanvasSize = UDim2.new(0, UIListLayout.AbsoluteContentSize.X + 1, 0, 0)
		UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize")
			:Connect(function()
				scrollingFrame.CanvasSize = UDim2.new(
					0,
					UIListLayout.AbsoluteContentSize.X + 1,
					0,
					0
				)
			end)
	end)
	uiListLayout.Parent = scrollingFrame
	uiListLayout.FillDirection = Enum.FillDirection.Horizontal
	uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	uiListLayout.Padding = UDim.new(0, 8)
	frame3.Name = "CloseUI"
	frame3.Parent = frame
	frame3.AnchorPoint = Vector2.new(0.5, 0.5)
	frame3.BackgroundColor3 = Color3.fromRGB(12, 8, 18)
	frame3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	frame3.BorderSizePixel = 0
	frame3.Position = UDim2.new(0.5, 0, 0.5, 0)
	frame3.Visible = false
	frame3.ZIndex = 45
	frame3.Size = UDim2.fromScale(1, 1)
	TweenService:Create(
		frame3,
		TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
		{Size = UDim2.fromScale(0, 0)}
	)
		:Play()
	imageLabel2.Name = "HubLogo"
	imageLabel2.Parent = frame3
	imageLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
	imageLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	imageLabel2.BackgroundTransparency = 1
	imageLabel2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	imageLabel2.BorderSizePixel = 0
	imageLabel2.Position = UDim2.new(0.5, 0, 0.5, 0)
	imageLabel2.Size = UDim2.new(0.25, 0, 0.25, 0)
	imageLabel2.SizeConstraint = Enum.SizeConstraint.RelativeYY
	imageLabel2.ZIndex = 55
	imageLabel2.Image = v1
	uiCorner2.Parent = imageLabel2
	uiCorner3.Parent = frame3
	local uiStroke = Instance.new("UIStroke")
	uiStroke.Color = Color3.fromRGB(37, 37, 37)
	uiStroke.Parent = frame3
	local flag1
	local Position
	local Position1
	local flag = true
	frame:GetPropertyChangedSignal("Size")
		:Connect(function()
			if frame.Size.X.Scale > 0 then
				frame.Visible = true
			else
				frame.Visible = false
			end
		end)
	frame3:GetPropertyChangedSignal("Size")
		:Connect(function()
			if frame3.Size.X.Scale > 0 then
				frame3.Visible = true
			else
				frame3.Visible = false
			end
		end)

	local function func(arg1)
		if arg1 then
			TweenService:Create(frame, TweenInfo.new(0.5), {Size = tbl13.Config["UI Size"]}):Play()
			TweenService:Create(
				frame3,
				TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
				{Size = UDim2.fromScale(0, 0)}
			)
				:Play()
		else
			TweenService:Create(
				frame,
				TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
				{Size = UDim2.fromScale(0, 0)}
			)
				:Play()
			TweenService:Create(frame3, TweenInfo.new(0.5), {Size = UDim2.fromScale(1, 1)}):Play()
		end
	end

	task.spawn(function()
		local screenGui = Instance.new("ScreenGui")
		local frame = Instance.new("Frame")
		local uiCorner = Instance.new("UICorner")
		local uiStroke = Instance.new("UIStroke")
		local imageLabel = Instance.new("ImageLabel")
		local imageLabel1 = Instance.new("ImageLabel")
		screenGui.Name = "Toggle"
		screenGui.Parent = tbl13.CoreGui or game.Players.LocalPlayer:WaitForChild("PlayerGui")
		screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
		frame.Name = "c4"
		frame.Parent = screenGui
		frame.AnchorPoint = Vector2.new(0.5, 0.5)
		frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		frame.BorderSizePixel = 0
		frame.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
		frame.Size = UDim2.new(0, 65, 0, 65)
		frame.SizeConstraint = Enum.SizeConstraint.RelativeYY
		frame.ZIndex = 67
		uiCorner.Parent = frame
		uiStroke.Color = Color3.fromRGB(138, 43, 226)
		uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uiStroke.Parent = frame
		imageLabel.Name = "logo"
		imageLabel.Parent = frame
		imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		imageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		imageLabel.BackgroundTransparency = 1.01
		imageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		imageLabel.BorderSizePixel = 0
		imageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
		imageLabel.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
		imageLabel.ZIndex = 68
		imageLabel.Image = v1
		imageLabel1.Name = "DropShadow"
		imageLabel1.Parent = frame
		imageLabel1.AnchorPoint = Vector2.new(0.5, 0.5)
		imageLabel1.BackgroundTransparency = 1
		imageLabel1.BorderSizePixel = 0
		imageLabel1.Position = UDim2.new(0.5, 0, 0.5, 0)
		imageLabel1.Size = UDim2.new(1, 47, 1, 47)
		imageLabel1.ZIndex = 66
		imageLabel1.Image = "rbxassetid://6015897843"
		imageLabel1.ImageColor3 = Color3.fromRGB(0, 0, 0)
		imageLabel1.ImageTransparency = 0.5
		imageLabel1.ScaleType = Enum.ScaleType.Slice
		imageLabel1.SliceCenter = Rect.new(49, 49, 450, 450)
		local flag1 = false
		local Position1
		local Position2
		local Position = frame.Position

		local function func1(arg1)
			local v1 = arg1.Position - Position1
			local uDim2 = UDim2.new(
				Position2.X.Scale,
				Position2.X.Offset + v1.X,
				Position2.Y.Scale,
				Position2.Y.Offset + v1.Y
			)
			game:GetService("TweenService")
				:Create(frame, TweenInfo.new(0.1), {Position = uDim2})
				:Play()
		end

		local v2 = func7(frame)
		v2.ZIndex = 68
		v2.MouseButton1Click:Connect(function()
			if Position ~= frame.Position then
				return
			end

			flag = not flag
			func(flag)
		end)
		v2.InputBegan:Connect(function(input)
			if
				input.UserInputType ~= Enum.UserInputType.MouseButton1
					and input.UserInputType ~= Enum.UserInputType.Touch
			then
				return
			end

			flag1 = true
			Position1 = input.Position
			Position2 = frame.Position
			Position = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState ~= Enum.UserInputState.End then
					return
				end
				flag1 = false
			end)
		end)
		UserInputService1.InputChanged:Connect(function(input)
			if
				not ((input.UserInputType == Enum.UserInputType.MouseMovement
					or input.UserInputType == Enum.UserInputType.Touch)
					and flag1)
			then
				return
			end
			func1(input)
		end)
	end)
	UserInputService.InputBegan:Connect(function(input, _)
		if input.KeyCode ~= tbl12.Bind then
			return
		end
		if uitoggled ~= false then
			local uDim2 = UDim2.new(0.100000001, 410, 0.100000001, 240)
			frame:TweenSize(uDim2, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 1, true)
			screenGui.Enabled = true
			uitoggled = false
		else
			local uDim21 = UDim2.new(0, 0, 0, 0)
			frame:TweenSize(uDim21, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 1, true)
			uitoggled = true
			task.wait(0.5)
			screenGui.Enabled = false
		end
	end)

	local function func1(arg1)
		local v1 = arg1.Position - Position
		local uDim2 = UDim2.new(
			Position1.X.Scale,
			Position1.X.Offset + v1.X,
			Position1.Y.Scale,
			Position1.Y.Offset + v1.Y
		)
		game:GetService("TweenService"):Create(frame, TweenInfo.new(0.1), {Position = uDim2}):Play()
	end

	frame1.InputBegan:Connect(function(input)
		if
			input.UserInputType ~= Enum.UserInputType.MouseButton1
				and input.UserInputType ~= Enum.UserInputType.Touch
		then
			return
		end

		flag1 = true
		Position = input.Position
		Position1 = frame.Position
		input.Changed:Connect(function()
			if input.UserInputState ~= Enum.UserInputState.End then
				return
			end
			flag1 = false
		end)
	end)
	UserInputService1.InputChanged:Connect(function(input)
		if
			not ((input.UserInputType == Enum.UserInputType.MouseMovement
				or input.UserInputType == Enum.UserInputType.Touch)
				and flag1)
		then
			return
		end
		func1(input)
	end)
	UserInputService1.InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then
			return
		end

		if input.KeyCode ~= tbl.Toggle then
			return
		end

		flag = not flag
		func(flag)
	end)

	function tbl:AddMenu(arg2, arg3, image, arg5)
		local v1 = arg5 or "tab"
		local tbl1 = {Checker = {}}
		local frame1 = Instance.new("Frame")
		local uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
		local uiCorner = Instance.new("UICorner")
		local imageLabel = Instance.new("ImageLabel")
		local textLabel = Instance.new("TextLabel")
		local textLabel1 = Instance.new("TextLabel")
		local textButton = Instance.new("TextButton")
		frame1.Name = "MenuButton"
		frame1.Parent = scrollingFrame
		frame1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		frame1.BackgroundTransparency = 1
		frame1.BorderColor3 = Color3.fromRGB(0, 0, 0)
		frame1.BorderSizePixel = 0
		frame1.ClipsDescendants = false
		frame1.Size = UDim2.new(0.5, 0, 0.75, 0)
		frame1.ZIndex = 4
		uiAspectRatioConstraint.Parent = frame1
		uiAspectRatioConstraint.AspectRatio = 0.1
		uiAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
		uiAspectRatioConstraint.DominantAxis = Enum.DominantAxis.Height
		local new = TweenInfo.new
		local v2 = 0.3 + #tbl.Tabs / 10
		TweenService:Create(
			uiAspectRatioConstraint,
			new(v2, Enum.EasingStyle.Back),
			{AspectRatio = 4}
		)
			:Play()
		uiCorner.CornerRadius = UDim.new(0, 3)
		uiCorner.Parent = frame1
		imageLabel.Name = "MenuLogo"
		imageLabel.Parent = frame1
		imageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		imageLabel.BackgroundTransparency = 1
		imageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		imageLabel.BorderSizePixel = 0
		imageLabel.Size = UDim2.new(1, 0, 1, 0)
		imageLabel.SizeConstraint = Enum.SizeConstraint.RelativeYY
		imageLabel.ZIndex = 5
		imageLabel.Image = image
		textLabel.Name = "MenuText"
		textLabel.Parent = frame1
		textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		textLabel.BackgroundTransparency = 1
		textLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		textLabel.BorderSizePixel = 0
		textLabel.Position = UDim2.new(0.010877919, 0, 0.5, 0)
		textLabel.Size = UDim2.new(2.10955262, 0, 0.5, 0)
		textLabel.ZIndex = 5
		textLabel.Font = Enum.Font.GothamBold
		textLabel.Text = arg2 or "Menu"
		textLabel.TextColor3 = Color3.fromRGB(100, 100, 15)
		textLabel.TextTransparency = 0.8
		textLabel.TextScaled = true
		textLabel.TextSize = 14
		textLabel.TextWrapped = true
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel1.Name = "MenuDesc"
		textLabel1.Parent = frame1
		textLabel1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		textLabel1.BackgroundTransparency = 1
		textLabel1.BorderColor3 = Color3.fromRGB(0, 0, 0)
		textLabel1.BorderSizePixel = 0
		textLabel1.Position = UDim2.new(0.11100589, 0, 0.600000083, 0)
		textLabel1.Size = UDim2.new(2.10955262, 0, 0.349999547, 0)
		textLabel1.ZIndex = 5
		textLabel1.Font = Enum.Font.GothamBold
		textLabel1.Text = arg3 or "Description"
		textLabel1.TextColor3 = Color3.fromRGB(255, 255, 255)
		textLabel1.TextScaled = true
		textLabel1.TextSize = 14
		textLabel1.TextTransparency = 0.8
		textLabel1.TextWrapped = true
		textLabel1.TextXAlignment = Enum.TextXAlignment.Left
		textButton.Name = "Button"
		textButton.Parent = frame1
		textButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		textButton.BackgroundTransparency = 1
		textButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		textButton.BorderSizePixel = 0
		textButton.Size = UDim2.new(1, 0, 1, 0)
		textButton.ZIndex = 25
		textButton.Font = Enum.Font.SourceSans
		textButton.Text = ""
		textButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		textButton.TextSize = 14
		textButton.TextTransparency = 1
		local frame2

		if v1:find("tab") then
			frame2 = Instance.new("Frame")
			local frame3 = Instance.new("Frame")
			local frame4 = Instance.new("Frame")
			local uiCorner1 = Instance.new("UICorner")
			local uiStroke = Instance.new("UIStroke")
			local textLabel2 = Instance.new("TextLabel")
			local imageLabel1 = Instance.new("ImageLabel")
			local uiCorner2 = Instance.new("UICorner")
			local textBox = Instance.new("TextBox")
			local frame5 = Instance.new("Frame")
			local frame6 = Instance.new("Frame")
			local scrollingFrame1 = Instance.new("ScrollingFrame")
			local uiListLayout = Instance.new("UIListLayout")
			local frame7 = Instance.new("Frame")
			frame2.Name = "PageFrames"
			frame2.Parent = frame
			frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			frame2.BackgroundTransparency = 1
			frame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			frame2.BorderSizePixel = 0
			frame2.ClipsDescendants = true
			frame2.Position = UDim2.new(0, 0, 0.163185388, 0)
			frame2.Size = UDim2.new(1, 0, 0.836814642, 0)
			frame2.ZIndex = 4
			frame3.Name = "Search"
			frame3.Parent = frame2
			frame3.AnchorPoint = Vector2.new(0.5, 0.5)
			frame3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			frame3.BackgroundTransparency = 1
			frame3.BorderColor3 = Color3.fromRGB(0, 0, 0)
			frame3.BorderSizePixel = 0
			frame3.ClipsDescendants = true
			frame3.Position = UDim2.new(0.187006071, 0, 0.5, 0)
			frame3.Size = UDim2.new(0.354012221, 0, 0.980000138, 0)
			frame3.ZIndex = 4
			frame4.Name = "SearchEngine"
			frame4.Parent = frame3
			frame4.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			frame4.BorderColor3 = Color3.fromRGB(0, 0, 0)
			frame4.BorderSizePixel = 0
			frame4.ClipsDescendants = true
			frame4.Size = UDim2.new(1, 0, 0.0680000037, 0)
			frame4.ZIndex = 6
			uiCorner1.CornerRadius = UDim.new(0, 2)
			uiCorner1.Parent = frame4
			uiStroke.Thickness = 0.5
			uiStroke.Color = Color3.fromRGB(39, 39, 39)
			uiStroke.Parent = frame4
			textLabel2.Name = "LabelText"
			textLabel2.Parent = frame4
			textLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
			textLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			textLabel2.BackgroundTransparency = 1
			textLabel2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			textLabel2.BorderSizePixel = 0
			textLabel2.Position = UDim2.new(0.612374663, 0, 0.499999851, 0)
			textLabel2.Size = UDim2.new(0.871346772, 0, 0.50000006, 0)
			textLabel2.ZIndex = 6
			textLabel2.Font = Enum.Font.GothamBold
			textLabel2.Text = "Search"
			textLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
			textLabel2.TextScaled = true
			textLabel2.TextSize = 14
			textLabel2.TextTransparency = 0.75
			textLabel2.TextWrapped = true
			textLabel2.TextXAlignment = Enum.TextXAlignment.Left
			imageLabel1.Name = "SearchIcon"
			imageLabel1.Parent = frame4
			imageLabel1.AnchorPoint = Vector2.new(0.5, 0.5)
			imageLabel1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			imageLabel1.BackgroundTransparency = 1
			imageLabel1.BorderColor3 = Color3.fromRGB(0, 0, 0)
			imageLabel1.BorderSizePixel = 0
			imageLabel1.Position = UDim2.new(0.075000003, 0, 0.5, 0)
			imageLabel1.Size = UDim2.new(0.699999988, 0, 0.699999988, 0)
			imageLabel1.SizeConstraint = Enum.SizeConstraint.RelativeYY
			imageLabel1.ZIndex = 6
			imageLabel1.Image = "rbxassetid://7734052925"
			imageLabel1.ImageTransparency = 0.75
			uiCorner2.CornerRadius = UDim.new(0, 6)
			uiCorner2.Parent = imageLabel1
			textBox.Name = "searchbox"
			textBox.Parent = frame4
			textBox.AnchorPoint = Vector2.new(0.5, 0.5)
			textBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			textBox.BackgroundTransparency = 1
			textBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
			textBox.BorderSizePixel = 0
			textBox.Position = UDim2.new(1.46321285, 0, 0.499999851, 0)
			textBox.Size = UDim2.new(2.66615963, 0, 0.50000006, 0)
			textBox.ZIndex = 7
			textBox.ClearTextOnFocus = false
			textBox.Font = Enum.Font.GothamBold
			textBox.Text = ""
			textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
			textBox.TextScaled = true
			textBox.TextSize = 14
			textBox.TextWrapped = true
			textBox.TextXAlignment = Enum.TextXAlignment.Left
			frame5.Parent = frame3
			frame5.Active = true
			frame5.AnchorPoint = Vector2.new(0, 0.5)
			frame5.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
			frame5.BorderColor3 = Color3.fromRGB(0, 0, 0)
			frame5.BorderSizePixel = 0
			frame5.Position = UDim2.new(1.01999998, 0, 0.5, 0)
			frame5.Rotation = 0
			frame5.Size = UDim2.new(0.00499999989, 0, 1, 0)
			frame5.ZIndex = 3
			frame6.Parent = frame5
			frame6.Active = true
			frame6.AnchorPoint = Vector2.new(0, 0.5)
			frame6.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
			frame6.BorderColor3 = Color3.fromRGB(0, 0, 0)
			frame6.BorderSizePixel = 0
			frame6.Position = UDim2.new(1.00999999, 0, 0.5, 0)
			frame6.Size = UDim2.new(1, 0, 1, 0)
			frame6.ZIndex = 3
			scrollingFrame1.Name = "TabFrames"
			scrollingFrame1.Parent = frame3
			scrollingFrame1.Active = true
			scrollingFrame1.AnchorPoint = Vector2.new(0.5, 0.5)
			scrollingFrame1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			scrollingFrame1.BackgroundTransparency = 1
			scrollingFrame1.BorderColor3 = Color3.fromRGB(0, 0, 0)
			scrollingFrame1.BorderSizePixel = 0
			scrollingFrame1.ClipsDescendants = false
			scrollingFrame1.Position = UDim2.new(0.500000119, 0, 0.549316823, 0)
			scrollingFrame1.Size = UDim2.new(0.949999988, 0, 0.901000023, 0)
			scrollingFrame1.ZIndex = 6
			scrollingFrame1.ScrollBarThickness = 0
			task.spawn(function()
				local UIListLayout = scrollingFrame1:WaitForChild("UIListLayout", 9999999)
				scrollingFrame1.CanvasSize = UDim2.new(
					0,
					0,
					0,
					UIListLayout.AbsoluteContentSize.Y + 1
				)
				UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize")
					:Connect(function()
						scrollingFrame1.CanvasSize = UDim2.new(
							0,
							0,
							0,
							UIListLayout.AbsoluteContentSize.Y + 1
						)
					end)
			end)
			uiListLayout.Parent = scrollingFrame1
			uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			uiListLayout.Padding = UDim.new(0, 4)
			frame7.Name = "Main"
			frame7.Parent = frame2
			frame7.AnchorPoint = Vector2.new(0.5, 0.5)
			frame7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			frame7.BackgroundTransparency = 1
			frame7.BorderColor3 = Color3.fromRGB(0, 0, 0)
			frame7.BorderSizePixel = 0
			frame7.ClipsDescendants = true
			frame7.Position = UDim2.new(0.685165405, 0, 0.5, 0)
			frame7.Size = UDim2.new(0.609669089, 0, 0.980000019, 0)
			frame7.ZIndex = 4
			textBox.Focused:Connect(function()
				TweenService:Create(textLabel2, TweenInfo.new(0.1), {TextTransparency = 1}):Play()
				TweenService:Create(imageLabel1, TweenInfo.new(0.1), {ImageTransparency = 1}):Play()
			end)
			textBox.FocusLost:Connect(function()
				if #textBox.Text <= 0 then
					TweenService:Create(textLabel2, TweenInfo.new(0.1), {TextTransparency = 0.75})
						:Play()
					TweenService:Create(imageLabel1, TweenInfo.new(0.1), {ImageTransparency = 0.75})
						:Play()

					for _, child in ipairs(scrollingFrame1:GetChildren()) do
						if child:IsA("Frame") then
							child.Visible = true
						end
					end
				else
					for _, child1 in ipairs(scrollingFrame1:GetChildren()) do
						if child1:IsA("Frame") then
							if child1.Name:lower():find(textBox.Text:lower()) then
								child1.Visible = true
							else
								child1.Visible = false
							end
						end
					end
				end
			end)
			textBox:GetPropertyChangedSignal("Text")
				:Connect(function()
					if #textBox.Text <= 0 then
						TweenService:Create(
							textLabel2,
							TweenInfo.new(0.1),
							{TextTransparency = 0.75}
						)
							:Play()
						TweenService:Create(
							imageLabel1,
							TweenInfo.new(0.1),
							{ImageTransparency = 0.75}
						)
							:Play()

						for _, child in ipairs(scrollingFrame1:GetChildren()) do
							if child:IsA("Frame") then
								child.Visible = true
							end
						end
					else
						TweenService:Create(textLabel2, TweenInfo.new(0.1), {TextTransparency = 1})
							:Play()
						TweenService:Create(
							imageLabel1,
							TweenInfo.new(0.1),
							{ImageTransparency = 1}
						)
							:Play()

						for _, child1 in ipairs(scrollingFrame1:GetChildren()) do
							if child1:IsA("Frame") then
								if child1.Name:lower():find(textBox.Text:lower()) then
									child1.Visible = true
								else
									child1.Visible = false
								end
							end
						end
					end
				end)
		elseif v1:find("change") then
			frame2 = Instance.new("Frame")
			local frame8 = Instance.new("Frame")
			local scrollingFrame2 = Instance.new("ScrollingFrame")
			local uiListLayout1 = Instance.new("UIListLayout")
			local frame9 = Instance.new("Frame")
			local uiCorner3 = Instance.new("UICorner")
			task.spawn(function()
				local UIListLayout = scrollingFrame2:WaitForChild("UIListLayout", 9999999)
				scrollingFrame2.CanvasSize = UDim2.new(
					0,
					0,
					0,
					UIListLayout.AbsoluteContentSize.Y + 1
				)
				UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize")
					:Connect(function()
						scrollingFrame2.CanvasSize = UDim2.new(
							0,
							0,
							0,
							UIListLayout.AbsoluteContentSize.Y + 1
						)
					end)
			end)
			frame2.Name = "ChangeLog"
			frame2.Parent = frame
			frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			frame2.BackgroundTransparency = 1
			frame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			frame2.BorderSizePixel = 0
			frame2.Position = UDim2.new(0, 0, 0.163185388, 0)
			frame2.Size = UDim2.new(1, 0, 0.836814642, 0)
			frame2.Visible = true
			frame2.ZIndex = 4
			frame8.Name = "Main"
			frame8.Parent = frame2
			frame8.AnchorPoint = Vector2.new(0.5, 0.5)
			frame8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			frame8.BackgroundTransparency = 1
			frame8.BorderColor3 = Color3.fromRGB(0, 0, 0)
			frame8.BorderSizePixel = 0
			frame8.ClipsDescendants = true
			frame8.Position = UDim2.new(0.5, 0, 0.5, 0)
			frame8.Size = UDim2.new(0.949999988, 0, 0.949999988, 0)
			frame8.ZIndex = 4
			scrollingFrame2.Name = "MainScrolling"
			scrollingFrame2.Parent = frame8
			scrollingFrame2.Active = true
			scrollingFrame2.AnchorPoint = Vector2.new(0.5, 0.5)
			scrollingFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			scrollingFrame2.BackgroundTransparency = 1
			scrollingFrame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			scrollingFrame2.BorderSizePixel = 0
			scrollingFrame2.ClipsDescendants = false
			scrollingFrame2.Position = UDim2.new(0.5, 0, 0.5, 0)
			scrollingFrame2.Size = UDim2.new(0.99000001, 0, 1, 0)
			scrollingFrame2.ZIndex = 2
			scrollingFrame2.ScrollBarThickness = 0
			uiListLayout1.Parent = scrollingFrame2
			uiListLayout1.HorizontalAlignment = Enum.HorizontalAlignment.Center
			uiListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
			uiListLayout1.Padding = UDim.new(0, 5)
			frame9.Parent = frame2
			frame9.AnchorPoint = Vector2.new(0.5, 1)
			frame9.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
			frame9.BorderColor3 = Color3.fromRGB(0, 0, 0)
			frame9.BorderSizePixel = 0
			frame9.Position = UDim2.new(0.5, 0, 0, 0)
			frame9.Size = UDim2.new(0.949999988, 0, 0.00499999989, 0)
			uiCorner3.CornerRadius = UDim.new(0.5, 0)
			uiCorner3.Parent = frame9
		end

		local v3 = #tbl.Tabs + 1

		local function func(arg1)
			if arg1 then
				TweenService:Create(
					frame2,
					TweenInfo.new(0.3),
					{Position = UDim2.fromScale(0, 0.163)}
				)
					:Play()
				TweenService:Create(
					textLabel,
					TweenInfo.new(0.1 + v3 / 10),
					{TextColor3 = Color3.fromRGB(255, 255, 255), TextTransparency = 0.8}
				)
					:Play()
			else
				if v3 >= tbl.TabSelect then
					TweenService:Create(
						frame2,
						TweenInfo.new(0.3),
						{Position = UDim2.fromScale(1, 0.163)}
					)
						:Play()
				else
					TweenService:Create(
						frame2,
						TweenInfo.new(0.3),
						{Position = UDim2.fromScale(-1, 0.163)}
					)
						:Play()
				end
				TweenService:Create(
					textLabel,
					TweenInfo.new(0.1),
					{TextColor3 = Color3.fromRGB(255, 255, 255), TextTransparency = 0.25}
				)
					:Play()
			end
		end

		if tbl.Tabs[1] then
			func(false)
		else
			func(true)
		end

		table.insert(tbl.Tabs, {frame1, func})
		v3 = #tbl.Tabs
		textButton.MouseButton1Click:Connect(function()
			tbl.TabSelect = v3
			for i, tab in ipairs(tbl.Tabs) do
				if tab[1] ~= frame1 then
					tab[2](false)
				else
					tbl.TabSelect = i
					tab[2](true)
				end
			end
		end)

		function tbl1:AddTab(arg2, arg3, arg4)
			local tbl = {}
			local scrollingFrame

			if v1:find("tab") then
				scrollingFrame = Instance.new("ScrollingFrame")
				local uiListLayout = Instance.new("UIListLayout")
				local scrollingFrameRef = scrollingFrame
				task.spawn(function()
					local UIListLayout = scrollingFrameRef:WaitForChild("UIListLayout", 9999999)
					scrollingFrameRef.CanvasSize = UDim2.new(
						0,
						0,
						0,
						UIListLayout.AbsoluteContentSize.Y + 1
					)
					UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize")
						:Connect(function()
							scrollingFrameRef.CanvasSize = UDim2.new(
								0,
								0,
								0,
								UIListLayout.AbsoluteContentSize.Y + 1
							)
						end)
				end)
				scrollingFrame.Name = tostring(arg2 or "Main")
				scrollingFrame.Name = "MainScrolling"
				scrollingFrame.Parent = frame2:WaitForChild("Main")
				scrollingFrame.Active = true
				scrollingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				scrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				scrollingFrame.BackgroundTransparency = 1
				scrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				scrollingFrame.BorderSizePixel = 0
				scrollingFrame.ClipsDescendants = false
				scrollingFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
				scrollingFrame.Size = UDim2.new(0.99500001, 0, 1, 0)
				scrollingFrame.ZIndex = 2
				scrollingFrame.ScrollBarThickness = 0
				uiListLayout.Parent = scrollingFrame
				uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
				uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				uiListLayout.Padding = UDim.new(0, 1.5)
				local frame = Instance.new("Frame")
				local uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				local uiCorner = Instance.new("UICorner")
				local uiStroke = Instance.new("UIStroke")
				local uiGradient = Instance.new("UIGradient")
				local imageLabel = Instance.new("ImageLabel")
				local textLabel = Instance.new("TextLabel")
				local textLabel1 = Instance.new("TextLabel")
				local textButton1 = Instance.new("TextButton")
				frame.Name = tostring(arg2 or "Main")
				frame.Parent = frame2:WaitForChild("Search"):WaitForChild("TabFrames")
				frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
				frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				frame.BorderSizePixel = 0
				frame.Size = UDim2.new(1, 0, 1, 0)
				frame.ZIndex = 5
				uiAspectRatioConstraint.Parent = frame
				uiAspectRatioConstraint.AspectRatio = 4.25
				uiAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
				uiCorner.CornerRadius = UDim.new(0, 3)
				uiCorner.Parent = frame
				uiStroke.Transparency = 0.25
				uiStroke.Color = Color3.fromRGB(128, 0, 128)
				uiStroke.Parent = frame
				uiGradient.Transparency = NumberSequence.new(
					{
						NumberSequenceKeypoint.new(0, 0.5),
						NumberSequenceKeypoint.new(0.2, 0),
						NumberSequenceKeypoint.new(0.8, 0),
						NumberSequenceKeypoint.new(1, 0.5)
					}
				)
				uiGradient.Parent = uiStroke
				imageLabel.Name = "TabIcon"
				imageLabel.Parent = frame
				imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
				imageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				imageLabel.BackgroundTransparency = 1
				imageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				imageLabel.BorderSizePixel = 0
				imageLabel.Position = UDim2.new(0.135000005, 0, 0.5, 0)
				imageLabel.Size = UDim2.new(0.699999988, 0, 0.699999988, 0)
				imageLabel.SizeConstraint = Enum.SizeConstraint.RelativeYY
				imageLabel.ZIndex = 6
				imageLabel.Image = "rbxassetid://" .. arg3
				textLabel.Name = "Text"
				textLabel.Parent = frame
				textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				textLabel.BackgroundTransparency = 1
				textLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
				textLabel.BorderSizePixel = 0
				textLabel.Position = UDim2.new(0.246999651, 0, 0.200000003, 0)
				textLabel.Size = UDim2.new(0.753000021, 0, 0.400000006, 0)
				textLabel.ZIndex = 7
				textLabel.Font = Enum.Font.GothamBold
				textLabel.Text = arg2 or "Main"
				textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				textLabel.TextScaled = true
				textLabel.TextSize = 14
				textLabel.TextWrapped = true
				textLabel.TextXAlignment = Enum.TextXAlignment.Left
				textLabel1.Name = "Description"
				textLabel1.Parent = frame
				textLabel1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				textLabel1.BackgroundTransparency = 1
				textLabel1.BorderColor3 = Color3.fromRGB(0, 0, 0)
				textLabel1.BorderSizePixel = 0
				textLabel1.Position = UDim2.new(0.246999651, 0, 0.600000024, 0)
				textLabel1.Size = UDim2.new(0.753000081, 0, 0.25, 0)
				textLabel1.ZIndex = 7
				textLabel1.Font = Enum.Font.GothamBold
				textLabel1.Text = arg4 or "loadstring()()"
				textLabel1.TextColor3 = Color3.fromRGB(255, 255, 255)
				textLabel1.TextScaled = true
				textLabel1.TextSize = 14
				textLabel1.TextTransparency = 0.5
				textLabel1.TextWrapped = true
				textLabel1.TextXAlignment = Enum.TextXAlignment.Left
				textButton1.Name = "Button"
				textButton1.Parent = frame
				textButton1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				textButton1.BackgroundTransparency = 1
				textButton1.BorderColor3 = Color3.fromRGB(0, 0, 0)
				textButton1.BorderSizePixel = 0
				textButton1.Size = UDim2.new(1, 0, 1, 0)
				textButton1.ZIndex = 25
				textButton1.Font = Enum.Font.SourceSans
				textButton1.Text = ""
				textButton1.TextColor3 = Color3.fromRGB(0, 0, 0)
				textButton1.TextSize = 14
				textButton1.TextTransparency = 1

				local function func(arg1)
					UDim2.fromScale(0.9, 0.95)
					if arg1 then
						textLabel.TextColor3 = Color3.fromRGB(128, 0, 128)
						TweenService:Create(
							imageLabel,
							TweenInfo.new(0.15),
							{ImageTransparency = 0}
						)
							:Play()
						TweenService:Create(
							textLabel1,
							TweenInfo.new(0.15),
							{TextTransparency = 0.5}
						)
							:Play()
						TweenService:Create(textLabel, TweenInfo.new(0.15), {TextTransparency = 0})
							:Play()
						TweenService:Create(uiStroke, TweenInfo.new(0.15), {Transparency = 0.25})
							:Play()
						TweenService:Create(
							scrollingFrame,
							TweenInfo.new(0.4),
							{Position = UDim2.new(0.5, 0, 0.5, 0)}
						)
							:Play()
					else
						textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
						TweenService:Create(
							imageLabel,
							TweenInfo.new(0.15),
							{ImageTransparency = 0.55}
						)
							:Play()
						TweenService:Create(
							textLabel1,
							TweenInfo.new(0.15),
							{TextTransparency = 0.85}
						)
							:Play()
						TweenService:Create(
							textLabel,
							TweenInfo.new(0.15),
							{TextTransparency = 0.55}
						)
							:Play()
						TweenService:Create(uiStroke, TweenInfo.new(0.15), {Transparency = 0.65})
							:Play()
						TweenService:Create(
							scrollingFrame,
							TweenInfo.new(0.4),
							{Position = UDim2.fromScale(1.55, 0.5)}
						)
							:Play()
					end
				end

				if tbl1[1] then
					func(false)
				else
					func(true)
				end

				table.insert(tbl1, {func, imageLabel})
				textButton1.MouseButton1Click:Connect(function()
					for _, v1 in ipairs(tbl1) do
						if v1[2] ~= imageLabel then
							v1[1](false)
						else
							v1[1](true)
						end
					end
				end)
			elseif v1:find("change") then
				scrollingFrame = frame2:FindFirstChild("Main"):FindFirstChild("MainScrolling")
			end

			function tbl:AddLabel(arg2, arg3)
				local textLabel = Instance.new("TextLabel")
				local uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				textLabel.Name = "SectionTitle"
				textLabel.Parent = scrollingFrame
				textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				textLabel.BackgroundTransparency = 1
				textLabel.BorderSizePixel = 0
				textLabel.Size = UDim2.new(0.980000019, 0, 0.5, 0)
				textLabel.ZIndex = 4
				textLabel.Font = Enum.Font.GothamBold
				textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				textLabel.TextScaled = true
				textLabel.TextSize = 14
				textLabel.TextWrapped = true
				textLabel.TextXAlignment = Enum.TextXAlignment.Left
				textLabel.Text = arg2 .. ": " .. (arg3 == "positive" and "✅" or "❌")
				uiAspectRatioConstraint.Parent = textLabel
				uiAspectRatioConstraint.AspectRatio = 23
				uiAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
				return
					{
						SetStatus = function(_, arg21)
							textLabel.Text = arg2 .. ": " .. (arg21 == "positive" and "✅" or "❌")
						end,
						Delete = function(_)
							textLabel:Destroy()
						end,
					}
			end

			function tbl:AddSection(arg2, arg3, arg4, _)
				local textLabel = Instance.new("TextLabel")
				local uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				local tbl = {}
				textLabel.Name = "SectionTitle"
				textLabel.Parent = scrollingFrame
				textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				textLabel.BackgroundTransparency = 1
				textLabel.Size = UDim2.new(0.98, 0, 0.5, 0)
				textLabel.ZIndex = 4
				textLabel.Font = Enum.Font.GothamBold
				textLabel.Text = arg2 or "SECTION"
				textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				textLabel.TextScaled = true
				textLabel.TextWrapped = true
				textLabel.TextXAlignment = Enum.TextXAlignment.Left
				uiAspectRatioConstraint.Parent = textLabel
				uiAspectRatioConstraint.AspectRatio = 23
				uiAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
				local frame = Instance.new("Frame")
				local uiCorner = Instance.new("UICorner")
				local uiStroke = Instance.new("UIStroke")
				local uiListLayout = Instance.new("UIListLayout")
				local frame1 = Instance.new("Frame")
				local uiAspectRatioConstraint1 = Instance.new("UIAspectRatioConstraint")
				local imageLabel = Instance.new("ImageLabel")
				local imageLabel1 = Instance.new("ImageLabel")
				local textLabel1 = Instance.new("TextLabel")
				local textLabel2 = Instance.new("TextLabel")
				local frame2 = Instance.new("Frame")
				local uiCorner1 = Instance.new("UICorner")

				local function func()
					frame.Size = UDim2.new(1, 0, 0, uiListLayout.AbsoluteContentSize.Y + 10)
					uiStroke.Thickness = 1
				end

				uiListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(func)
				frame.ChildAdded:Connect(func)
				frame.ChildRemoved:Connect(func)
				frame.Name = "SectionFrame"
				frame.Parent = scrollingFrame
				frame.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
				frame.BackgroundTransparency = 0.6
				frame.Size = UDim2.new(1, -10, 0, 65)
				frame.ZIndex = 4
				frame.ClipsDescendants = true
				func()
				uiCorner.Parent = frame
				uiStroke.Color = Color3.fromRGB(128, 0, 128)
				uiStroke.Transparency = 0.9
				uiStroke.Parent = frame
				uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				uiListLayout.Parent = frame
				uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
				uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				uiListLayout.Padding = UDim.new(0, 5)
				frame1.Name = "Header"
				frame1.Parent = frame
				frame1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				frame1.BackgroundTransparency = 1
				frame1.Size = UDim2.new(0.95, 0, 0.5, 0)
				frame1.ZIndex = 5
				uiAspectRatioConstraint1.Parent = frame1
				uiAspectRatioConstraint1.AspectRatio = 4
				uiAspectRatioConstraint1.AspectType = Enum.AspectType.ScaleWithParentSize
				imageLabel.Name = "SectionIcon"
				imageLabel.Parent = frame1
				imageLabel.AnchorPoint = Vector2.new(0, 0.5)
				imageLabel.BackgroundTransparency = 1
				imageLabel.Position = UDim2.new(0.05, 0, 0.4, 0)
				imageLabel.Size = UDim2.new(0.5, 0, 0.5, 0)
				imageLabel.SizeConstraint = Enum.SizeConstraint.RelativeYY
				imageLabel.ZIndex = 6
				imageLabel.Image = "rbxassetid://119522694447910"
				imageLabel1.Name = "SectionIcon"
				imageLabel1.Parent = frame1
				imageLabel1.AnchorPoint = Vector2.new(0.5, 0.7)
				imageLabel1.BackgroundTransparency = 1
				imageLabel1.Position = UDim2.new(0.95, 0, 0.6, 0)
				imageLabel1.Size = UDim2.new(0.5, 0, 0.5, 0)
				imageLabel1.SizeConstraint = Enum.SizeConstraint.RelativeYY
				imageLabel1.ZIndex = 6
				imageLabel1.Image = "rbxassetid://"
				textLabel1.Name = "SectionHeadTest"
				textLabel1.Parent = frame1
				textLabel1.BackgroundTransparency = 1
				textLabel1.Position = UDim2.new(0.22, 0, 0.095, 0)
				textLabel1.Size = UDim2.new(0.7, 0, 0.195, 0)
				textLabel1.ZIndex = 5
				textLabel1.Font = Enum.Font.GothamBold
				textLabel1.Text = arg3 or "Data Settings"
				textLabel1.TextColor3 = Color3.fromRGB(255, 255, 255)
				textLabel1.TextScaled = true
				textLabel1.TextWrapped = true
				textLabel1.TextXAlignment = Enum.TextXAlignment.Left
				textLabel2.Name = "SectionDescription"
				textLabel2.Parent = frame1
				textLabel2.BackgroundTransparency = 1
				textLabel2.Position = UDim2.new(0.22, 0, 0.255, 0)
				textLabel2.Size = UDim2.new(0.7, 0, 0.495, 0)
				textLabel2.ZIndex = 5
				textLabel2.Font = Enum.Font.GothamBold
				textLabel2.Text = arg4 or "Save The Setting"
				textLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
				textLabel2.TextSize = 11
				textLabel2.TextTransparency = 0.5
				textLabel2.TextWrapped = true
				textLabel2.TextXAlignment = Enum.TextXAlignment.Left
				frame2.Parent = frame1
				frame2.AnchorPoint = Vector2.new(0.5, 0.5)
				frame2.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
				frame2.BackgroundTransparency = 0.6
				frame2.Position = UDim2.new(0.5, 0, 0.9, 0)
				frame2.Size = UDim2.new(0.95, 0, 0.02, 0)
				frame2.ZIndex = 5
				uiCorner1.CornerRadius = UDim.new(0.5, 0)
				uiCorner1.Parent = frame2
				tbl.Header = frame1

				function tbl:Update()
					func()
				end

				function tbl:AddLabel(arg2)
					local textLabel = Instance.new("TextLabel")
					local uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
					textLabel.Name = "SectionTitle"
					textLabel.Parent = frame
					textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					textLabel.BackgroundTransparency = 1
					textLabel.BorderSizePixel = 0
					textLabel.Size = UDim2.new(0.92, 0, 0.5, 0)
					textLabel.ZIndex = 4
					textLabel.Font = Enum.Font.GothamBold
					textLabel.Text = arg2 or "SECTION"
					textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					textLabel.TextTransparency = 0.5
					textLabel.TextScaled = false
					textLabel.TextSize = 12
					textLabel.TextWrapped = true
					textLabel.TextXAlignment = Enum.TextXAlignment.Left
					uiAspectRatioConstraint.Parent = textLabel
					uiAspectRatioConstraint.AspectRatio = 23
					uiAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

					local tbl1 = {
						Set = function(_, arg2)
							textLabel.Text = tostring(arg2)
						end,
						Delete = function(_)
							textLabel:Destroy()
							func()
						end,
					}

					tbl:Update()
					return tbl1
				end

				function tbl:AddSeperator(text)
					local frame1 = Instance.new("Frame")
					local frame2 = Instance.new("Frame")
					local textLabel = Instance.new("TextLabel")
					local frame3 = Instance.new("Frame")
					local textLabel1 = Instance.new("TextLabel")
					local textLabel2 = Instance.new("TextLabel")
					local uiStroke = Instance.new("UIStroke")
					local uiCorner = Instance.new("UICorner")
					frame1.Name = "Seperator"
					frame1.Parent = frame
					frame1.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
					frame1.BorderSizePixel = 0
					frame1.BackgroundTransparency = 1
					frame1.ZIndex = 4
					frame1.Size = UDim2.new(0.9, 0, 0, 30)
					uiCorner.CornerRadius = UDim.new(0.4, 0)
					uiCorner.Parent = frame1
					uiStroke.Color = Color3.fromRGB(128, 0, 128)
					uiStroke.Transparency = 0.5
					uiStroke.Parent = frame1
					uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					frame2.Name = "Sep1"
					frame2.Parent = frame1
					frame2.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
					frame2.BackgroundTransparency = 0
					frame2.ZIndex = 10
					frame2.BorderSizePixel = 0
					frame2.ZIndex = 6
					frame2.Position = UDim2.new(0, 10, 0, 10)
					frame2.Size = UDim2.new(0, 90, 0, 2)
					frame2.Visible = false
					textLabel.Name = "Sep2"
					textLabel.Parent = frame1
					textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					textLabel.BackgroundTransparency = 1
					textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
					textLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
					textLabel.Size = UDim2.new(0.95, 0, 0, 30)
					textLabel.Font = Enum.Font.SourceSansBold
					textLabel.Text = text
					textLabel.RichText = true
					textLabel.ZIndex = 6
					textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					textLabel.TextTransparency = 0.5
					textLabel.TextSize = 18
					textLabel1.Name = "Sep2"
					textLabel1.Parent = frame1
					textLabel1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					textLabel1.BackgroundTransparency = 1
					textLabel1.Position = UDim2.new(0, 0, 0, 0)
					textLabel1.Size = UDim2.new(0.3385, 0, 0, 30)
					textLabel1.Font = Enum.Font.SourceSansBold
					textLabel1.Text = "<<"
					textLabel1.RichText = true
					textLabel1.ZIndex = 6
					textLabel1.TextColor3 = Color3.fromRGB(128, 0, 128)
					textLabel1.TextSize = 20
					textLabel2.Name = "Sep2"
					textLabel2.Parent = frame1
					textLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					textLabel2.BackgroundTransparency = 1
					textLabel2.Position = UDim2.new(0, 0, 0, 0)
					textLabel2.AnchorPoint = Vector2.new(1, 0.5)
					textLabel2.Position = UDim2.new(0.8, 0, 0.5, 0)
					textLabel2.Font = Enum.Font.SourceSansBold
					textLabel2.Text = ">>"
					textLabel2.RichText = true
					textLabel2.ZIndex = 6
					textLabel2.TextColor3 = Color3.fromRGB(128, 0, 128)
					textLabel2.TextSize = 20
					frame3.Name = "Sep3"
					frame3.Parent = frame1
					frame3.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
					frame3.BackgroundTransparency = 0.1
					frame3.BorderSizePixel = 0
					frame3.ZIndex = 6
					frame3.Visible = false
					frame3.Position = UDim2.new(0, 280, 0, 10)
					frame3.Size = UDim2.new(0, 90, 0, 2)
				end

				function tbl.addLabel(_, text)
					local textLabel = Instance.new("TextLabel")
					local uiPadding = Instance.new("UIPadding")
					textLabel.Name = "Label"
					textLabel.Parent = frame
					textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					textLabel.BackgroundTransparency = 1
					textLabel.Size = UDim2.new(0, 270, 0, 20)
					textLabel.Font = Enum.Font.GothamBold
					textLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
					textLabel.TextTransparency = 0.5
					textLabel.TextSize = 10
					textLabel.Text = text
					textLabel.ZIndex = 5
					textLabel.TextXAlignment = Enum.TextXAlignment.Left
					uiPadding.PaddingLeft = UDim.new(0, 10)
					uiPadding.Parent = textLabel
					uiPadding.Name = "PaddingLabel"
					return
						{
							Set = function(_, text)
								textLabel.Text = text
							end,
						}
				end

				function tbl:Textbox(text, arg3, arg4)
					local input = Instance.new("Frame")
					input.Name = "Input"
					input.Parent = frame
					input.BorderSizePixel = 0
					input.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
					input.Size = UDim2.new(0.94, 0, 0, 30)
					input.BorderColor3 = Color3.fromRGB(0, 0, 0)
					input.ZIndex = 6
					local uiStroke = Instance.new("UIStroke")
					uiStroke.Color = Color3.fromRGB(255, 255, 255)
					uiStroke.Thickness = 1
					uiStroke.Transparency = 0.95
					uiStroke.Name = "UiToggle_UiStroke1"
					uiStroke.Parent = input
					local uiCorner = Instance.new("UICorner")
					uiCorner.Parent = input
					uiCorner.CornerRadius = UDim.new(0, 2)
					local title = Instance.new("TextLabel")
					title.Name = "Title"
					title.Parent = input
					title.BorderSizePixel = 0
					title.TextXAlignment = Enum.TextXAlignment.Left
					title.TextTransparency = 0.2
					title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					title.TextSize = 12
					title.Font = Enum.Font.GothamBold
					title.TextColor3 = Color3.fromRGB(255, 255, 255)
					title.BackgroundTransparency = 1
					title.Size = UDim2.new(2, 0, 1, 0)
					title.Position = UDim2.new(0.02, 0, 0, 0)
					title.Text = text
					title.ZIndex = 6
					local textBox = Instance.new("TextBox")
					textBox.Name = "TextBox"
					textBox.Parent = input
					textBox.CursorPosition = -1
					textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
					textBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
					textBox.BorderSizePixel = 0
					textBox.TextTransparency = 0.2
					textBox.TextSize = 10
					textBox.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
					textBox.Font = Enum.Font.GothamBold
					textBox.ClipsDescendants = true
					textBox.AnchorPoint = Vector2.new(1, 0)
					textBox.PlaceholderText = arg3 .. "....."
					textBox.Size = UDim2.new(0, 150, 0, 25)
					textBox.Position = UDim2.new(1, -8, 0, 2)
					textBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
					textBox.Text = ""
					textBox.ZIndex = 6
					local uiCorner1 = Instance.new("UICorner")
					uiCorner1.Parent = textBox
					uiCorner1.CornerRadius = UDim.new(0, 8)
					textBox.FocusLost:Connect(function(enterPressed)
						if not enterPressed then
							return
						end
						arg4(textBox.Text)
					end)
				end

				function tbl.Toggle1(_, arg2, arg3, arg4)
					local frame1 = Instance.new("Frame")
					local uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
					local frame2 = Instance.new("Frame")
					local uiCorner = Instance.new("UICorner")
					local textLabel = Instance.new("TextLabel")
					local frame3 = Instance.new("Frame")
					local uiCorner1 = Instance.new("UICorner")
					local imageLabel = Instance.new("ImageLabel")
					local frame4 = Instance.new("Frame")
					local uiGradient = Instance.new("UIGradient")
					local uiCorner2 = Instance.new("UICorner")
					frame1.Name = "Toggle"
					frame1.Parent = frame
					frame1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					frame1.BackgroundTransparency = 1
					frame1.BorderColor3 = Color3.fromRGB(0, 0, 0)
					frame1.BorderSizePixel = 0
					frame1.Size = UDim2.new(0.980000019, 0, 0.5, 0)
					frame1.ZIndex = 5
					uiAspectRatioConstraint.Parent = frame1
					uiAspectRatioConstraint.AspectRatio = 11.5
					uiAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
					frame2.Name = "MainFrame"
					frame2.Parent = frame1
					frame2.AnchorPoint = Vector2.new(0.5, 0)
					frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					frame2.BackgroundTransparency = 1
					frame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
					frame2.BorderSizePixel = 0
					frame2.Position = UDim2.new(0.5, 0, 0, 0)
					frame2.Size = UDim2.new(0.949999988, 0, 1, 0)
					frame2.ZIndex = 6
					uiCorner.CornerRadius = UDim.new(0, 3)
					uiCorner.Parent = frame2
					textLabel.Name = "Text"
					textLabel.Parent = frame2
					textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
					textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					textLabel.BackgroundTransparency = 1
					textLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
					textLabel.BorderSizePixel = 0
					textLabel.Position = UDim2.new(0.531999981, 0, 0.5, 0)
					textLabel.Size = UDim2.new(1.12300003, 0, 0.524999976, 0)
					textLabel.ZIndex = 6
					textLabel.Font = Enum.Font.GothamBold
					textLabel.Text = arg2 or "Auto Fuck"
					textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					textLabel.TextScaled = true
					textLabel.TextSize = 14
					textLabel.TextWrapped = true
					textLabel.TextXAlignment = Enum.TextXAlignment.Left
					frame3.Name = "System"
					frame3.Parent = frame2
					frame3.AnchorPoint = Vector2.new(0.5, 0.5)
					frame3.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
					frame3.BorderColor3 = Color3.fromRGB(0, 0, 0)
					frame3.BorderSizePixel = 0
					frame3.BackgroundTransparency = 1
					frame3.Position = UDim2.new(10.0419999994, 0, 0.5, 0)
					frame3.Size = UDim2.new(0.824999988, 0, 0.824999988, 0)
					frame3.SizeConstraint = Enum.SizeConstraint.RelativeYY
					frame3.ZIndex = 6
					uiCorner1.CornerRadius = UDim.new(0, 3)
					uiCorner1.Parent = frame3
					imageLabel.Name = "TurnOn"
					imageLabel.Parent = frame3
					imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
					imageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					imageLabel.BackgroundTransparency = 1
					imageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
					imageLabel.BorderSizePixel = 0
					imageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
					imageLabel.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
					imageLabel.ZIndex = 7
					imageLabel.Image = "rbxassetid://3944680095"
					imageLabel.ImageColor3 = Color3.fromRGB(0, 0, 0)
					imageLabel.ImageTransparency = 1
					frame4.Name = "Box"
					frame4.Parent = frame3
					frame4.AnchorPoint = Vector2.new(0.5, 0.5)
					frame4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					frame4.BorderColor3 = Color3.fromRGB(0, 0, 0)
					frame4.BorderSizePixel = 0
					frame4.Position = UDim2.new(0.5, 0, 0.5, 0)
					frame4.ZIndex = 6
					uiGradient.Color = ColorSequence.new(
						{
							ColorSequenceKeypoint.new(0, tbl13.Config.MainColor),
							ColorSequenceKeypoint.new(1, tbl13.Config.DropColor)
						}
					)
					uiGradient.Rotation = 45
					uiGradient.Parent = frame4
					uiCorner2.CornerRadius = UDim.new(0, 4)
					uiCorner2.Parent = frame4

-- https://leakd.fr
					local function func1(arg1)
						if arg1 then
							TweenService:Create(
								imageLabel,
								TweenInfo.new(0.4),
								{ImageTransparency = 0}
							)
								:Play()
							TweenService:Create(
								frame4,
								TweenInfo.new(0.3),
								{Size = UDim2.fromScale(1, 1)}
							)
								:Play()
							TweenService:Create(
								imageLabel,
								TweenInfo.new(0.55),
								{ImageColor3 = tbl13.Config.MainColor}
							)
								:Play()
						else
							TweenService:Create(
								imageLabel,
								TweenInfo.new(0.4),
								{ImageTransparency = 1}
							)
								:Play()
							TweenService:Create(
								frame4,
								TweenInfo.new(0.3),
								{Size = UDim2.fromScale(0, 0)}
							)
								:Play()
							TweenService:Create(
								imageLabel,
								TweenInfo.new(0.555),
								{ImageColor3 = Color3.fromRGB(0, 0, 0)}
							)
								:Play()
						end
					end

					func1(arg3)
					func7(frame2).MouseButton1Click:Connect(function()
						arg3 = not arg3
						func1(arg3)

						if not arg4 then
							return
						end

						arg4(arg3)
					end)
					tbl:Update()
					return
						{
							Text = function(_, ...)
								textLabel.Text = tostring(...)
							end,
							Value = function(_, arg2)
								arg3 = arg2
								func1(arg2)

								if not arg4 then
									return
								end

								arg4(arg3)
							end,
							Delete = function(_)
								frame1:Destroy()
								func()
							end,
						}
				end

				function tbl.AddToggle1(_, text, arg3, arg4)
					local frame1 = Instance.new("Frame")
					local uiCorner = Instance.new("UICorner")
					local textButton = Instance.new("TextButton")
					local textLabel = Instance.new("TextLabel")
					local frame2 = Instance.new("Frame")
					local uiCorner1 = Instance.new("UICorner")
					local imageLabel = Instance.new("ImageLabel")
					local uiCorner2 = Instance.new("UICorner")
					local uiGradient = Instance.new("UIGradient")
					local uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
					frame1.Name = "Toggle"
					frame1.Parent = frame
					frame1.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
					frame1.BackgroundTransparency = 1
					frame1.BorderColor3 = Color3.fromRGB(0, 0, 0)
					frame1.BorderSizePixel = 0
					frame1.Size = UDim2.new(0.980000019, 0, 0.5, 0)
					frame1.ZIndex = 5
					uiAspectRatioConstraint.Parent = frame1
					uiAspectRatioConstraint.AspectRatio = 11.5
					uiAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
					uiCorner.CornerRadius = UDim.new(0, 3)
					uiCorner.Name = "UICorner_Toggle"
					uiCorner.Parent = frame1
					textButton.Name = "Toggle_Click"
					textButton.Parent = frame1
					textButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					textButton.BackgroundTransparency = 1
					textButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
					textButton.BorderSizePixel = 0
					textButton.Size = UDim2.new(1, 0, 1, 0)
					textButton.Font = Enum.Font.SourceSans
					textButton.Text = ""
					textButton.TextColor3 = Color3.fromRGB(0, 0, 0)
					textButton.TextSize = 1
					textButton.ZIndex = 6
					textLabel.Name = "Toggle_Text"
					textLabel.Parent = frame1
					textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					textLabel.BackgroundTransparency = 1
					textLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
					textLabel.BorderSizePixel = 0
					textLabel.Position = UDim2.new(0.14399981, 0, 0.32, 0)
					textLabel.Size = UDim2.new(1.13500003, 0, 0.424999976, 0)
					textLabel.Font = Enum.Font.GothamBold
					textLabel.Text = text
					textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					textLabel.TextSize = 14
					textLabel.TextXAlignment = Enum.TextXAlignment.Left
					textLabel.ZIndex = 6
					textLabel.TextScaled = true
					frame2.Name = "Toggle_Icon"
					frame2.Parent = frame1
					frame2.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
					frame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
					frame2.BorderSizePixel = 0
					frame2.Position = UDim2.new(0.035, 0, 0.181818187, 0)
					frame2.Size = UDim2.new(0, 25, 0, 23)
					frame2.ZIndex = 6
					uiCorner1.CornerRadius = UDim.new(0, 3)
					uiCorner1.Name = "UICorner_Toggle2"
					uiCorner1.Parent = frame2
					imageLabel.Parent = frame2
					imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
					imageLabel.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
					imageLabel.BackgroundTransparency = 1
					imageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
					imageLabel.BorderSizePixel = 0
					imageLabel.Position = UDim2.new(0.519999981, 0, 0.550000012, 0)
					imageLabel.Size = UDim2.new(0, 30, 0, 30)
					imageLabel.Image = "http://www.roblox.com/asset/?id=6031068421"
					imageLabel.ImageColor3 = Color3.fromRGB(128, 0, 128)
					imageLabel.Visible = false
					imageLabel.ZIndex = 6
					uiCorner2.CornerRadius = UDim.new(0, 3)
					uiCorner2.Name = "UICorner_Toggle2"
					uiCorner2.Parent = imageLabel
					uiGradient.Parent = imageLabel

					if arg3 == true then
						arg3 = true
						imageLabel.Visible = true
						pcall(arg4, true)
					end

					textButton.MouseButton1Click:Connect(function()
						if arg3 then
							arg3 = false
							imageLabel.Visible = false
						else
							arg3 = true
							imageLabel.Visible = true
						end
						pcall(arg4, arg3)
					end)
				end

				function tbl:AddToggle(arg2, arg3, arg4)
					local frame1 = Instance.new("Frame")
					local uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
					local frame2 = Instance.new("Frame")
					local uiCorner = Instance.new("UICorner")
					local textLabel = Instance.new("TextLabel")
					local frame3 = Instance.new("Frame")
					local uiCorner1 = Instance.new("UICorner")
					local imageLabel = Instance.new("ImageLabel")
					local frame4 = Instance.new("Frame")
					local uiGradient = Instance.new("UIGradient")
					local uiCorner2 = Instance.new("UICorner")
					frame1.Name = "Toggle"
					frame1.Parent = frame
					frame1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					frame1.BackgroundTransparency = 1
					frame1.BorderColor3 = Color3.fromRGB(0, 0, 0)
					frame1.BorderSizePixel = 0
					frame1.Size = UDim2.new(0.980000019, 0, 0.5, 0)
					frame1.ZIndex = 4
					uiAspectRatioConstraint.Parent = frame1
					uiAspectRatioConstraint.AspectRatio = 11.5
					uiAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
					frame2.Name = "MainFrame"
					frame2.Parent = frame1
					frame2.AnchorPoint = Vector2.new(0.5, 0)
					frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					frame2.BackgroundTransparency = 1
					frame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
					frame2.BorderSizePixel = 0
					frame2.Position = UDim2.new(0.5, 0, 0, 0)
					frame2.Size = UDim2.new(0.949999988, 0, 1, 0)
					frame2.ZIndex = 5
					uiCorner.CornerRadius = UDim.new(0, 3)
					uiCorner.Parent = frame2
					textLabel.Name = "Text"
					textLabel.Parent = frame2
					textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
					textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					textLabel.BackgroundTransparency = 1
					textLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
					textLabel.BorderSizePixel = 0
					textLabel.Position = UDim2.new(0.681999981, 0, 0.5, 0)
					textLabel.Size = UDim2.new(1.12300003, 0, 0.524999976, 0)
					textLabel.ZIndex = 5
					textLabel.Font = Enum.Font.GothamBold
					textLabel.Text = arg2 or "Auto Fuck"
					textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					textLabel.TextScaled = true
					textLabel.TextSize = 14
					textLabel.TextWrapped = true
					textLabel.TextXAlignment = Enum.TextXAlignment.Left
					frame3.Name = "System"
					frame3.Parent = frame2
					frame3.AnchorPoint = Vector2.new(0.5, 0.5)
					frame3.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
					frame3.BorderColor3 = Color3.fromRGB(0, 0, 0)
					frame3.BorderSizePixel = 0
					frame3.Position = UDim2.new(0.0419999994, 0, 0.5, 0)
					frame3.Size = UDim2.new(0.824999988, 0, 0.824999988, 0)
					frame3.SizeConstraint = Enum.SizeConstraint.RelativeYY
					frame3.ZIndex = 5
					uiCorner1.CornerRadius = UDim.new(0, 3)
					uiCorner1.Parent = frame3
					imageLabel.Name = "TurnOn"
					imageLabel.Parent = frame3
					imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
					imageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					imageLabel.BackgroundTransparency = 1
					imageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
					imageLabel.BorderSizePixel = 0
					imageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
					imageLabel.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
					imageLabel.ZIndex = 6
					imageLabel.Image = "rbxassetid://3944680095"
					imageLabel.ImageColor3 = Color3.fromRGB(0, 0, 0)
					imageLabel.ImageTransparency = 1
					frame4.Name = "Box"
					frame4.Parent = frame3
					frame4.AnchorPoint = Vector2.new(0.5, 0.5)
					frame4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					frame4.BorderColor3 = Color3.fromRGB(0, 0, 0)
					frame4.BorderSizePixel = 0
					frame4.Position = UDim2.new(0.5, 0, 0.5, 0)
					frame4.ZIndex = 5
					uiGradient.Color = ColorSequence.new(
						{
							ColorSequenceKeypoint.new(0, tbl13.Config.MainColor),
							ColorSequenceKeypoint.new(1, tbl13.Config.DropColor)
						}
					)
					uiGradient.Rotation = 45
					uiGradient.Parent = frame4
					uiCorner2.CornerRadius = UDim.new(0, 4)
					uiCorner2.Parent = frame4

					local function func1(arg1)
						if arg1 then
							TweenService:Create(
								imageLabel,
								TweenInfo.new(0.4),
								{ImageTransparency = 0}
							)
								:Play()
							TweenService:Create(
								frame4,
								TweenInfo.new(0.3),
								{Size = UDim2.fromScale(1, 1)}
							)
								:Play()
							TweenService:Create(
								imageLabel,
								TweenInfo.new(0.55),
								{ImageColor3 = tbl13.Config.MainColor}
							)
								:Play()
						else
							TweenService:Create(
								imageLabel,
								TweenInfo.new(0.4),
								{ImageTransparency = 1}
							)
								:Play()
							TweenService:Create(
								frame4,
								TweenInfo.new(0.3),
								{Size = UDim2.fromScale(0, 0)}
							)
								:Play()
							TweenService:Create(
								imageLabel,
								TweenInfo.new(0.555),
								{ImageColor3 = Color3.fromRGB(0, 0, 0)}
							)
								:Play()
						end
					end

					func1(arg3)
					func7(frame2).MouseButton1Click:Connect(function()
						arg3 = not arg3
						func1(arg3)

						if not arg4 then
							return
						end

						arg4(arg3)
					end)

					if arg3 == true then
						arg3 = true
						func1(true)
						pcall(arg4, arg3)
					end

					tbl:Update()
					return
						{
							Text = function(_, ...)
								textLabel.Text = tostring(...)
							end,
							Value = function(_, arg2)
								arg3 = arg2
								func1(arg2)

								if not arg4 then
									return
								end

								arg4(arg3)
							end,
							Delete = function(_)
								frame1:Destroy()
								func()
							end,
						}
				end

				function tbl:MultiDropdown(arg2, arg3, arg4, arg5)
					local v1 = arg4 or {}
					local flag = false
					local frame1 = Instance.new("Frame")
					local uiCorner = Instance.new("UICorner")
					local textLabel = Instance.new("TextLabel")
					local textLabel1 = Instance.new("TextLabel")
					local scrollingFrame = Instance.new("ScrollingFrame")
					local uiListLayout = Instance.new("UIListLayout")
					local uiPadding = Instance.new("UIPadding")
					local textButton = Instance.new("TextButton")
					local imageLabel = Instance.new("ImageLabel")
					frame1.Name = "Dropdown"
					frame1.Parent = frame
					frame1.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
					frame1.ClipsDescendants = true
					frame1.Size = UDim2.new(0.94, 0, 0, 30)
					frame1.ZIndex = 6
					uiCorner.CornerRadius = UDim.new(0, 3)
					uiCorner.Parent = frame1
					textLabel1.Name = "DropTitle1"
					textLabel1.Parent = frame1
					textLabel1.BackgroundTransparency = 1
					textLabel1.Size = UDim2.new(0.9, 0, 0, 20)
					textLabel1.Font = Enum.Font.GothamBold
					textLabel1.Text = "  " .. arg2
					textLabel1.TextColor3 = Color3.fromRGB(225, 225, 225)
					textLabel1.TextSize = 12
					textLabel1.TextXAlignment = Enum.TextXAlignment.Left
					textLabel1.ZIndex = 6
					textLabel.Name = "DropTitle"
					textLabel.Parent = frame1
					textLabel.BackgroundTransparency = 1
					textLabel.Size = UDim2.new(0.9, 0, 0, 38)
					textLabel.Font = Enum.Font.GothamBold
					textLabel.TextColor3 = Color3.fromRGB(190, 190, 190)
					textLabel.TextSize = 9
					textLabel.TextXAlignment = Enum.TextXAlignment.Left
					textLabel.ZIndex = 6
					textLabel.TextScaled = false
					scrollingFrame.Name = "DropScroll"
					scrollingFrame.Parent = textLabel
					scrollingFrame.Active = true
					scrollingFrame.BackgroundTransparency = 1
					scrollingFrame.Position = UDim2.new(0, 0, 0, 31)
					scrollingFrame.Size = UDim2.new(0.99, 0, 0, 150)
					scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
					scrollingFrame.ScrollBarThickness = 20
					scrollingFrame.ZIndex = 6
					uiListLayout.Parent = scrollingFrame
					uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
					uiListLayout.Padding = UDim.new(0, 5)
					uiPadding.Parent = scrollingFrame
					uiPadding.PaddingLeft = UDim.new(0, 5)
					uiPadding.PaddingTop = UDim.new(0, 5)
					imageLabel.Name = "DropImage"
					imageLabel.Parent = frame1
					imageLabel.BackgroundTransparency = 1
					imageLabel.Position = UDim2.new(0.9, 0, 0, 6)
					imageLabel.Rotation = 180
					imageLabel.Size = UDim2.new(0, 20, 0, 20)
					imageLabel.Image = "rbxassetid://10734963191"
					imageLabel.ZIndex = 6
					textButton.Name = "DropButton"
					textButton.Parent = frame1
					textButton.BackgroundTransparency = 1
					textButton.Size = UDim2.new(0.95, 0, 0, 31)
					textButton.Font = Enum.Font.GothamBold
					textButton.Text = ""
					textButton.ZIndex = 6

					local function func()
						if #v1 <= 0 then
							return
								(not arg4 or #arg4 <= 0) and "   Select Multiple: "
									or "   " .. "Select Multiple: " .. table.concat(arg4, ", ")
						end
						return "   " .. "Select Multiple: " .. table.concat(v1, ", ")
					end

					if arg4 then
						v1 = arg4
					else
						v1 = {}
					end

					local v2 = v1
					textLabel.Text = func()

					for _, v3 in ipairs(arg3) do
						local textButton1 = Instance.new("TextButton")
						local uiCorner1 = Instance.new("UICorner")
						textButton1.Name = "Item"
						textButton1.Parent = scrollingFrame
						textButton1.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
						textButton1.Size = UDim2.new(0.99, 0, 0, 20)
						textButton1.Font = Enum.Font.GothamBold
						textButton1.Text = tostring(v3)
						textButton1.TextColor3 = Color3.fromRGB(225, 225, 225)
						textButton1.TextSize = 13
						textButton1.ZIndex = 6
						uiCorner1.CornerRadius = UDim.new(0, 4)
						uiCorner1.Parent = textButton1

						if table.find(v2, v3) then
							textButton1.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
						end

						textButton1.MouseButton1Click:Connect(function()
							if table.find(v2, v3) then
								table.remove(v2, table.find(v2, v3))
								textButton1.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
							else
								table.insert(v2, v3)
								textButton1.BackgroundColor3 = Color3.fromRGB(0, 50, 0)
							end

							textLabel.Text = func()
							arg5(v2)
						end)
					end

					scrollingFrame.CanvasSize = UDim2.new(
						0,
						0,
						0,
						uiListLayout.AbsoluteContentSize.Y + 5
					)
					textButton.MouseButton1Click:Connect(function()
						if flag then
							flag = false
							frame1:TweenSize(UDim2.new(0.94, 0, 0, 30), "Out", "Quad", 0.3, true)
							imageLabel.Rotation = 180
						else
							flag = true
							frame1:TweenSize(UDim2.new(0.94, 0, 0, 181), "Out", "Quad", 0.3, true)
							imageLabel.Rotation = 0
						end
					end)
					return
						{
							Add = function(_, arg2)
								local textButton = Instance.new("TextButton")
								local uiCorner = Instance.new("UICorner")
								textButton.Name = "Item"
								textButton.Parent = scrollingFrame
								textButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
								textButton.Size = UDim2.new(0.99, 0, 0, 20)
								textButton.Font = Enum.Font.GothamBold
								textButton.Text = tostring(arg2)
								textButton.TextColor3 = Color3.fromRGB(225, 225, 225)
								textButton.TextSize = 13
								textButton.ZIndex = 6
								uiCorner.CornerRadius = UDim.new(0, 4)
								uiCorner.Parent = textButton
								textButton.MouseButton1Click:Connect(function()
									if table.find(v2, arg2) then
										table.remove(v2, table.find(v2, arg2))
										textButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
									else
										table.insert(v2, arg2)
										textButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
									end

									textLabel.Text = func()
									arg5(v2)
								end)
							end,
							Clear = function()
								v2 = {}
								textLabel.Text = "   Select Multiple : "

								for _, child in ipairs(scrollingFrame:GetChildren()) do
									if child:IsA("TextButton") then
										child.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
									end
								end

								arg5(v2)
							end,
						}
				end

				function tbl:AddDropdown(arg2, arg3, arg4, arg5)
					local frame1 = Instance.new("Frame")
					local uiCorner = Instance.new("UICorner")
					local uiCorner1 = Instance.new("UICorner")
					local textLabel = Instance.new("TextLabel")
					local scrollingFrame = Instance.new("ScrollingFrame")
					local uiListLayout = Instance.new("UIListLayout")
					local uiPadding = Instance.new("UIPadding")
					local textButton = Instance.new("TextButton")
					local imageLabel = Instance.new("ImageLabel")
					Instance.new("UIStroke")
					Instance.new("TextBox")
					frame1.Name = "Dropdown"
					frame1.Parent = frame
					frame1.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
					frame1.BackgroundTransparency = 0
					frame1.ClipsDescendants = true
					frame1.Size = UDim2.new(0.94, 0, 0, 30)
					frame1.ZIndex = 6
					local uiStroke = Instance.new("UIStroke")
					uiStroke.Color = Color3.fromRGB(255, 255, 255)
					uiStroke.Thickness = 1
					uiStroke.Transparency = 0.95
					uiStroke.Name = "UiToggle_UiStroke1"
					uiStroke.Parent = frame1
					uiCorner.CornerRadius = UDim.new(0, 3)
					uiCorner.Parent = frame1

					function getpro()
						if arg4 then
							if table.find(arg3, arg4) then
								arg5(arg4)
								return "   " .. arg2 .. " : " .. arg4
							end
							return "   " .. arg2 .. " : "
						end
						return "   " .. arg2 .. " : "
					end

					textLabel.Name = "DropTitle"
					textLabel.Parent = frame1
					textLabel.BackgroundColor3 = Color3.fromRGB(224, 224, 224)
					textLabel.BackgroundTransparency = 1
					textLabel.Size = UDim2.new(0.9, 0, 0, 31)
					textLabel.Font = Enum.Font.GothamBold
					textLabel.Text = getpro()
					textLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
					textLabel.TextSize = 12
					textLabel.TextXAlignment = Enum.TextXAlignment.Left
					textLabel.ZIndex = 6
					scrollingFrame.Name = "DropScroll"
					scrollingFrame.Parent = textLabel
					scrollingFrame.Active = true
					scrollingFrame.BackgroundColor3 = Color3.fromRGB(224, 224, 224)
					scrollingFrame.BackgroundTransparency = 1
					scrollingFrame.BorderSizePixel = 0
					scrollingFrame.Position = UDim2.new(0, 0, 0, 31)
					scrollingFrame.Size = UDim2.new(0.99, 0, 0, 150)
					scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
					scrollingFrame.ScrollBarThickness = 20
					scrollingFrame.ZIndex = 6
					uiListLayout.Parent = scrollingFrame
					uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
					uiListLayout.Padding = UDim.new(0, 5)
					uiPadding.Parent = scrollingFrame
					uiPadding.PaddingLeft = UDim.new(0, 5)
					uiPadding.PaddingTop = UDim.new(0, 5)
					imageLabel.Name = "DropImage"
					imageLabel.Parent = frame1
					imageLabel.BackgroundColor3 = Color3.fromRGB(224, 224, 224)
					imageLabel.BackgroundTransparency = 1
					imageLabel.Position = UDim2.new(0.9, 0, 0, 6)
					imageLabel.Rotation = 180
					imageLabel.Size = UDim2.new(0, 20, 0, 20)
					imageLabel.Image = "rbxassetid://10734963191"
					imageLabel.ZIndex = 6
					textButton.Name = "DropButton"
					textButton.Parent = frame1
					textButton.BackgroundColor3 = Color3.fromRGB(224, 224, 224)
					textButton.BackgroundTransparency = 1
					textButton.Size = UDim2.new(0.95, 0, 0, 31)
					textButton.Font = Enum.Font.GothamBold
					textButton.Text = ""
					textButton.TextColor3 = Color3.fromRGB(0, 0, 0)
					textButton.TextSize = 14
					textButton.ZIndex = 6
					local kRef
					local flag = false

					while true do
						local k, v1 = next(arg3, kRef)
						kRef = k

						if k == nil then
							break
						end

						local item = Instance.new("TextButton")
						item.Name = "Item"
						item.Parent = scrollingFrame
						item.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
						item.BackgroundTransparency = 0
						item.Size = UDim2.new(0.99, 0, 0, 20)
						item.BorderSizePixel = 0
						item.Font = Enum.Font.GothamBold
						item.Text = tostring(v1)
						item.TextColor3 = Color3.fromRGB(225, 225, 225)
						item.TextSize = 13
						item.TextTransparency = 0
						item.ZIndex = 6
						uiCorner1.CornerRadius = UDim.new(0, 4)
						uiCorner1.Parent = item
						item.MouseEnter:Connect(function()
							TweenService:Create(
								item,
								TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0}
							)
								:Play()
						end)
						item.MouseLeave:Connect(function()
							TweenService:Create(
								item,
								TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0.5}
							)
								:Play()
						end)
						item.MouseButton1Click:Connect(function()
							flag = false
							frame1:TweenSize(UDim2.new(0.94, 0, 0, 30), "Out", "Quad", 0.3, true)
							TweenService:Create(
								imageLabel,
								TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Rotation = 180}
							)
								:Play()
							arg5(item.Text)
							textLabel.Text = "   " .. arg2 .. " : " .. item.Text
						end)
					end

					scrollingFrame.CanvasSize = UDim2.new(
						0,
						0,
						0,
						uiListLayout.AbsoluteContentSize.Y + 500
					)
					textButton.MouseButton1Click:Connect(function()
						if flag ~= false then
							flag = false
							frame1:TweenSize(UDim2.new(0.94, 0, 0, 30), "Out", "Quad", 0.3, true)
							TweenService:Create(
								imageLabel,
								TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Rotation = 180}
							)
								:Play()
						else
							flag = true
							frame1:TweenSize(UDim2.new(0.94, 0, 0, 131), "Out", "Quad", 0.3, true)
							TweenService:Create(
								imageLabel,
								TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Rotation = 0}
							)
								:Play()
						end
					end)
					return
						{
							Add = function(_, arg21)
								local item = Instance.new("TextButton")
								item.Name = "Item"
								item.Parent = scrollingFrame
								item.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
								item.BackgroundTransparency = 0
								item.Size = UDim2.new(0.99, 0, 0, 18)
								item.BorderSizePixel = 0
								item.Font = Enum.Font.GothamBold
								item.Text = tostring(arg21)
								item.TextColor3 = Color3.fromRGB(225, 225, 225)
								item.TextSize = 13
								item.TextTransparency = 0
								item.ZIndex = 6
								local uiCorner = Instance.new("UICorner")
								uiCorner.CornerRadius = UDim.new(0, 4)
								uiCorner.Parent = item
								item.MouseEnter:Connect(function()
									TweenService:Create(
										item,
										TweenInfo.new(
											0.3,
											Enum.EasingStyle.Quad,
											Enum.EasingDirection.Out
										),
										{TextTransparency = 0}
									)
										:Play()
								end)
								item.MouseLeave:Connect(function()
									TweenService:Create(
										item,
										TweenInfo.new(
											0.3,
											Enum.EasingStyle.Quad,
											Enum.EasingDirection.Out
										),
										{TextTransparency = 0.5}
									)
										:Play()
								end)
								item.MouseButton1Click:Connect(function()
									flag = false
									frame1:TweenSize(
										UDim2.new(0.94, 0, 0, 31),
										"Out",
										"Quad",
										0.3,
										true
									)
									TweenService:Create(
										imageLabel,
										TweenInfo.new(
											0.3,
											Enum.EasingStyle.Quad,
											Enum.EasingDirection.Out
										),
										{Rotation = 180}
									)
										:Play()
									arg5(item.Text)
									textLabel.Text = "   " .. arg2 .. " : " .. item.Text
								end)
							end,
							Clear = function(_)
								textLabel.Text = "   Refresh Successfully"
								textLabel.TextColor3 = Color3.fromRGB(0, 225, 0)
								wait(0.5)
								textLabel.Text = tostring("   " .. arg2) .. " : "
								textLabel.TextColor3 = Color3.fromRGB(225, 225, 255)
								flag = false
								frame1:TweenSize(
									UDim2.new(0.94, 0, 0, 31),
									"Out",
									"Quad",
									0.3,
									true
								)
								TweenService:Create(
									imageLabel,
									TweenInfo.new(
										0.3,
										Enum.EasingStyle.Quad,
										Enum.EasingDirection.Out
									),
									{Rotation = 180}
								)
									:Play()
								local v1, v2 = scrollingFrame:GetChildren()
								local v3 = v2

								while true do
									local k, v4 = next(v1, v3)
									v3 = k

									if k == nil then
										break
									end

									if v4:IsA("TextButton") then
										v4:Destroy()
									end
								end
							end,
						}
				end

				function tbl:Slider(arg2, arg3, text, text1, arg6)
					local frame1 = Instance.new("Frame")
					local textLabel = Instance.new("TextLabel")
					local frame2 = Instance.new("Frame")
					local textBox = Instance.new("TextBox")
					local uiCorner = Instance.new("UICorner")
					local frame3 = Instance.new("Frame")
					local uiCorner1 = Instance.new("UICorner")
					local frame4 = Instance.new("Frame")
					local uiCorner2 = Instance.new("UICorner")
					local frame5 = Instance.new("Frame")
					local uiCorner3 = Instance.new("UICorner")
					local tbl = {}
					frame1.Name = "SliderFrame"
					frame1.Parent = frame
					frame1.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
					frame1.Position = UDim2.new(0.109489053, 0, 0.708609283, 0)
					frame1.Size = UDim2.new(0.94, 0, 0, 40)
					frame1.BackgroundTransparency = 0
					frame1.ZIndex = 16
					local uiStroke = Instance.new("UIStroke")
					uiStroke.Color = Color3.fromRGB(255, 255, 255)
					uiStroke.Thickness = 1
					uiStroke.Transparency = 0.95
					uiStroke.Name = "UiToggle_UiStroke1"
					uiStroke.Parent = frame1
					local uiCorner4 = Instance.new("UICorner")
					uiCorner4.CornerRadius = UDim.new(0, 4)
					uiCorner4.Parent = frame1
					textLabel.Name = "LabelNameSlider"
					textLabel.Parent = frame1
					textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					textLabel.BackgroundTransparency = 1
					textLabel.Position = UDim2.new(0.0229926974, 0, 0.0396823473, 0)
					textLabel.Size = UDim2.new(0, 182, 0, 25)
					textLabel.Font = Enum.Font.GothamBold
					textLabel.Text = tostring(arg2)
					textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					textLabel.TextSize = 14
					textLabel.TextXAlignment = Enum.TextXAlignment.Left
					textLabel.ZIndex = 16
					frame2.Name = "ShowValueFrame"
					frame2.Parent = frame1
					frame2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
					frame2.BackgroundTransparency = 1
					frame2.Position = UDim2.new(0.733576655, 0, 0.0656082779, 0)
					frame2.Size = UDim2.new(0, 58, 0, 21)
					frame2.ZIndex = 16
					textBox.Name = "CustomValue"
					textBox.Parent = frame2
					textBox.AnchorPoint = Vector2.new(0.5, 0.5)
					textBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
					textBox.Position = UDim2.new(0.7, 0, 0.5, 0)
					textBox.Size = UDim2.new(0, 55, 0, 21)
					textBox.Font = Enum.Font.GothamBold
					textBox.Text = "50"
					textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
					textBox.TextSize = 11
					textBox.ZIndex = 16
					uiCorner.CornerRadius = UDim.new(0, 4)
					uiCorner.Name = "ShowValueFrameUICorner"
					uiCorner.Parent = textBox
					frame3.Name = "ValueFrame"
					frame3.Parent = frame1
					frame3.AnchorPoint = Vector2.new(0.5, 0.5)
					frame3.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
					frame3.Position = UDim2.new(0.5, 0, 0.8, 0)
					frame3.Size = UDim2.new(0.85, 0, 0, 5)
					frame3.ZIndex = 16
					uiCorner1.CornerRadius = UDim.new(0, 30)
					uiCorner1.Name = "ValueFrameUICorner"
					uiCorner1.Parent = frame3
					frame4.Name = "PartValue"
					frame4.Parent = frame3
					frame4.AnchorPoint = Vector2.new(0.5, 0.5)
					frame4.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
					frame4.BackgroundTransparency = 1
					frame4.Position = UDim2.new(0.5, 0, 0.8, 0)
					frame4.Size = UDim2.new(0.85, 0, 0, 5)
					frame4.ZIndex = 16
					uiCorner2.CornerRadius = UDim.new(0, 30)
					uiCorner2.Name = "PartValueUICorner"
					uiCorner2.Parent = frame4
					frame5.Name = "MainValue"
					frame5.Parent = frame3
					frame5.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
					frame5.Size = UDim2.new((text1 or 0) / text, 0, 0, 5)
					frame5.BorderSizePixel = 0
					frame5.ZIndex = 16
					uiCorner3.CornerRadius = UDim.new(0, 30)
					uiCorner3.Name = "MainValueUICorner"
					uiCorner3.Parent = frame5
					local conneValue = Instance.new("Frame")
					conneValue.Name = "ConneValue"
					conneValue.Parent = frame4
					conneValue.AnchorPoint = Vector2.new(0.7, 0.7)
					conneValue.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
					conneValue.Position = UDim2.new((text1 or 0) / text, 0.5, 0.5, 0, 0)
					conneValue.Size = UDim2.new(0, 10, 0, 10)
					conneValue.BorderSizePixel = 0
					conneValue.ZIndex = 16
					local uiCorner5 = Instance.new("UICorner")
					uiCorner5.CornerRadius = UDim.new(0, 10)
					uiCorner5.Parent = conneValue
					floor = true

					if floor ~= true then
						textBox.Text = tostring(
							text1 and (math.floor(text1 / text * (text - arg3) + arg3) or 0) or 0
						)
					else
						textBox.Text = tostring(
							text1 and (string.format(text1 / text * (text - arg3) + arg3) or 0) or 0
						)
					end

					local function func(arg1)
						local new = UDim2.new
						local clamp = math.clamp
						local v1 = arg1.Position.X - frame3.AbsolutePosition.X
						local v2 = new(clamp(v1 / frame3.AbsoluteSize.X, 0, 1), 0, 0.5, 0)
						frame5:TweenSize(
							UDim2.new(
								math.clamp(
									(arg1.Position.X - frame3.AbsolutePosition.X)
										/ frame3.AbsoluteSize.X,
									0,
									1
								),
								0,
								0,
								5
							),
							"Out",
							"Sine",
							0.2,
							true
						)
						conneValue:TweenPosition(v2, "Out", "Sine", 0.2, true)

						if floor ~= true then
							local v3 = math.floor(v2.X.Scale * text / text * (text - arg3) + arg3)
							textBox.Text = tostring(v3)
							arg6(v3)
						else
							local v4 = string.format(
								"%.0f",
								v2.X.Scale * text / text * (text - arg3) + arg3
							)
							textBox.Text = tostring(v4)
							arg6(v4)
						end
					end

					local flag = false
					conneValue.InputBegan:Connect(function(input)
						if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
							return
						end
						flag = true
					end)
					conneValue.InputEnded:Connect(function(input)
						if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
							return
						end
						flag = false
					end)
					frame1.InputBegan:Connect(function(input)
						if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
							return
						end
						flag = true
					end)
					frame1.InputEnded:Connect(function(input)
						if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
							return
						end
						flag = false
					end)
					frame3.InputBegan:Connect(function(input)
						if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
							return
						end
						flag = true
					end)
					frame3.InputEnded:Connect(function(input)
						if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
							return
						end
						flag = false
					end)
					game:GetService("UserInputService").InputChanged:Connect(function(input)
						if
							not (flag and input.UserInputType == Enum.UserInputType.MouseMovement)
						then
							return
						end
						func(input)
					end)
					textBox.FocusLost:Connect(function()
						if textBox.Text == "" then
							textBox.Text = text1
						end

						if text >= tonumber(textBox.Text) then
							frame5:TweenSize(
								UDim2.new((textBox.Text or 0) / text, 0, 0, 5),
								"Out",
								"Sine",
								0.2,
								true
							)
							conneValue:TweenPosition(
								UDim2.new((textBox.Text or 0) / text, 0, 0.6, 0),
								"Out",
								"Sine",
								0.2,
								true
							)

							if floor ~= true then
								textBox.Text = tostring(
									textBox.Text
										and math.floor(textBox.Text / text * (text - arg3) + arg3)
								)
							else
								textBox.Text = tostring(
									textBox.Text
										and string.format(
											"%.0f",
											textBox.Text / text * (text - arg3) + arg3
										)
								)
							end

							pcall(arg6, textBox.Text)
							return
						end

						textBox.Text = text
						frame5:TweenSize(
							UDim2.new((textBox.Text or 0) / text, 0, 0, 5),
							"Out",
							"Sine",
							0.2,
							true
						)
						conneValue:TweenPosition(
							UDim2.new((textBox.Text or 0) / text, 0, 0.6, 0),
							"Out",
							"Sine",
							0.2,
							true
						)

						if floor ~= true then
							textBox.Text = tostring(
								textBox.Text
									and math.floor(textBox.Text / text * (text - arg3) + arg3)
							)
						else
							textBox.Text = tostring(
								textBox.Text
									and string.format(
										"%.0f",
										textBox.Text / text * (text - arg3) + arg3
									)
							)
						end

						pcall(arg6, textBox.Text)
					end)

					function tbl:Update(text1)
						frame5:TweenSize(
							UDim2.new((text1 or 0) / text, 0, 0, 5),
							"Out",
							"Sine",
							0.2,
							true
						)
						conneValue:TweenPosition(
							UDim2.new((text1 or 0) / text, 0.5, 0.5, 0, 0),
							"Out",
							"Sine",
							0.2,
							true
						)
						textBox.Text = text1
						pcall(function()
							arg6(text1)
						end)
					end

					return tbl
				end

				local TweenService1 = game:GetService("TweenService")

				function tbl.dROPDS(_, arg2, arg3, arg4, arg5)
					local tbl = {}
					local frame1 = Instance.new("Frame")
					local uiCorner = Instance.new("UICorner")
					local frame2 = Instance.new("Frame")
					local uiCorner1 = Instance.new("UICorner")
					local textLabel = Instance.new("TextLabel")
					local imageButton = Instance.new("ImageButton")
					local scrollingFrame = Instance.new("ScrollingFrame")
					local uiListLayout = Instance.new("UIListLayout")
					local uiPadding = Instance.new("UIPadding")
					local textBox = Instance.new("TextBox")
					frame1.Name = "MainDropDown"
					frame1.Parent = frame
					frame1.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
					frame1.BackgroundTransparency = 0.7
					frame1.BorderSizePixel = 0
					frame1.ClipsDescendants = true
					frame1.Size = UDim2.new(0.94, 0, 0, 30)
					frame1.ZIndex = 16
					local uiStroke = Instance.new("UIStroke")
					uiStroke.Color = Color3.fromRGB(255, 255, 255)
					uiStroke.Thickness = 1
					uiStroke.Transparency = 0.95
					uiStroke.Name = "UiToggle_UiStroke1"
					uiStroke.Parent = frame1
					uiCorner.CornerRadius = UDim.new(0, 4)
					uiCorner.Parent = frame1
					frame2.Name = "MainDropDown_2"
					frame2.Parent = frame1
					frame2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
					frame2.BackgroundTransparency = 0.7
					frame2.BorderSizePixel = 0
					frame2.ClipsDescendants = true
					frame2.Size = UDim2.new(1, 0, 0, 30)
					frame2.ZIndex = 16
					uiCorner1.CornerRadius = UDim.new(0, 4)
					uiCorner1.Parent = frame2

					function getpro()
						if arg4 then
							if table.find(arg3, arg4) then
								arg5(arg4)
								return arg2 .. " : " .. arg4
							end
							return arg2 .. " : "
						end
						return arg2 .. " : "
					end

					textLabel.Name = "Text"
					textLabel.Parent = frame2
					textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					textLabel.BackgroundTransparency = 1
					textLabel.Position = UDim2.new(0, 10, 0, 10)
					textLabel.Size = UDim2.new(0, 62, 0, 12)
					textLabel.ZIndex = 16
					textLabel.Font = Enum.Font.GothamBold
					textLabel.Text = getpro()
					textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					textLabel.TextSize = 12
					textLabel.TextXAlignment = Enum.TextXAlignment.Left
					imageButton.Parent = frame2
					imageButton.AnchorPoint = Vector2.new(0, 0.5)
					imageButton.BackgroundTransparency = 1
					imageButton.Position = UDim2.new(1, -25, 0.5, 0)
					imageButton.Size = UDim2.new(0, 12, 0, 12)
					imageButton.ZIndex = 16
					imageButton.Image = "http://www.roblox.com/asset/?id=10734963191"
					textBox.Parent = frame1
					textBox.Size = UDim2.new(1, -20, 0, 30)
					textBox.PlaceholderText = "  Search..."
					textBox.TextColor3 = Color3.new(1, 1, 1)
					textBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
					textBox.BorderSizePixel = 1
					textBox.Position = UDim2.new(0, 0.5, 0, 35)
					textBox.ZIndex = 20
					textBox.Visible = false
					textBox.Text = ""
					textBox.BorderSizePixel = 0
					textBox.ClearTextOnFocus = false
					textBox.Font = Enum.Font.GothamBold
					textBox.TextWrapped = true
					textBox.TextXAlignment = Enum.TextXAlignment.Left
					textBox.TextSize = 10
					local uiCorner2 = Instance.new("UICorner")
					uiCorner2.CornerRadius = UDim.new(0, 4)
					uiCorner2.Parent = textBox
					local uiStroke1 = Instance.new("UIStroke")
					uiStroke1.Color = Color3.fromRGB(255, 255, 255)
					uiStroke1.Thickness = 1
					uiStroke1.Transparency = 0.95
					uiStroke1.Name = "UiToggle_UiStroke1"
					uiStroke1.Parent = textBox
					scrollingFrame.Name = "Scroll_Items"
					scrollingFrame.Parent = frame1
					scrollingFrame.Active = true
					scrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					scrollingFrame.BackgroundTransparency = 1
					scrollingFrame.BorderSizePixel = 0
					scrollingFrame.ZIndex = 20
					scrollingFrame.Position = UDim2.new(0, 0, 0, 70)
					scrollingFrame.Size = UDim2.new(1, 0, 1, 500)
					scrollingFrame.ScrollBarThickness = 20
					uiListLayout.Parent = scrollingFrame
					uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
					uiListLayout.Padding = UDim.new(0, 5)
					uiPadding.Parent = scrollingFrame
					uiPadding.PaddingLeft = UDim.new(0, 10)
					uiPadding.PaddingTop = UDim.new(0, 10)
					local flag = false

					function tbl:TogglePanel(visible)
						TweenService1:Create(
							frame1,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{
								Size = visible and UDim2.new(0.92, 0, 0, 300)
									or UDim2.new(0.92, 0, 0, 30)
							}
						)
							:Play()
						TweenService1:Create(
							imageButton,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Rotation = visible and 180 or 0}
						)
							:Play()
						textBox.Visible = visible
					end

					imageButton.MouseButton1Click:Connect(function()
						flag = not flag
						tbl:TogglePanel(flag)
					end)

					function tbl:Add(name)
						local textButton = Instance.new("TextButton")
						local uiCorner = Instance.new("UICorner")
						textButton.Name = name
						textButton.Parent = scrollingFrame
						textButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
						textButton.BorderSizePixel = 0
						textButton.ClipsDescendants = true
						textButton.Size = UDim2.new(1, -10, 0, 25)
						textButton.ZIndex = 17
						textButton.AutoButtonColor = false
						textButton.Font = Enum.Font.GothamBold
						textButton.Text = name
						textButton.TextColor3 = Color3.fromRGB(255, 255, 255)
						textButton.TextSize = 12
						uiCorner.CornerRadius = UDim.new(0, 4)
						uiCorner.Parent = textButton

						function tbl.Clear(_)
							for _, child in pairs(scrollingFrame:GetChildren()) do
								if child:IsA("TextButton") then
									child:Destroy()
									textLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
									textLabel.Text = arg2 .. " : Refresh Succesfully"
									wait(0.2)
									textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
									textLabel.Text = arg2 .. " : ..."
								end
							end
						end

						textButton.MouseButton1Click:Connect(function()
							flag = false
							tbl:TogglePanel(false)
							arg5(name)
							textLabel.Text = arg2 .. " : " .. name
						end)
						scrollingFrame.CanvasSize = UDim2.new(
							0,
							0,
							0,
							uiListLayout.AbsoluteContentSize.Y + 20
						)
					end

					uiListLayout:GetPropertyChangedSignal("AbsoluteContentSize")
						:Connect(function()
							scrollingFrame.CanvasSize = UDim2.new(
								0,
								0,
								0,
								uiListLayout.AbsoluteContentSize.Y + 20
							)
						end)
					local v1, v2, v3 = ipairs(arg3)
					local v4 = v3

					while true do
						local v5, v6 = v1(v2, v4)
						v4 = v5

						if v5 == nil then
							break
						end

						tbl:Add(v6)
					end

					textBox:GetPropertyChangedSignal("Text")
						:Connect(function()
							local v1 = string.lower(textBox.Text)
							for _, child in pairs(scrollingFrame:GetChildren()) do
								if child:IsA("TextButton") then
									child.Visible = string.find(string.lower(child.Name), v1) ~= nil
								end
							end
						end)
					return tbl
				end

				function tbl:Button(arg2, arg3)
					local v1 = arg3 or function() end
					local frame1 = Instance.new("Frame")
					local uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
					local frame2 = Instance.new("Frame")
					local uiCorner = Instance.new("UICorner")
					local uiGradient = Instance.new("UIGradient")
					local textLabel = Instance.new("TextLabel")
					frame1.Name = "Button"
					frame1.Parent = frame
					frame1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					frame1.BackgroundTransparency = 1
					frame1.BorderColor3 = Color3.fromRGB(0, 0, 0)
					frame1.BorderSizePixel = 0
					frame1.Size = UDim2.new(0.980000019, 0, 0.5, 0)
					frame1.ZIndex = 5
					uiAspectRatioConstraint.Parent = frame1
					uiAspectRatioConstraint.AspectRatio = 11.5
					uiAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
					frame2.Name = "ButtonMainFrame"
					frame2.Parent = frame1
					frame2.AnchorPoint = Vector2.new(0.5, 0)
					frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					frame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
					frame2.BorderSizePixel = 0
					frame2.Position = UDim2.new(0.5, 0, 0, 0)
					frame2.Size = UDim2.new(0.949999988, 0, 1, 0)
					frame2.ZIndex = 6
					uiCorner.CornerRadius = UDim.new(0, 3)
					uiCorner.Parent = frame2
					uiGradient.Color = ColorSequence.new(
						{
							ColorSequenceKeypoint.new(0, tbl13.Config.MainColor),
							ColorSequenceKeypoint.new(1, tbl13.Config.DropColor)
						}
					)
					uiGradient.Rotation = 90
					uiGradient.Parent = frame2
					textLabel.Name = "Text"
					textLabel.Parent = frame2
					textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
					textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					textLabel.BackgroundTransparency = 1
					textLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
					textLabel.BorderSizePixel = 0
					textLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
					textLabel.Size = UDim2.new(1, 0, 0.600000024, 0)
					textLabel.ZIndex = 6
					textLabel.Font = Enum.Font.GothamBold
					textLabel.Text = arg2 or "Sea Event"
					textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					textLabel.TextScaled = false
					textLabel.TextSize = 14
					textLabel.TextWrapped = true
					local v2 = func7(frame2)
					v2.MouseButton1Down:Connect(function()
						TweenService1:Create(
							uiGradient,
							TweenInfo.new(0.1),
							{Offset = Vector2.new(0, 1)}
						)
							:Play()
					end)
					v2.MouseButton1Up:Connect(function()
						TweenService1:Create(
							uiGradient,
							TweenInfo.new(0.1),
							{Offset = Vector2.new(0, 0)}
						)
							:Play()
					end)
					v2.MouseButton1Click:Connect(v1)
					return
						{
							Text = function(_, ...)
								textLabel.Text = tostring(...)
							end,
							Fire = function(_, ...)
								v1(...)
							end,
							Delete = function(_)
								frame1:Destroy()
								func()
							end,
						}
				end

				function tbl.Slider1(_, arg2, arg3, arg4, arg5, arg6)
					local tbl = {Min = arg3 or 0, Max = arg4 or 100}
					tbl.Default = arg5 or tbl.Min
					local v1 = arg6 or function() end
					local frame1 = Instance.new("Frame")
					local uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
					local frame2 = Instance.new("Frame")
					local textLabel = Instance.new("TextLabel")
					local frame3 = Instance.new("Frame")
					local uiCorner = Instance.new("UICorner")
					local frame4 = Instance.new("Frame")
					local uiCorner1 = Instance.new("UICorner")
					local frame5 = Instance.new("Frame")
					local uiCorner2 = Instance.new("UICorner")
					local textLabel1 = Instance.new("TextLabel")
					frame1.Name = "Slider"
					frame1.Parent = frame
					frame1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					frame1.BackgroundTransparency = 1
					frame1.BorderColor3 = Color3.fromRGB(0, 0, 0)
					frame1.BorderSizePixel = 0
					frame1.Size = UDim2.new(0.980000019, 0, 0.5, 0)
					frame1.ZIndex = 5
					uiAspectRatioConstraint.Parent = frame1
					uiAspectRatioConstraint.AspectRatio = 12
					uiAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
					frame2.Name = "MainFrame"
					frame2.Parent = frame1
					frame2.AnchorPoint = Vector2.new(0.5, 0)
					frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					frame2.BackgroundTransparency = 1
					frame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
					frame2.BorderSizePixel = 0
					frame2.Position = UDim2.new(0.5, 0, 0, 0)
					frame2.Size = UDim2.new(0.949999988, 0, 1, 0)
					frame2.ZIndex = 6
					textLabel.Name = "Text"
					textLabel.Parent = frame2
					textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					textLabel.BackgroundTransparency = 1
					textLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
					textLabel.BorderSizePixel = 0
					textLabel.Position = UDim2.new(0.00999999978, 0, 0, 0)
					textLabel.Size = UDim2.new(0.959999979, 0, 0.5, 0)
					textLabel.ZIndex = 6
					textLabel.Font = Enum.Font.GothamBold
					textLabel.Text = arg2 or "Slider"
					textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					textLabel.TextScaled = true
					textLabel.TextSize = 14
					textLabel.TextWrapped = true
					textLabel.TextXAlignment = Enum.TextXAlignment.Left
					frame3.Name = "System"
					frame3.Parent = frame2
					frame3.AnchorPoint = Vector2.new(0.5, 0.5)
					frame3.BackgroundColor3 = Color3.fromRGB(76, 81, 82)
					frame3.BorderColor3 = Color3.fromRGB(0, 0, 0)
					frame3.BorderSizePixel = 0
					frame3.Position = UDim2.new(0.5, 0, 0.699999988, 0)
					frame3.Size = UDim2.new(0.970000029, 0, 0.194999993, 0)
					frame3.ZIndex = 6
					uiCorner.CornerRadius = UDim.new(1, 0)
					uiCorner.Parent = frame3
					frame4.Name = "Slide"
					frame4.Parent = frame3
					frame4.BackgroundColor3 = tbl13.Config.MainColor
					frame4.BorderColor3 = Color3.fromRGB(0, 0, 0)
					frame4.BorderSizePixel = 0
					frame4.Size = UDim2.new(0.100000001, 0, 1, 0)
					frame4.ZIndex = 8
					uiCorner1.CornerRadius = UDim.new(1, 0)
					uiCorner1.Parent = frame4
					frame5.Name = "Control"
					frame5.Parent = frame4
					frame5.AnchorPoint = Vector2.new(0.5, 0.5)
					frame5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					frame5.BorderColor3 = Color3.fromRGB(0, 0, 0)
					frame5.BorderSizePixel = 0
					frame5.Position = UDim2.new(1, 0, 0.5, 0)
					frame5.Size = UDim2.new(1.64999998, 0, 2.6500001, 0)
					frame5.SizeConstraint = Enum.SizeConstraint.RelativeYY
					frame5.ZIndex = 8
					uiCorner2.CornerRadius = UDim.new(0.5, 0)
					uiCorner2.Parent = frame5
					textLabel1.Name = "ValueText"
					textLabel1.Parent = frame2
					textLabel1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					textLabel1.BackgroundTransparency = 1
					textLabel1.BorderColor3 = Color3.fromRGB(0, 0, 0)
					textLabel1.BorderSizePixel = 0
					textLabel1.Position = UDim2.new(0.6910429, 0, 0, 0)
					textLabel1.Size = UDim2.new(0.27895698, 0, 0, 0)
					textLabel1.ZIndex = 6
					textLabel1.Font = Enum.Font.GothamBold
					textLabel1.Text = tostring(tbl.Default) .. tostring(tbl.VALUE)
					textLabel1.TextColor3 = Color3.fromRGB(255, 255, 255)
					textLabel1.TextScaled = true
					textLabel1.TextSize = 14
					textLabel1.TextWrapped = true
					textLabel1.TextXAlignment = Enum.TextXAlignment.Right
					textLabel1.TextTransparency = 1
					TweenService1:Create(
						frame4,
						TweenInfo.new(0.1),
						{Size = UDim2.fromScale(tbl.Default / tbl.Max, 1)}
					)
						:Play()
					local flag = false

					local function func1(arg1)
						local v2 = math.clamp(
							(arg1.Position.X - frame3.AbsolutePosition.X) / frame3.AbsoluteSize.X,
							0,
							1
						)
						local v3 = math.floor((tbl.Max - tbl.Min) * v2 + tbl.Min)
						local v4 = UDim2.fromScale(v2, 1)
						textLabel1.Text = tostring(v3) .. tostring(tbl.VALUE)
						TweenService1:Create(frame4, TweenInfo.new(0.1), {Size = v4}):Play()
						v1(v3)
					end

					frame2.InputBegan:Connect(function(input)
						if
							input.UserInputType ~= Enum.UserInputType.MouseButton1
								and input.UserInputType ~= Enum.UserInputType.Touch
						then
							return
						end

						flag = true
						TweenService1:Create(
							textLabel1,
							TweenInfo.new(0.1),
							{Size = UDim2.new(0.27895698, 0, 0.5, 0), TextTransparency = 0.1}
						)
							:Play()
						func1(input)
					end)
					frame2.InputEnded:Connect(function(input)
						if
							input.UserInputType ~= Enum.UserInputType.MouseButton1
								and input.UserInputType ~= Enum.UserInputType.Touch
						then
							return
						end
						flag = false
					end)
					UserInputService1.InputChanged:Connect(function(input)
						if
							not (flag
								and (input.UserInputType == Enum.UserInputType.MouseMovement
									or input.UserInputType == Enum.UserInputType.Touch))
						then
							return
						end
						func1(input)
					end)
					return
						{
							Text = function(_, ...)
								textLabel.Text = tostring(...)
							end,
							Value = function(_, arg2)
								textLabel1.Text = tostring(arg2) .. tostring(tbl.VALUE)
								v1(arg2)
							end,
							Fire = function(_, ...)
								v1(...)
							end,
							Delete = function(_)
								textButton:Destroy()
								func()
							end,
						}
				end

				function tbl.Dropdown1(_, arg2, _, arg4, arg5)
					local frame1 = Instance.new("Frame")
					local uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
					local textLabel = Instance.new("TextLabel")
					local uiAspectRatioConstraint1 = Instance.new("UIAspectRatioConstraint")
					local uiListLayout = Instance.new("UIListLayout")
					local frame2 = Instance.new("Frame")
					local uiStroke = Instance.new("UIStroke")
					local uiGradient = Instance.new("UIGradient")
					local uiCorner = Instance.new("UICorner")
					local frame3 = Instance.new("Frame")
					local uiAspectRatioConstraint2 = Instance.new("UIAspectRatioConstraint")
					local imageLabel = Instance.new("ImageLabel")
					local textLabel1 = Instance.new("TextLabel")
					local uiGradient1 = Instance.new("UIGradient")
					local uiListLayout1 = Instance.new("UIListLayout")
					local scrollingFrame = Instance.new("ScrollingFrame")
					local uiAspectRatioConstraint3 = Instance.new("UIAspectRatioConstraint")
					local uiListLayout2 = Instance.new("UIListLayout")
					local v1 = arg5 or function() end
					task.spawn(function()
						local UIListLayout = scrollingFrame:WaitForChild("UIListLayout", 9999999)
						scrollingFrame.CanvasSize = UDim2.new(
							0,
							0,
							0,
							UIListLayout.AbsoluteContentSize.Y + 1
						)
						UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize")
							:Connect(function()
								scrollingFrame.CanvasSize = UDim2.new(
									0,
									0,
									0,
									UIListLayout.AbsoluteContentSize.Y + 1
								)
							end)
					end)

					local function func1(arg1)
						if typeof(arg1) == "table" then
							local str = ""

							for _, v1 in ipairs(arg1) do
								str = str .. " " .. tostring(v1) .. " ,"
							end

							return str:sub(0, #str - 1)
						end
						return tostring(Default or "None")
					end

					frame1.Name = "Dropdown"
					frame1.Parent = frame
					frame1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					frame1.BackgroundTransparency = 1
					frame1.BorderColor3 = Color3.fromRGB(0, 0, 0)
					frame1.BorderSizePixel = 0
					frame1.Size = UDim2.new(0.980000019, 0, 0.5, 0)
					frame1.ZIndex = 5
					uiAspectRatioConstraint.Parent = frame1
					uiAspectRatioConstraint.AspectRatio = 6.5
					uiAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
					textLabel.Name = "Text"
					textLabel.Parent = frame1
					textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					textLabel.BackgroundTransparency = 1
					textLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
					textLabel.BorderSizePixel = 0
					textLabel.Size = UDim2.new(0.959999979, 0, 0.5, 0)
					textLabel.ZIndex = 6
					textLabel.Font = Enum.Font.GothamBold
					textLabel.Text = arg2 or "Select Gays"
					textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					textLabel.TextScaled = true
					textLabel.TextSize = 14
					textLabel.TextWrapped = true
					textLabel.TextXAlignment = Enum.TextXAlignment.Left
					uiAspectRatioConstraint1.Parent = textLabel
					uiAspectRatioConstraint1.AspectRatio = 22
					uiAspectRatioConstraint1.AspectType = Enum.AspectType.ScaleWithParentSize
					uiListLayout.Parent = frame1
					uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
					uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
					uiListLayout.Padding = UDim.new(0, 3)
					frame2.Name = "DropFrame"
					frame2.Parent = frame1
					frame2.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
					frame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
					frame2.BorderSizePixel = 0
					frame2.ClipsDescendants = true
					frame2.Position = UDim2.new(0.0200000405, 0, 0.373297691, 0)
					frame2.Size = UDim2.new(0.959999979, 0, 0.550000012, 0)
					frame2.ZIndex = 6
					uiStroke.Color = Color3.fromRGB(37, 37, 37)
					uiStroke.Parent = frame2
					uiGradient.Transparency = NumberSequence.new(
						{
							NumberSequenceKeypoint.new(0, 0.68),
							NumberSequenceKeypoint.new(0.2, 0),
							NumberSequenceKeypoint.new(0.8, 0),
							NumberSequenceKeypoint.new(1, 0.67)
						}
					)
					uiGradient.Parent = uiStroke
					uiCorner.CornerRadius = UDim.new(0, 2)
					uiCorner.Parent = frame2
					frame3.Name = "Header"
					frame3.Parent = frame2
					frame3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					frame3.BackgroundTransparency = 1
					frame3.BorderColor3 = Color3.fromRGB(0, 0, 0)
					frame3.BorderSizePixel = 0
					frame3.Size = UDim2.new(0.925000012, 0, 1, 0)
					frame3.ZIndex = 7
					uiAspectRatioConstraint2.Parent = frame3
					uiAspectRatioConstraint2.AspectRatio = 12
					uiAspectRatioConstraint2.AspectType = Enum.AspectType.ScaleWithParentSize
					imageLabel.Name = "Icon"
					imageLabel.Parent = frame3
					imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
					imageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					imageLabel.BackgroundTransparency = 1
					imageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
					imageLabel.BorderSizePixel = 0
					imageLabel.Position = UDim2.new(0.939999998, 0, 0.5, 0)
					imageLabel.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
					imageLabel.SizeConstraint = Enum.SizeConstraint.RelativeYY
					imageLabel.ZIndex = 7
					imageLabel.Image = "rbxassetid://7733717447"
					textLabel1.Name = "SelectText"
					textLabel1.Parent = frame3
					textLabel1.AnchorPoint = Vector2.new(0.5, 0.5)
					textLabel1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					textLabel1.BackgroundTransparency = 1
					textLabel1.BorderColor3 = Color3.fromRGB(0, 0, 0)
					textLabel1.BorderSizePixel = 0
					textLabel1.Position = UDim2.new(0.437301666, 0, 0.499999493, 0)
					textLabel1.Size = UDim2.new(0.864019156, 0, 0.550000012, 0)
					textLabel1.ZIndex = 8
					textLabel1.Font = Enum.Font.GothamBold
					textLabel1.Text = func1(Default or "None")
					textLabel1.TextColor3 = Color3.fromRGB(255, 255, 255)
					textLabel1.TextScaled = true
					textLabel1.TextSize = 14
					textLabel1.TextTransparency = 0.5
					textLabel1.TextWrapped = true
					textLabel1.TextXAlignment = Enum.TextXAlignment.Left
					uiGradient1.Transparency = NumberSequence.new(
						{
							NumberSequenceKeypoint.new(0, 0),
							NumberSequenceKeypoint.new(0.9, 0),
							NumberSequenceKeypoint.new(1, 1)
						}
					)
					uiGradient1.Parent = textLabel1
					uiListLayout1.Parent = frame2
					uiListLayout1.HorizontalAlignment = Enum.HorizontalAlignment.Center
					uiListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
					uiListLayout1.Padding = UDim.new(0, 3)
					scrollingFrame.Parent = frame2
					scrollingFrame.Active = true
					scrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					scrollingFrame.BackgroundTransparency = 1
					scrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
					scrollingFrame.BorderSizePixel = 0
					scrollingFrame.Size = UDim2.new(1, 0, 5.6500001, 0)
					scrollingFrame.ZIndex = 6
					scrollingFrame.ScrollBarThickness = 0
					uiAspectRatioConstraint3.Parent = scrollingFrame
					uiAspectRatioConstraint3.AspectRatio = 1.95
					uiAspectRatioConstraint3.AspectType = Enum.AspectType.ScaleWithParentSize
					uiListLayout2.Parent = scrollingFrame
					uiListLayout2.HorizontalAlignment = Enum.HorizontalAlignment.Center
					uiListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
					uiListLayout2.Padding = UDim.new(0, 3)
					uiAspectRatioConstraint:GetPropertyChangedSignal("AspectRatio"):Connect(func)
					frame2:GetPropertyChangedSignal("Size")
						:Connect(function()
							if frame2.Size.Y.Scale < 0.85 then
								scrollingFrame.Visible = false
							else
								scrollingFrame.Visible = true
							end
						end)

					local function func2(arg1)
						if arg1 then
							TweenService1:Create(
								uiAspectRatioConstraint,
								TweenInfo.new(0.3),
								{AspectRatio = 1.5}
							)
								:Play()
							TweenService1:Create(
								frame2,
								TweenInfo.new(0.3),
								{Size = UDim2.fromScale(0.96, 0.9)}
							)
								:Play()
							TweenService1:Create(
								imageLabel,
								TweenInfo.new(0.3),
								{
									ImageColor3 = tbl13.Config.MainColor,
									Size = UDim2.new(0.959999976, 0, 0.959999976, 0)
								}
							)
								:Play()
						else
							TweenService1:Create(
								uiAspectRatioConstraint,
								TweenInfo.new(0.3),
								{AspectRatio = 6.5}
							)
								:Play()
							TweenService1:Create(
								frame2,
								TweenInfo.new(0.3),
								{Size = UDim2.fromScale(0.96, 0.55)}
							)
								:Play()
							TweenService1:Create(
								imageLabel,
								TweenInfo.new(0.3),
								{
									ImageColor3 = Color3.fromRGB(255, 255, 255),
									Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
								}
							)
								:Play()
						end
					end

					func2(false)
					local tbl = {}
					local flag = false
					local v2 = typeof(tbl) ~= "table" and {tbl} or tbl

					local function func3(arg1)
						local frame = Instance.new("Frame")
						local uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
						local frame1 = Instance.new("Frame")
						local uiCorner = Instance.new("UICorner")
						local textLabel = Instance.new("TextLabel")
						local frame2 = Instance.new("Frame")
						local uiCorner1 = Instance.new("UICorner")
						local imageLabel = Instance.new("ImageLabel")
						local frame3 = Instance.new("Frame")
						local uiGradient = Instance.new("UIGradient")
						local uiCorner2 = Instance.new("UICorner")
						frame.Name = "DropdownObject"
						frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						frame.BackgroundTransparency = 1
						frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
						frame.BorderSizePixel = 0
						frame.Size = UDim2.new(0.980000019, 0, 0.5, 0)
						frame.ZIndex = 5
						uiAspectRatioConstraint.Parent = frame
						uiAspectRatioConstraint.AspectRatio = 11.5
						uiAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
						frame1.Name = "MainFrame"
						frame1.Parent = frame
						frame1.AnchorPoint = Vector2.new(0.5, 0)
						frame1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						frame1.BackgroundTransparency = 1
						frame1.BorderColor3 = Color3.fromRGB(0, 0, 0)
						frame1.BorderSizePixel = 0
						frame1.Position = UDim2.new(0.409999996, 0, 0, 0)
						frame1.Size = UDim2.new(0.800000012, 0, 1, 0)
						frame1.ZIndex = 6
						uiCorner.CornerRadius = UDim.new(0, 3)
						uiCorner.Parent = frame1
						textLabel.Name = "Text"
						textLabel.Parent = frame1
						textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
						textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						textLabel.BackgroundTransparency = 1
						textLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
						textLabel.BorderSizePixel = 0
						textLabel.Position = UDim2.new(0.75, 0, 0.5, 0)
						textLabel.Size = UDim2.new(1.12300003, 0, 0.524999976, 0)
						textLabel.ZIndex = 6
						textLabel.Font = Enum.Font.GothamBold
						textLabel.Text = tostring(arg1)
						textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
						textLabel.TextScaled = true
						textLabel.TextSize = 14
						textLabel.TextWrapped = true
						textLabel.TextXAlignment = Enum.TextXAlignment.Left
						frame2.Name = "System"
						frame2.Parent = frame1
						frame2.AnchorPoint = Vector2.new(0.5, 0.5)
						frame2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
						frame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
						frame2.BorderSizePixel = 0
						frame2.Position = UDim2.new(0.109999999, 0, 0.5, 0)
						frame2.Size = UDim2.new(0.824999988, 0, 0.824999988, 0)
						frame2.SizeConstraint = Enum.SizeConstraint.RelativeYY
						frame2.ZIndex = 6
						uiCorner1.CornerRadius = UDim.new(0, 3)
						uiCorner1.Parent = frame2
						imageLabel.Name = "TurnOn"
						imageLabel.Parent = frame2
						imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
						imageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						imageLabel.BackgroundTransparency = 1
						imageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
						imageLabel.BorderSizePixel = 0
						imageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
						imageLabel.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
						imageLabel.ZIndex = 7
						imageLabel.Image = "rbxassetid://3944680095"
						imageLabel.ImageColor3 = Color3.fromRGB(0, 0, 0)
						imageLabel.ImageTransparency = 1
						frame3.Name = "Box"
						frame3.Parent = frame2
						frame3.AnchorPoint = Vector2.new(0.5, 0.5)
						frame3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						frame3.BorderColor3 = Color3.fromRGB(0, 0, 0)
						frame3.BorderSizePixel = 0
						frame3.Position = UDim2.new(0.5, 0, 0.5, 0)
						frame3.ZIndex = 6
						uiGradient.Color = ColorSequence.new(
							{
								ColorSequenceKeypoint.new(0, tbl13.Config.MainColor),
								ColorSequenceKeypoint.new(1, tbl13.Config.DropColor)
							}
						)
						uiGradient.Rotation = 45
						uiGradient.Parent = frame3
						uiCorner2.CornerRadius = UDim.new(0, 4)
						uiCorner2.Parent = frame3

						return
							frame,
							function(arg1)
								if arg1 then
									TweenService1:Create(
										imageLabel,
										TweenInfo.new(0.4),
										{ImageTransparency = 0}
									)
										:Play()
									TweenService1:Create(
										frame3,
										TweenInfo.new(0.3),
										{Size = UDim2.fromScale(1, 1)}
									)
										:Play()
									TweenService1:Create(
										imageLabel,
										TweenInfo.new(0.55),
										{ImageColor3 = tbl13.Config.MainColor}
									)
										:Play()
								else
									TweenService1:Create(
										imageLabel,
										TweenInfo.new(0.4),
										{ImageTransparency = 1}
									)
										:Play()
									TweenService1:Create(
										frame3,
										TweenInfo.new(0.3),
										{Size = UDim2.fromScale(0, 0)}
									)
										:Play()
									TweenService1:Create(
										imageLabel,
										TweenInfo.new(0.555),
										{ImageColor3 = Color3.fromRGB(0, 0, 0)}
									)
										:Play()
								end
							end
					end

					local function func4()
						for _, child in ipairs(scrollingFrame:GetChildren()) do
							if child:IsA("Frame") then
								child:Destroy()
							end
						end

						scrollingFrame:SetAttribute("Key", tostring(math.random(1, 1000)))

						for k, v3 in pairs(DropdownInfo) do
							local v4, v5 = func3(tostring(v3))
							local flag = false
							v4.Parent = scrollingFrame

							if k == Default or v3 == Default then
								v5(true)
								table.insert(v2, v3)
								flag = true
							else
								v5(false)
							end

							func7(v4).MouseButton1Click:Connect(function()
								flag = not flag

								if flag then
									if not (arg4 >= #v2 + 1) then
										flag = not flag
										return
									end

									if table.find(v2, v3) then
										v5(flag)
										textLabel1.Text = func1(v2)
										v1(v2, v3)
										return
									end

									table.insert(v2, v3)
								else
									for i, v4 in ipairs(v2) do
										if v4 == v3 then
											table.remove(v2, i)
										end
									end
								end

								v5(flag)
								textLabel1.Text = func1(v2)
								v1(v2, v3)
							end)
						end
					end

					func4()
					func7(frame3).MouseButton1Click:Connect(function()
						flag = not flag
						func2(flag)
					end)
					return
						{
							Text = function(_, ...)
								textLabel.Text = tostring(...)
							end,
							Refresh = function(_, arg2)
								DropdownInfo = arg2
								func4()
							end,
							Fire = function(_, ...)
								v1(...)
							end,
							Delete = function(_)
								textButton:Destroy()
								func()
							end,
						}
				end

				return tbl
			end

			return tbl
		end

		return tbl1
	end

	return tbl
end

local str = "Unknown"
pcall(function()
	str = identifyexecutor and identifyexecutor() or "Unknown"
end)

if str == "Solara" then
	str = "Solara - Some functions may not work like fast attack etc.."
end

local str1 = "King Legacy"
pcall(function()
	str1 = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
end)
_G.Title = str1
local v17 = "Executor : " .. tostring(str)
local Menu = tbl13:NewWindow("", v17, "rbxassetid://115426623977608")
	:AddMenu("", "Game : " .. str1 .. "   Version : Akuma", "ticket", "tab")
local configsFarmTab = Menu:AddTab("Configs Farm", 10734950020, "distance,bringmob")
local mainFarmTab = Menu:AddTab("Main Farm", 6035153656, "farm,bossess,etc.")
local halloweenEventTab = Menu:AddTab("Halloween Event", 6034467796, "farm,bossess,etc.")
local worldBossesTab = Menu:AddTab("World Bosses", 15557776256, "farm,bossess,etc.")
local seaEventTab = Menu:AddTab("Sea Event", 6034754442, "farm,bossess,etc.")
local localPlayerTab = Menu:AddTab("Local Player", 14477563495, "auto stats melee,sword,fruit")
local travelSeasTab = Menu:AddTab("Travel Seas", 14477598542, "teleport sea,hop")
local shopsTab = Menu:AddTab("Shops", 14477621526, "auto buy sword,fruit")
local dungeonTab = Menu:AddTab("Dungeon", 14477517268, "auto raid,autoskill")
local miscTab = Menu:AddTab("Misc", 14477663692, "other,config")
local Section = localPlayerTab:AddSection(
	"",
	"Auto Stats",
	"auto add melee,fruit,sword stats",
	"rbxassetid://14477563495"
)
local Section1 = localPlayerTab:AddSection(
	"",
	"Player Combat",
	"auto kill player,spectate etc..",
	"rbxassetid://14477563495"
)
local Section2 = travelSeasTab:AddSection(
	"",
	"World",
	"travel first, second, third sea",
	"rbxassetid://14477598542"
)
local Section3 = travelSeasTab:AddSection(
	"",
	"Seas",
	"travel island and npc in any sea",
	"rbxassetid://14477598542"
)
local Section4 = shopsTab:AddSection(
	"",
	"Fruit Shop",
	"auto buy key, auto open,",
	"rbxassetid://14477621526"
)
local Section5 = shopsTab:AddSection(
	"",
	"Others",
	"auto teleport to abilities shops",
	"rbxassetid://14477621526"
)
local Section6 = dungeonTab:AddSection(
	"",
	"Auto Raid",
	"auto farm raid, auto kill mob",
	"rbxassetid://14477517268"
)
local Section7 = miscTab:AddSection(
	"",
	"Misc",
	"Bost fps,hide ui,destroy",
	"rbxassetid://14477663692"
)
local Section8 = miscTab:AddSection(
	"",
	"Esp",
	"esp player, islands, ghostship,etc..",
	"rbxassetid://14477663692"
)
local Players1 = game:GetService("Players")
local LocalPlayer2 = Players1.LocalPlayer
local Section9
pcall(function()
	Section9 = script and script.Parent
end)
task.spawn(function()
	pcall(function()
		select(
			2,
			Players1:GetUserThumbnailAsync(
				LocalPlayer2.UserId,
				Enum.ThumbnailType.HeadShot,
				Enum.ThumbnailSize.Size420x420
			)
		)
	end)
end)
local v41

function Toggle(arg1, arg2, ...)
	local v1 = (...)
	local v2 = (select(2, ...))
	local v3

	if v2 or type(v1) ~= "function" then
		v3 = v1
		v1 = v2
	else
		v3 = nil
	end

	if not v3 then
		local v4 = (...)
		local v5 = (select(2, ...))
		v3 = v4
		v1 = v5
	end

	return
		arg2:AddToggle(
			arg1,
			_G.Settings[v3] or false,
			v1
				or function(arg1)
					_G.Settings[v3] = arg1
					SaveSettings()

					if arg1 then
						if tbl5[v3] then
							v41 = task.spawn(tbl5[v3])
						else
							warn("Toggle: no function t16." .. tostring(v3))
						end
					else
						if v41 then
							pcall(task.cancel, v41)
							v41 = nil
						end
						flag = false
					end
				end
		)
end

function Dropdown(arg1, arg2, arg3, ...)
	local v1 = (...)

	if not (select(2, ...)) and type(v1) == "function" then
		v1 = nil
	end

	v1 = v1 or (...)
	return
		arg3:AddDropdown(
			arg1,
			arg2,
			_G.Settings[v1],
			function(arg1)
				_G.Settings[v1] = arg1
				SaveSettings()
			end
		)
end

function AddMultiDropdown(arg1, arg2, arg3, ...)
	local v1 = (...)

	if not (select(2, ...)) and type(v1) == "function" then
		v1 = nil
	end

	v1 = v1 or (...)
	return
		arg3:MultiDropdown(
			arg1,
			_G.Settings[v1],
			arg2,
			function(arg1)
				_G.Settings[v1] = arg1
				SaveSettings()
			end
		)
end

function Label(arg1, arg2, arg3)
	if arg3 then
		return arg2:AddLabel(arg1)
	end
	return arg2:AddLabel(Name)
end

if mainFarmTab then
	Section9 = mainFarmTab:AddSection(
		"",
		"Main Farming",
		"auto farm level, materials, auto 1/2 sea",
		"rbxassetid://10734975692"
	)
	print("[Akuma] Main Farming section created")
else
	warn("[Akuma] Main Farm tab (v346) is nil - UI library may have failed")
end

if not Section9 then
	warn("[Akuma] Parent section is nil - toggles will not load")
	Section9 = mainFarmTab
end

local Label1 = Section9:AddLabel("Auto Farming: Inactive")
local Label2 = Section9:AddLabel("Quest: N/A")
local Label3 = Section9:AddLabel("Health: N/A")

local function func8()
	if Label1 then
		Label1:Set(_G.LabelAutoFarm or "Auto Farming: Inactive")
	end

	if Label2 then
		Label2:Set(_G.Questname)
	end

	if not Label3 then
		return
	end

	Label3:Set(_G.LabelHealth or "Health: N/A")
end

task.spawn(function()
	while task.wait(0.5) do
		func8()
	end
end)

local function func9(name)
	local LocalPlayer = game.Players.LocalPlayer
	if
		LocalPlayer
			and (LocalPlayer.Backpack and LocalPlayer.Character)
			and LocalPlayer.Character:FindFirstChild("Humanoid")
	then
		local v1 = LocalPlayer.Backpack:FindFirstChild(name)
		if v1 then
			LocalPlayer.Character.Humanoid:EquipTool(v1)
		else
			warn("Tool not found in Backpack: " .. name)
		end
	else
		warn("Player, Character, or Humanoid not available.")
	end
end

local toggle = Toggle
toggle("Auto Farm Level", Section9, "Auto_Farm_Level1")
toggle("Auto Farm Near", Section9, "Auto_Farm_Nearest_Mob")
print("[Akuma] Core farm toggles loaded")

if Sea1 then
	Toggle("Auto Second Sea [Lv. 2250]", Section9, "Auto_Sea21")
elseif Sea2 then
	local toggle1 = Toggle
	toggle1("Auto Third World [Lv. 4000]", Section9, "Auto_Sea31")
	toggle1("Auto Haki V2", Section9, "auto_hakiv2")
	toggle1("Auto Observation V2", Section9, "AUTOOBSERVE2")
end

Section9:AddSeperator("Boss Farm")
Section9:AddDropdown(
	"Select Boss",
	v9,
	"",
	function(arg1)
		selectedBoss = arg1
	end
)
Toggle("Auto Farm Boss", Section9, "autofarmbosses")
Section9:AddSeperator("Material Farm")
Section9:AddDropdown(
	"Select Material",
	v8,
	"",
	function(arg1)
		SelectMaterial = arg1
		MaterialMon()
	end
)
Toggle("Auto Farm Materials", Section9, "AutoFarmMaterial")
Section9:AddSeperator("Accessories")
local v18, v19, v20 = ipairs(
	game:GetService("Players").LocalPlayer:WaitForChild("Accessories"):GetChildren()
)
LocalPlayer2 = v18
local v21 = v20
local tbl14 = {}

while true do
	local v22, v23 = LocalPlayer2(v19, v21)
	v1038 = v23
	v21 = v22

	if v22 == nil then
		break
	end

	table.insert(tbl14, v1038.Name)
end

Section9:AddDropdown(
	"Select Accessory",
	tbl14,
	"",
	function(selectedAccessory)
		_G.selectedAccessory = selectedAccessory
	end
)
Section9:AddToggle(
	"Auto Equip Selected Accessory",
	_G.autoEquipAccessory,
	function(autoEquipAccessory)
		_G.autoEquipAccessory = autoEquipAccessory

		if not autoEquipAccessory then
			return
		end

		spawn(function()
			while _G.autoEquipAccessory do
				if _G.selectedAccessory then
					local tbl = {_G.selectedAccessory}
					game:GetService("ReplicatedStorage")
						:WaitForChild("Chest")
						:WaitForChild("Remotes")
						:WaitForChild("Functions")
						:WaitForChild("AccessoryEq")
						:InvokeServer(unpack(tbl))
				end
				wait(1)
			end
		end)
	end
)
Section9:AddSeperator("Passive Tree")
local Label4 = Section9:AddLabel("Status : " .. _G.redcircle)
task.spawn(function()
	while true do
		task.wait(1)
		if
			game:GetService("ReplicatedStorage"):FindFirstChild("NPC")
				and game:GetService("ReplicatedStorage").NPC:FindFirstChild("PassiveTree")
		then
			Label4:Set("Check PassiveTree: " .. _G.greencircle)
		else
			Label4:Set("Check PassiveTree: " .. _G.redcircle)
		end
	end
end)
Section9:AddToggle(
	"Teleport Passive",
	false,
	function(autopassive)
		_G.autopassive = autopassive
	end
)
spawn(function()
	while true do
		local v1 = _G.autopassive and workspace:WaitForChild("AllNPC"):WaitForChild("PassiveTree")

		if v1 then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v1.CFrame
		end

		wait(1)
	end
end)
Section9:AddToggle(
	"Auto Hop",
	false,
	function(_)
		Serverhop()
	end
)
Section9:AddSeperator("Codes")

local function func10(arg1)
	game:GetService(
		"ReplicatedStorage"
	).Chest.Remotes.Functions.redeemcode:InvokeServer(unpack({arg1}))
end

Section9:AddDropdown(
	"Select Code",
	{
		"IslandQuestRepeat",
		"X100KSuccess",
		"FruitAwakeningTime",
		"Halloween2024",
		"Update7.1",
		"DragonColorRefund",
		"PlayKingLegacyFor5Gems",
		"RainbowDragon",
		"<3LEEPUNGG",
		"Update7.0.4",
		"SKGames",
		"PassiveMaster",
		"InfernoKingAwaits",
		"Update7Release",
		"TelekinesisFruitPower",
		"EpicAdventure",
		"WELCOMETOKINGLEGACY",
		"FREESTATSRESET",
		"DinoxLive",
		"2MFAV",
		"Peodiz"
	},
	"IslandQuestRepeat",
	function(selectedCode)
		_G.SelectedCode = selectedCode
		print("Selected Code:", _G.SelectedCode)
	end
)
Section9:AddToggle(
	"Use Selected Code",
	false,
	function(useCode)
		_G.Settings.UseCode = useCode
		print("Use Selected Code:", _G.Settings.UseCode)

		if not (_G.Settings.UseCode and _G.SelectedCode) then
			return
		end

		func10(_G.SelectedCode)
	end
)
local Section10 = halloweenEventTab:AddSection(
	"",
	"Halloween Event",
	"auto farm cady any sea auto spawn bosses",
	"rbxassetid://6034684949"
)
local Label5 = Section10:AddLabel("Total Candy : ")
spawn(function()
	while task.wait(0.1) do
		local v1 =
			Client:FindFirstChild("PlayerStats")
				and (Client.PlayerStats:FindFirstChild("Material")
					and (Client.PlayerStats.Material:FindFirstChild("Candy")
						and Client.PlayerStats.Material.Candy.Value))
				or getPlayerMaterial("Candy")
		if v1 then
			Label5:Set("Total Candy : " .. tostring(v1))
		else
			Label5:Set("Total Candy : N/A")
		end
	end
end)
local Label6 = Section10:AddLabel("Status : " .. _G.redcircle)
task.spawn(function()
	while task.wait(1) do
		Label6:Set(
			tbl4.find({"Skull King"}) and "Check Skull King Mon: " .. _G.greencircle
				or "Check Skull King Mon: " .. _G.redcircle
		)
	end
end)
local Label7 = Section10:AddLabel("Status : " .. _G.redcircle)
task.spawn(function()
	while task.wait(1) do
		Label7:Set(
			tbl4.find({"Jack o lantern [Lv. 10000]"})
				and "Check Jack O Lantern Mon: " .. _G.greencircle
				or "Check Jack O Lantern Mon: " .. _G.redcircle
		)
	end
end)
local toggle2 = Toggle
toggle2("Auto Farm Candy", Section10, "auto_farm_candy")
toggle2("Auto Kill Jack O Lantern", Section10, "auto_jacko")
toggle2("Auto Third Event Bosses", Section10, "auto_third_event")
toggle2("Auto Summon Jack O Lantern [50 Candy]", Section10, "auto_jacko")
toggle2("Auto Kill Skull King", Section10, "auto_skull")
local Section11 = worldBossesTab:AddSection(
	"",
	"Main Bosses",
	"auto farm cady any sea auto spawn bosses",
	"rbxassetid://6034684949"
)
Section11:AddSeperator("Server Hop")
Section11:MultiDropdown(
	"Select World Boss to Hop",
	{
		tbl7["Jack o lantern [Lv. 10000]"] or "Jack o lantern [Lv. 10000]",
		tbl7["King Samurai [Lv. 3500]"] or "King Samurai [Lv. 3500]",
		tbl7["Dragon [Lv. 5000]"] or "Dragon [Lv. 5000]",
		tbl7["Ms. Mother [Lv. 7500]"] or "Ms. Mother [Lv. 7500]",
		tbl7["Lord of Saber [Lv. 8500]"] or "Lord of Saber [Lv. 8500]",
		tbl7["Bushido Ape [Lv. 5000]"] or "Bushido Ape [Lv. 5000]"
	},
	_G.Settings.selectbosss or {},
	function(selectbosss1)
		_G.Settings.selectbosss = selectbosss1
		print("Selected entities: ", table.concat(_G.Settings.selectbosss or {}, ", "))
		SaveSettings()
	end
)
Toggle("Auto Hop Until Found World Boss", Section11, "auto_hop_boss")
Section11:Slider(
	"Hop Delay (seconds)",
	0,
	60,
	_G.Settings.HopDelay or 15,
	function(hopDelay)
		_G.Settings.HopDelay = hopDelay
		SaveSettings()
	end
)
Section11:AddSeperator("Minion")
local Label8 = Section11:AddLabel("Status : " .. _G.redcircle)
task.spawn(function()
	while task.wait(1) do
		Label8:Set(
			tbl4.find({"Minion", "Boss"}) and "Check Minion Mon: " .. _G.greencircle
				or "Check Minion Mon: " .. _G.redcircle
		)
	end
end)
Toggle("Auto Kill Minion", Section11, "Auto_Kill_Minion1")
Section11:AddToggle(
	"Auto Hop Minion",
	false,
	function(_)
		HopServer()
	end
)

if Sea1 then
	Section11:AddSeperator("Saber")
	local Label9 = Section11:AddLabel("Status : " .. _G.redcircle)
	task.spawn(function()
		while task.wait(1) do
			Label9:Set(
				tbl4.find({"Expert Swordman [Lv. 3000]"})
					and "Check Expert Swordman Mon: " .. _G.greencircle
					or "Check Expert Swordman Mon: " .. _G.redcircle
			)
		end
	end)
	Toggle("Auto Kill Expert Swordman", Section11, "Auto_Expert_Swordman1")
end

if Sea2 then
	Section11:AddSeperator("Kaido Boss")
	local Label10 = Section11:AddLabel("Status : " .. _G.redcircle)
	task.spawn(function()
		while task.wait(1) do
			Label10:Set(
				tbl4.find({"Dragon [Lv. 5000]"}) and "Check Dragon Mon: " .. _G.greencircle
					or "Check Dragon Mon: " .. _G.redcircle
			)
		end
	end)
	local toggle3 = Toggle
	toggle3("Auto Fully Kaido", Section11, "Auto_Kill_Kaido1")
	toggle3("Auto Summon Kaido", Section11, "Auto_Spawn_Kaido")
	Section11:AddToggle(
		"Auto Hop Kaido",
		false,
		function(_)
			Serverhop()
		end
	)
	Section11:AddSeperator("Big Mom")
	local Label11 = Section11:AddLabel("Status : " .. _G.redcircle)
	task.spawn(function()
		while task.wait(1) do
			Label11:Set(
				tbl4.find({"Ms. Mother [Lv. 7500]"}) and "Check BigMom Mon: " .. _G.greencircle
					or "Check BigMom Mon: " .. _G.redcircle
			)
		end
	end)
	Toggle("Auto Kill BigMom", Section11, "Auto_Kill_BigMom")
	Section11:AddToggle(
		"Auto Big Mom Hop",
		false,
		function(_)
			Serverhop()
		end
	)
	Section11:AddSeperator("King Samurai")
	local Label12 = Section11:AddLabel("Status : " .. _G.redcircle)
	task.spawn(function()
		while task.wait(1) do
			Label12:Set(
				tbl4.find({"King Samurai [Lv. 3500]"})
					and "Check King Samurai Mon: " .. _G.greencircle
					or "Check King Samurai Mon: " .. _G.redcircle
			)
		end
	end)
	Toggle("Auto Kill King Samurai", Section11, "King_Samurai")
	Section11:AddToggle(
		"Auto King Samurai Hop",
		false,
		function(_)
			Serverhop()
		end
	)
end

if Sea3 then
	Section11:AddSeperator("Lord Of Saber")
	local Label13 = Section11:AddLabel("Status : " .. _G.redcircle)
	task.spawn(function()
		while task.wait(1) do
			Label13:Set(
				tbl4.find({"Lord of Saber [Lv. 8500]"})
					and "Check Lord Of Saber Mon: " .. _G.greencircle
					or "Check Lord Of Saber Mon: " .. _G.redcircle
			)
		end
	end)
	Toggle("Auto Kill Lord of Saber", Section11, "auto_lordsaber")
	Section11:AddToggle(
		"Auto Hop Lord of Saber",
		false,
		function(_)
			Serverhop()
		end
	)
	Section11:AddSeperator("Bushido Ape")
	local Label14 = Section11:AddLabel("Status : " .. _G.redcircle)
	task.spawn(function()
		while task.wait(1) do
			Label14:Set(
				tbl4.find({"Bushido Ape [Lv. 5000]"})
					and "Check Bushido Ape Mon: " .. _G.greencircle
					or "Check Bushido Ape Mon: " .. _G.redcircle
			)
		end
	end)
	Toggle("Auto Kill Bushido Ape", Section11, "auto_bushido")
	Section11:AddToggle(
		"Auto Hop Bushido Ape",
		false,
		function(_)
			Serverhop()
		end
	)
end

if Sea1 then
	_G.sesas = "First Sea"
elseif Sea2 then
	_G.sesas = "Second Sea"
elseif Sea3 then
	_G.sesas = "Third Sea"
end

local Section12 = seaEventTab:AddSection(
	"",
	_G.sesas .. " Event",
	"auto kill sea event bosses in any sea!",
	"http://www.roblox.com/asset/?id=6035078898"
)

if Sea1 then
	Section12:AddLabel("No Sea Event on First Sea!!")
end

Section12:AddSeperator("Server Hop")
Section12:MultiDropdown(
	"Select Sea Monster to Hop",
	{
		tbl8.SeaDragon or "SeaDragon",
		tbl8.FuryTentacle or "FuryTentacle",
		tbl8["ThirdSeaEldritch Crab"] or "ThirdSeaEldritch Crab",
		tbl8.ThirdSeaDragon or "ThirdSeaDragon",
		tbl8["Skull King"] or "Skull King",
		tbl8.SeaKing or "SeaKing",
		tbl8.HydraSeaKing or "HydraSeaKing",
		tbl8["Ghost Ship"] or "Ghost Ship"
	},
	_G.Settings.SelectedEntities or {},
	function(selectedEntities)
		_G.Settings.SelectedEntities = selectedEntities
		print("Selected entities: ", table.concat(selectedEntities, ", "))
		SaveSettings()
	end
)
Toggle("Auto Hop Until Found Sea Monster", Section12, "auto_hop")
Section12:Slider(
	"Hop Delay (seconds)",
	0,
	60,
	_G.Settings.HopDelay or 15,
	function(hopDelay)
		_G.Settings.HopDelay = hopDelay
		SaveSettings()
	end
)

if Sea2 then
	local function func11()
		local SeaKing = game:GetService("Workspace").SeaMonster:FindFirstChild("SeaKing")

		if SeaKing and SeaKing:FindFirstChild("Humanoid") then
			local Humanoid = SeaKing.Humanoid
			local v1 = Humanoid.Health / Humanoid.MaxHealth * 100
			return
				string.format(
					"✅ %d / %d HP (%.0f%%)",
					math.floor(Humanoid.Health),
					math.floor(Humanoid.MaxHealth),
					v1
				)
		end

		return "❌ 0 / 0 HP (0%)"
	end

	local function func12()
		local GhostMonster = game.Workspace:FindFirstChild("GhostMonster")
		local str = "❌ 0 / 0 HP (0%)"

		if not GhostMonster then
			return "❌ 0 / 0 HP (0%)"
		end

		for _, child in pairs(GhostMonster:GetChildren()) do
			if child:IsA("Model") and child:FindFirstChild("Humanoid") then
				local Humanoid = child.Humanoid
				local v1 = Humanoid.Health / Humanoid.MaxHealth * 100
				str = string.format(
					"✅ %d / %d HP (%.0f%%)",
					math.floor(Humanoid.Health),
					math.floor(Humanoid.MaxHealth),
					v1
				)
			end
		end

		return str
	end

	Section12:AddSeperator("Sea King")
	local Label15 = Section12:AddLabel("Status : " .. _G.redcircle)
	task.spawn(function()
		while task.wait(1) do
			Label15:Set(
				tbl4.find({"SeaKing"}) and "Check Sea king Mon: " .. _G.greencircle
					or "Check Sea King Mon: " .. _G.redcircle
			)
		end
	end)
	local Label16 = Section12:AddLabel("HP : N/A")
	local Label17 = Section12:AddLabel("Next Spawn : N/A")
	task.spawn(function()
		while task.wait(1) do
			pcall(function()
				Label16:Set("HP : " .. func11())
				local seaMonsterSpawnText = game:GetService("ReplicatedStorage")
					:GetAttribute("SeaMonsterSpawnText")

				if seaMonsterSpawnText and seaMonsterSpawnText:match("^(%d+):(%d+):(%d+)$") then
					local v1, v2, v3 = seaMonsterSpawnText:match("(%d+):(%d+):(%d+)")
					Label17:Set(
						"Next Spawn : "
							.. string.format(
								"%02dh %02dm %02ds",
								tonumber(v1),
								tonumber(v2),
								tonumber(v3)
							)
					)
				else
					Label17:Set("Next Spawn : " .. Formatted_SeaKingTime)
				end
			end)
		end
	end)
	Toggle("Auto Kill Sea King", Section12, "Auto_Kill_Sea_King1")
	Section12:AddSeperator("Hydra Boss")
	local Label18 = Section12:AddLabel("Status : " .. _G.redcircle)
	task.spawn(function()
		while task.wait(1) do
			Label18:Set(
				tbl4.find({"HydraSeaKing"}) and "Check Hydra Sea King Mon: " .. _G.greencircle
					or "Check Hydra Sea King Mon: " .. _G.redcircle
			)
		end
	end)
	Toggle("Auto Kill Hydra Boss", Section12, "Auto_Kill_Hydar_Sea_King1")
	Section12:AddSeperator("Ghost Ship")
	local Label19 = Section12:AddLabel("Status : " .. _G.redcircle)
	task.spawn(function()
		while task.wait(1) do
			Label19:Set(
				tbl4.find({"Ghost Ship"}) and "Check Ghost Ship Mon: " .. _G.greencircle
					or "Check Ghost Ship Mon: " .. _G.redcircle
			)
		end
	end)
	local Label20 = Section12:AddLabel("HP : N/A")
	local Label21 = Section12:AddLabel("Next Spawn : N/A")
	task.spawn(function()
		while task.wait(1) do
			pcall(function()
				Label20:Set("HP : " .. func12())
				local ghostShipSpawnText = game:GetService("ReplicatedStorage")
					:GetAttribute("GhostShipSpawnText")

				if ghostShipSpawnText and ghostShipSpawnText:match("^(%d+):(%d+):(%d+)$") then
					local v1, v2, v3 = ghostShipSpawnText:match("(%d+):(%d+):(%d+)")
					Label21:Set(
						"Next Spawn : "
							.. string.format(
								"%02dh %02dm %02ds",
								tonumber(v1),
								tonumber(v2),
								tonumber(v3)
							)
					)
				else
					Label21:Set("Next Spawn : N/A")
				end
			end)
		end
	end)
	Toggle("Auto Attack Ghost Ship", Section12, "Auto_Kill_GhostMonster1")
end

if Sea3 then
	local Label22 = Section12:AddLabel("🌑 Blood Moon Status: ")
	task.spawn(function()
		while task.wait(1) do
			pcall(function()
				local v1, v2, v3 = game:GetService(
					"Lighting"
				).TimeOfDay:match("^(%d+):(%d+):(%d+)$")
				local num = tonumber(v1)
				local num1 = tonumber(v2)
				local num2 = tonumber(v3)
				local v4 = game:GetService("Lighting"):GetAttribute("Day") or 1

				if v4 == 3 and 6 <= num then
					local v5 = num - 6
					Label22:Set(
						string.format("🌑 Blood Moon Starting In: %02dH:%02dM:%02dS", v5, num1, num2)
					)
				else
					local v6 = 3 - v4

					if v6 < 0 then
						v6 = v6 + 7
					end

					local v7 = v6 * 24 + (6 - num - 1)

					if v7 < 0 then
						v7 = v7 + 24
					end

					local v8 = 59 - num1

					if 59 - num2 == 59 then
						v8 = v8 + 1
					end

					Label22:Set(
						string.format(
							"🌑 Blood Moon Active: %02dH:%02dM:%02dS",
							math.floor(v7 / 24),
							v7 % 24,
							v8
						)
					)
				end
			end)
		end
	end)
	local Label23 = Section12:AddLabel("Next Spawn: N/A")
	task.spawn(function()
		while task.wait(1) do
			pcall(function()
				local thirdSeaMonsterSpawnText = game:GetService("ReplicatedStorage")
					:GetAttribute("ThirdSeaMonsterSpawnText")
				if thirdSeaMonsterSpawnText then
					if thirdSeaMonsterSpawnText:match("^(%d+):(%d+):(%d+)$") then
						local v1, v2, v3 = thirdSeaMonsterSpawnText:match("(%d+):(%d+):(%d+)")
						Label23:Set(
							string.format(
								"🌊 SeaEventTime Spawn in: %02dH:%02dM:%02dS",
								tonumber(v1),
								tonumber(v2),
								tonumber(v3)
							)
						)
					else
						Label23:Set("🌊 SeaEventTime Next Spawn: " .. thirdSeaMonsterSpawnText)
					end
				else
					Label23:Set("🌊 SeaEventTime Next Spawn: " .. thirdSeaMonsterSpawnText)
				end
			end)
		end
	end)
	Section12:AddSeperator("Abyssal Tyrant")
	local Label24 = Section12:AddLabel("Status : " .. _G.redcircle)
	task.spawn(function()
		while task.wait(1) do
			Label24:Set(
				tbl4.find({"SeaDragon"}) and "Check Abyssal TyrantMon: " .. _G.greencircle
					or "Check Abyssal TyrantMon: " .. _G.redcircle
			)
		end
	end)
	Toggle("Auto Kill Abyssal Tyrant", Section12, "Abyssal_Tyrant")
	Section12:AddSeperator("Chaos Kraken Boss")
	local Label25 = Section12:AddLabel("Status : " .. _G.redcircle)
	task.spawn(function()
		while task.wait(1) do
			Label25:Set(
				tbl4.find({"FuryTentacle"}) and "Check Chaos Kraken Mon: " .. _G.greencircle
					or "Check Chaos Kraken Mon: " .. _G.redcircle
			)
		end
	end)
	Toggle("Auto Kill Chaos Kraken Boss", Section12, "Chaos_Kraken")
	Section12:AddSeperator("Deepsea Crusher")
	local Label26 = Section12:AddLabel("Status : " .. _G.redcircle)
	task.spawn(function()
		while task.wait(1) do
			Label26:Set(
				tbl4.find({"ThirdSeaEldritch Crab"})
					and "Check Deepsea Crusher Mon: " .. _G.greencircle
					or "Check Deepsea Crusher Mon: " .. _G.redcircle
			)
		end
	end)
	Toggle("Auto Kill Deepsea Crusher Boss", Section12, "Deepsea_Crusher")
	Section12:AddSeperator("Drakenfyr")
	local Label27 = Section12:AddLabel("Status : " .. _G.redcircle)
	task.spawn(function()
		while task.wait(1) do
			Label27:Set(
				tbl4.find({"ThirdSeaDragon"}) and "Check Drakenfyr Mon: " .. _G.greencircle
					or "Check Drakenfyr Mon: " .. _G.redcircle
			)
		end
	end)
	Toggle("Auto Kill Drakenfyr the Inferno King", Section12, "auto_draken")
end

local settingsSection = configsFarmTab:AddSection(
	"Settings",
	"Script Made By Akuma",
	"Join Akuma Hub Discord For Updates! \nuse at your own risk.",
	"http://www.roblox.com/asset/?id=6031233840"
)
pcall(function()
	local discordCopy = Instance.new("TextButton")
	discordCopy.Name = "DiscordCopy"
	discordCopy.BackgroundTransparency = 1
	discordCopy.Text = ""
	discordCopy.Size = UDim2.new(1, 0, 1, 0)
	discordCopy.ZIndex = 30
	discordCopy.Parent = settingsSection.Header
	discordCopy.MouseButton1Click:Connect(function()
		local flag = false
		pcall(function()
			local v1 =
				setclipboard
					or toclipboard
					or syn and syn.write_clipboard
					or Clipboard and Clipboard.set
			if v1 then
				v1("https://discord.gg/2kuMQyQPfB")
				flag = true
			end
		end)
		pcall(function()
			game:GetService("StarterGui")
				:SetCore(
					"SendNotification",
					{
						Title = "Akuma Hub",
						Text = flag and "Link do Discord copiado!"
							or "https://discord.gg/2kuMQyQPfB",
						Duration = 4
					}
				)
		end)
	end)
end)
Dropdown(
	"Select Weapon ",
	{"Melee", "Sword", "Fruit Power", "all In One"},
	settingsSection,
	"Select_Weapon"
)
settingsSection:AddDropdown(
	"Position Farm",
	{"Above", "Beside", "Lower"},
	_G.Settings.PositionFarm,
	function(positionFarm)
		_G.Settings.PositionFarm = positionFarm
		SaveSettings()
	end
)
settingsSection:Slider(
	"DisFarm",
	0,
	100,
	_G.Disfarm or 7.5,
	function(disfarm)
		_G.Disfarm = disfarm
	end
)
Toggle("Bring Mob (Work 80%)", settingsSection, "Bring_Nearest_Mobs_Together")

function EnableBuso()
	local v1 = Client and Client.Character

	repeat
		wait()
	until v1 or not v1 and tick() - RecentlySpawn > RespawnTime

	if
		not (v1:WaitForChild("Services"):FindFirstChild("Haki")
			and v1:WaitForChild("Services"):FindFirstChild("Haki").Value == 0)
	then
		return
	end

	game:GetService("ReplicatedStorage").Chest.Remotes.Events.Armament:FireServer()

	repeat
		wait(1)
	until v1:WaitForChild("Services"):FindFirstChild("Haki").Value == 1
end

settingsSection:AddToggle(
	"Enable Buso",
	true,
	function(enableBuso)
		_G.Settings.EnableBuso = enableBuso
		print("Toggle Enable Buso is:", _G.Settings.EnableBuso)
		spawn(function()
			while _G.Settings.EnableBuso do
				EnableBuso()
				wait(0.4)
			end
		end)
		SaveSettings()
	end
)
settingsSection:AddToggle(
	"Auto Active Observation Haki",
	_G.Settings.ObservationHak,
	function(observationHak)
		_G.Settings.ObservationHak = observationHak
		SaveSettings()
	end
)
Toggle(
	"White screen ",
	settingsSection,
	function(arg1)
		game:GetService("RunService"):Set3dRenderingEnabled(not arg1)
	end
)
settingsSection:AddToggle(
	"Auto Hide Level Up Text",
	_G.AutoHideLevelText,
	function(autoHideLevelText)
		_G.AutoHideLevelText = autoHideLevelText
	end
)
spawn(function()
	while true do
		if _G.AutoHideLevelText then
			local LevelUp = game:GetService("ReplicatedStorage")
				:WaitForChild("Chest")
				:WaitForChild("Gui")
				:WaitForChild("LevelUp")

			if LevelUp then
				LevelUp.Visible = false
			end

			local ItemDrop = game:GetService("ReplicatedStorage")
				:WaitForChild("Chest")
				:WaitForChild("Gui")
				:WaitForChild("ItemDrop")

			if ItemDrop then
				ItemDrop.Visible = false
			end
		end
		wait(1)
	end
end)
_G.autohidehealth = _G.autohidehealth or false

local tbl15 = {
	workspace.Monster.Boss,
	workspace.Monster.Mon,
	game:GetService("ReplicatedStorage").MOB
}

local function func13(arg1)
	for _, v1 in ipairs(tbl15) do
		for _, child in ipairs(v1:GetChildren()) do
			local BillboardGui = child:FindFirstChild("BillboardGui")

			if BillboardGui then
				BillboardGui.Enabled = not arg1
			end

			local Humanoid = child:FindFirstChild("Humanoid")

			if Humanoid then
				Humanoid.DisplayDistanceType =
					arg1 and Enum.HumanoidDisplayDistanceType.None
						or Enum.HumanoidDisplayDistanceType.Viewer
			end
		end
	end
end

settingsSection:AddToggle(
	"Auto Hide Mob Health",
	_G.autohidehealth,
	function(autohidehealth)
		_G.autohidehealth = autohidehealth

		if _G.autohidehealth then
			spawn(function()
				while _G.autohidehealth do
					func13(true)
					task.wait(1)
				end
				func13(false)
			end)
		else
			func13(false)
		end

		SaveSettings()
	end
)
settingsSection:AddToggle(
	"Delete Damage Text",
	_G.DeleteDamage,
	function(delete)
		_G.Delete = delete
	end
)
settingsSection:AddToggle(
	"Delete Heavy Effect",
	_G.DeleteEffext,
	function(deleteEffext)
		_G.DeleteEffext = deleteEffext
	end
)
spawn(function()
	while wait() do
		if _G.DeleteDamage then
			pcall(function()
				if not game:GetService("Workspace"):FindFirstChild("DamageShow") then
					return
				end
				game:GetService("Workspace"):FindFirstChild("DamageShow").Parent =
					game:GetService("Workspace").Camera
			end)
		else
			pcall(function()
				if not game:GetService("Workspace").Camera:FindFirstChild("DamageShow") then
					return
				end
				game:GetService(
					"Workspace"
				).Camera:FindFirstChild("DamageShow").Parent = game:GetService("Workspace")
			end)
		end
	end
end)
spawn(function()
	while wait() do
		if _G.DeleteEffext then
			pcall(function()
				if not game:GetService("Workspace"):FindFirstChild("Effects") then
					return
				end
				game:GetService("Workspace"):FindFirstChild("Effects").Parent =
					game:GetService("Workspace").Camera
			end)
		else
			pcall(function()
				if not game:GetService("Workspace").Camera:FindFirstChild("Effects") then
					return
				end
				game:GetService(
					"Workspace"
				).Camera:FindFirstChild("Effects").Parent = game:GetService("Workspace")
			end)
		end
	end
end)

function KenHaki()
	if not game.Players.LocalPlayer.Character then
		return
	end
	pcall(function()
		local VirtualInputManager = game:GetService("VirtualInputManager")
		VirtualInputManager:SendKeyEvent(true, "Y", false, game)
		task.wait(0.1)
		VirtualInputManager:SendKeyEvent(false, "Y", false, game)
	end)
end

spawn(function()
	while task.wait() do
		if _G.Settings.ObservationHak then
			pcall(function()
				KenHaki()
			end)
		end
	end
end)
settingsSection:AddSeperator("Auto Use Skill")
settingsSection:AddToggle(
	"Use Skill Z",
	_G.Settings.SkillZ,
	function(skillZ)
		_G.Settings.SkillZ = skillZ
		SaveSettings()
	end
)
settingsSection:AddToggle(
	"Use Skill X",
	_G.Settings.SkillX,
	function(skillX)
		_G.Settings.SkillX = skillX
		SaveSettings()
	end
)
settingsSection:AddToggle(
	"Use Skill C",
	_G.Settings.SkillC,
	function(skillC)
		_G.Settings.SkillC = skillC
		SaveSettings()
	end
)
settingsSection:AddToggle(
	"Use Skill V",
	_G.Settings.SkillV,
	function(skillV)
		_G.Settings.SkillV = skillV
		SaveSettings()
	end
)
settingsSection:AddToggle(
	"Use Skill B",
	_G.Settings.SkillB,
	function(skillB)
		_G.Settings.SkillB = skillB
		SaveSettings()
	end
)
settingsSection:AddToggle(
	"Use Skill E",
	_G.Settings.SkillE,
	function(skillE)
		_G.Settings.SkillE = skillE
		SaveSettings()
	end
)
settingsSection:AddSeperator("Hold Skill")
settingsSection:Slider(
	"Hold Z",
	0,
	100,
	tbl2.Z,
	function(z)
		tbl2.Z = z
		SaveSettings()
	end
)
settingsSection:Slider(
	"Hold X",
	0,
	100,
	tbl2.X,
	function(x)
		tbl2.X = x
		SaveSettings()
	end
)
settingsSection:Slider(
	"Hold C",
	0,
	100,
	tbl2.C,
	function(c)
		tbl2.C = c
		SaveSettings()
	end
)
settingsSection:Slider(
	"Hold V",
	0,
	100,
	tbl2.V,
	function(v1)
		tbl2.V = v1
		SaveSettings()
	end
)
settingsSection:Slider(
	"Hold B",
	0,
	100,
	tbl2.B,
	function(b)
		tbl2.B = b
		SaveSettings()
	end
)
settingsSection:Slider(
	"Hold E",
	0,
	100,
	tbl2.E,
	function(e)
		tbl2.E = e
		SaveSettings()
	end
)
local flag1 = false
local flag2 = false
local flag3 = false
local flag4 = false
local Label28 = Section:AddLabel("")
spawn(function()
	while task.wait() do
		Label28:Set(
			"Your Points: "
				.. tostring(game:GetService("Players").LocalPlayer.PlayerStats.Points.Value)
		)
	end
end)
spawn(function()
	while task.wait() do
		for _, v1 in ipairs({"Melee", "Defense", "Sword", "Fruit"}) do
			if
				v1 == "Melee" and flag1
					or (v1 == "Defense" and flag2
						or (v1 == "Sword" and flag3 or v1 == "Fruit" and flag4))
			then
				local tbl = {v1, 1}
				pcall(function()
					local MainGui = Client.PlayerGui:FindFirstChild("MainGui")
					local v1 = MainGui and MainGui:FindFirstChild("StarterFrame")
					local v2 = v1 and v1:FindFirstChild("StatsFrame")

					if v2 and v2:FindFirstChild("RemoteEvent") then
						v2.RemoteEvent:FireServer(unpack(tbl))
					end
				end)
			end
		end
	end
end)
local Label29 = Section:AddLabel("")
local Label30 = Section:AddLabel("")
local Label31 = Section:AddLabel("")
local Label32 = Section:AddLabel("")
local Label33 = Section:AddLabel("")
spawn(function()
	while task.wait(0.1) do
		Label29:Set(
			"Level : " .. tostring(game:GetService("Players").LocalPlayer.PlayerStats.lvl.Value)
		)
		Label30:Set(
			"Melee : " .. tostring(game:GetService("Players").LocalPlayer.PlayerStats.Melee.Value)
		)
		Label31:Set(
			"Defense : "
				.. tostring(game:GetService("Players").LocalPlayer.PlayerStats.Defense.Value)
		)
		Label32:Set(
			"Sword : " .. tostring(game:GetService("Players").LocalPlayer.PlayerStats.sword.Value)
		)
		Label33:Set(
			"Devil Fruit : "
				.. tostring(game:GetService("Players").LocalPlayer.PlayerStats.DF.Value)
		)
	end
end)
Section:AddToggle(
	"Melee",
	flag1,
	function(arg1)
		flag1 = arg1
	end
)
Section:AddToggle(
	"Defense",
	flag2,
	function(arg1)
		flag2 = arg1
	end
)
Section:AddToggle(
	"Sword",
	flag3,
	function(arg1)
		flag3 = arg1
	end
)
Section:AddToggle(
	"Devil Fruit",
	flag4,
	function(arg1)
		flag4 = arg1
	end
)
PlayerName = {}
local v24, v25, v26 = pairs(game.Players:GetChildren())
settingsSection = v24
LocalPlayer2 = v26

while true do
	local v27, v28 = settingsSection(v25, LocalPlayer2)
	LocalPlayer2 = v27

	if LocalPlayer2 == nil then
		break
	end

	if v28.Name ~= game.Players.LocalPlayer.Name then
		table.insert(PlayerName, v28.Name)
	end
end

local selectPlayersDropdown = Section1:AddDropdown(
	"Select Players",
	PlayerName,
	"",
	function(selectPly)
		_G.SelectPly = selectPly
	end
)
Section1:Button(
	"Refresh Player",
	function()
		newPlayerName = {}

		for _, child in pairs(game.Players:GetChildren()) do
			if child.Name ~= game.Players.LocalPlayer.Name then
				table.insert(newPlayerName, child.Name)
			end
		end

		selectPlayersDropdown:Refresh(newPlayerName)
	end
)
Section1:AddToggle(
	"Spectate Player",
	Spectate,
	function(arg1)
		Spectate = arg1
		local Humanoid = game.Players.LocalPlayer.Character.Humanoid
		local v1 = game.Players:FindFirstChild(_G.SelectPly)

		repeat
			task.wait()
			game.Workspace.Camera.CameraSubject = v1.Character.Humanoid
		until Spectate == false

		game.Workspace.Camera.CameraSubject = Humanoid
	end
)
Section1:Button(
	"Teleport",
	function()
		Tp(game.Players[_G.SelectPly].Character.HumanoidRootPart.CFrame)
	end
)
Section1:AddToggle(
	"Auto Kill Player",
	_G.AutoKillply,
	function(autoKillply)
		_G.AutoKillply = autoKillply
		CancelTween(_G.AutoKillply)
	end
)
spawn(function()
	while wait() do
		pcall(function()
			if
				not (_G.AutoKillply
					and (game.Players:FindFirstChild(_G.SelectPly)
						and game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health
							> 0))
			then
				return
			end
			repeat
				task.wait()
				Attack()
				Tp(
					game.Players:FindFirstChild(_G.SelectPly).Character.HumanoidRootPart.CFrame
						* Farm_Mode
				)
			until
				game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid.Health <= 0
					or not _G.AutoKillply
					or not game.Players:FindFirstChild(_G.SelectPly)
		end)
	end
end)
Section2:AddSeperator("Server")
Section2:Button(
	"Rejoin Server",
	function()
		local TeleportService = game:GetService("TeleportService")
		TeleportService:Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
	end
)
Section2:Button(
	"Server Hop",
	function()
		Hop()
	end
)

function Hop()
	local PlaceId = game.PlaceId
	local tbl = {}
	local str = ""
	local hour = os.date("!*t").hour

	function TPReturner()
		local v2

		if str ~= "" then
			local ok, result = pcall(
				game.HttpGet,
				game,
				"https://games.roblox.com/v1/games/"
					.. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. str
			)
			local v1 = ok and game.HttpService:JSONDecode(result)

			if not v1 then
				local tbl1 = {data = {}}
				tbl1.nextPageCursor = nil
				v1 = tbl1
			end

			v2 = v1
		else
			local ok1, result1 = pcall(
				game.HttpGet,
				game,
				"https://games.roblox.com/v1/games/"
					.. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
			)
			local v3 = ok1 and game.HttpService:JSONDecode(result1)

			if not v3 then
				local tbl2 = {data = {}}
				tbl2.nextPageCursor = nil
				v3 = tbl2
			end

			v2 = v3
		end

		if v2.nextPageCursor then
			if v2.nextPageCursor ~= "null" and v2.nextPageCursor ~= nil then
				str = v2.nextPageCursor
			end
		end

		local num = 0

		for _, v4 in pairs(v2.data) do
			local flag = true
			local str1 = tostring(v4.id)

			if tonumber(v4.maxPlayers) > tonumber(v4.playing) then
				for _, v5 in pairs(tbl) do
					if num == 0 then
						if tonumber(hour) ~= tonumber(v5) then
							pcall(function()
								tbl = {}
								table.insert(tbl, hour)
							end)
						end
					else
						local str2 = tostring(v5)
						if str1 == str2 then
							flag = false
						end
					end
					num = num + 1
				end
				if flag == true then
					table.insert(tbl, str1)
					wait(0.1)
					pcall(function()
						wait()
						game:GetService("TeleportService")
							:TeleportToPlaceInstance(PlaceId, str1, game.Players.LocalPlayer)
					end)
					wait(0.1)
				end
			end
		end
	end

	function Teleport()
		while wait(0.1) do
			pcall(function()
				TPReturner()

				if str == "" then
					return
				end

				TPReturner()
			end)
		end
	end

	Teleport()
end

Section2:Button(
	"Teleport To Lower Server",
	function()
		local huge = math.huge
		local v1 =
			"https://games.roblox.com/v1/games/"
				.. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
		local id
		local v2

		if not _G.FailedServerID then
			_G.FailedServerID = {}
		end

		local function func()
			v2 = game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(v1))
			for _, v3 in pairs(v2.data) do
				pcall(function()
					if
						type(v3) ~= "table"
							or (not v3.id
								or (not v3.playing
									or (tonumber(huge) <= tonumber(v3.playing)
										or table.find(_G.FailedServerID, v3.id))))
					then
						return
					end

					huge = v3.playing
					id = v3.id
				end)
			end
		end

		function getservers()
			pcall(func)
			for k, v3 in pairs(v2) do
				if k == "nextPageCursor" then
					if v1:find("&cursor=") then
						v1 = v1:gsub(v1:sub((v1:find("&cursor="))), "")
					end

					v1 = v1 .. "&cursor=" .. v3
					pcall(getservers)
				end
			end
		end

		pcall(getservers)
		wait(0.1)

		if id ~= game.JobId then
			game:GetService("Players"):GetChildren()
		end

		table.insert(_G.FailedServerID, id)
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, id)

		while wait(0.1) do
			pcall(function()
				if not game:IsLoaded() then
					game.Loaded:Wait()
				end
				game.CoreGui.RobloxPromptGui.promptOverlay.DescendantAdded:Connect(function()
					local ErrorPrompt = game.CoreGui.RobloxPromptGui.promptOverlay:FindFirstChild(
						"ErrorPrompt"
					)

					if
						not (ErrorPrompt
							and ErrorPrompt.TitleFrame.ErrorTitle.Text == "Disconnected")
					then
						return
					end

					if #game.Players:GetPlayers() > 1 then
						local TeleportService = game:GetService("TeleportService")
						TeleportService:TeleportToPlaceInstance(
							game.PlaceId,
							game.JobId,
							game.Players.LocalPlayer
						)
					else
						game.Players.LocalPlayer:Kick("\nRejoining...")
						wait(0.1)
						local TeleportService1 = game:GetService("TeleportService")
						TeleportService1:Teleport(game.PlaceId, game.Players.LocalPlayer)
					end
				end)
			end)
		end
	end
)
Section2:Textbox(
	"Join Server(Join Discord!)",
	"Enter Job ID",
	function(arg1)
		local v1 = arg1

		if type(arg1) == "string" and #arg1 >= 7 then
			if arg1:sub(1, 7) == "ZenHub_" then
				v1 = arg1:sub(8)
			end
		end

		if v1 and v1 ~= "" then
			local ok, result = pcall(function()
				game:GetService("TeleportService")
					:TeleportToPlaceInstance(game.PlaceId, v1, game.Players.LocalPlayer)
			end)
			if ok then
				print("Successfully teleported to", v1)
			else
				warn("Teleport failed:", result)
			end
		else
			warn("Invalid Job ID.")
		end
	end
)
Section2:AddToggle(
	"Teleport First Sea",
	false,
	function()
		local ElitePirate = workspace.AllNPC:FindFirstChild("Elite Pirate")
		if ElitePirate then
			toQuest(ElitePirate.CFrame, "Elite Pirate")
		else
			warn("Elite Pirate not found")
		end
	end
)
Section2:AddToggle(
	"Teleport Second Sea",
	false,
	function()
		local v1 =
			workspace.AllNPC:FindFirstChild("Elite Pirate")
				or workspace.AllNPC:FindFirstChild("Traveler")
		if v1 then
			toQuest(v1.CFrame, "Elite Pirate")
		else
			warn("Sea2 NPC not found")
		end
	end
)
Section2:AddToggle(
	"Teleport Third Sea",
	false,
	function()
		local TheSquid = workspace.AllNPC:FindFirstChild("The Squid")
		if TheSquid then
			toQuest(TheSquid.CFrame, "The Squid")
		else
			warn("The Squid not found")
		end
	end
)
Section2:AddSeperator("Teleport Island")
local v29, v30, v31 = pairs(game:GetService("Workspace").Areas:GetChildren())
settingsSection = v29
LocalPlayer2 = v31
local tbl16 = {}

while true do
	local v32, v33 = settingsSection(v30, LocalPlayer2)
	LocalPlayer2 = v32

	if LocalPlayer2 == nil then
		break
	end

	if v33.Name ~= "Sea of dust" then
		table.insert(tbl16, v33.Name)
	end
end

local str2 = "None"
Section2:AddDropdown(
	"Island Select",
	tbl16,
	"",
	function(arg1)
		str2 = arg1
	end
)
Section2:Button(
	"Teleport To Island",
	function()
		if str2 == "None" then
			warn("Please select an island.")
		else
			for _, child in pairs(game:GetService("Workspace").Areas:GetChildren()) do
				if child.Name == str2 then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
						child.CFrame * CFrame.new(0, 300, 0)
					break
				end
			end
		end
	end
)
Section3:AddLabel("Npc Teleport")
local v34, v35, v36 = pairs(game:GetService("Workspace").AllNPC:GetChildren())
settingsSection = v34
LocalPlayer2 = v36
local tbl17 = {}

while true do
	local v37, v38 = settingsSection(v35, LocalPlayer2)
	LocalPlayer2 = v37

	if LocalPlayer2 == nil then
		break
	end

	table.insert(tbl17, v38.Name)
end

local selectNPCDropdown = Section3:AddDropdown(
	"Select NPC",
	Colossuem and {""} or tbl17,
	"",
	function(arg1)
		SelectedNpc = arg1
	end
)
Section3:Button(
	"Teleport To NPC",
	function()
		for _, child in pairs(game:GetService("Workspace").AllNPC:GetChildren()) do
			if SelectedNpc == child.Name then
				tp1(child.CFrame)
			end
		end
	end
)
Section3:Button(
	"Refresh Npc",
	function()
		local v1, v2, v3 = pairs(game:GetService("Workspace").AllNPC:GetChildren())
		local v4 = v3
		local tbl = {}

		while true do
			local v5, v6 = v1(v2, v4)
			v4 = v5

			if v5 == nil then
				break
			end

			table.insert(tbl, v6.Name)
		end

		selectNPCDropdown:Add(tbl)
	end
)
Section4:AddSeperator("Keys")
_G.selectedBuyKey = _G.selectedBuyKey or "Copper Key"
_G.buyAmount = 1
_G.buykey = _G.buykey or false
Section4:AddDropdown(
	"Select key to buy",
	{"Iron Key", "Copper Key", "Gold Key"},
	_G.selectedBuyKey,
	function(selectedBuyKey)
		_G.selectedBuyKey = selectedBuyKey
	end
)
Section4:AddToggle(
	"Auto-buy selected key",
	_G.buykey,
	function(buykey)
		_G.buykey = buykey

		if not _G.buykey then
			return
		end

		spawn(function()
			while _G.buykey do
				BuyKey(_G.selectedBuyKey, _G.buyAmount)
				wait(1)
			end
		end)
	end
)

function BuyKey(arg1, arg2)
	local tbl = {arg1, arg2}
	local ok, result = pcall(function()
		return
			game:GetService(
				"ReplicatedStorage"
			).Chest.Remotes.Functions.BuyKey:InvokeServer(unpack(tbl))
	end)

	if ok and result then
		return
	end

	warn("Failed to purchase key:", arg1, "Amount:", arg2, "Error:", result)
end

Section4:AddToggle(
	"Auto open Key",
	_G.openkey,
	function(openkey)
		_G.openkey = openkey
		if _G.openkey then
			if _G.autoOpening then
				return
			end

			_G.autoOpening = true
			task.spawn(function()
				local tbl = {"Iron Key", "Copper Key", "Gold Key"}

				while _G.openkey do
					for _, v1 in ipairs(tbl) do
						OpenKey(v1)
					end
				end

				_G.autoOpening = false
			end)
		else
			_G.autoOpening = false
		end
	end
)

function OpenKey(arg1)
	if not arg1 then
		warn("No key selected")
		return
	end

	local tbl = {arg1, "Open1"}
	local ok, result = pcall(function()
		return
			game:GetService("ReplicatedStorage")
				:WaitForChild("Chest")
				:WaitForChild("Remotes")
				:WaitForChild("Functions")
				:WaitForChild("UseKey")
				:InvokeServer(unpack(tbl))
	end)

	if ok and result then
		return
	end

	warn("Failed to open key:", arg1, "Error:", result)
end

local tbl18 = {
	"SpinFruit",
	"BombFruit",
	"BarrierFruit",
	"HumanFruit",
	"SmokeFruit",
	"SpikeFruit",
	"PawFruit",
	"ShadowFruit",
	"LoveFruit",
	"StringFruit",
	"IceFruit",
	"SandFruit",
	"PhoenixFruit",
	"GumFruit",
	"MagmaFruit",
	"LightFruit",
	"FlameFruit",
	"QuakeFruit",
	"RumbleFruit",
	"GravityFruit",
	"SnowFruit",
	"DoughFruit",
	"ToyFruit",
	"DragonFruit",
	"SpinoFruit",
	"LeopardFruit",
	"BuddhaFruit",
	"OpFruit"
}

_G.autocollectfruit = false
task.spawn(function()
	while true do
		if _G.autocollectfruit then
			pcall(function()
				for _, v1 in pairs(tbl18) do
					local LocalPlayer = game.Players.LocalPlayer
					local PlayerGui = LocalPlayer.PlayerGui

					if
						LocalPlayer.Character:FindFirstChild(v1)
							and not PlayerGui:FindFirstChild("EatFruitBecky")
					then
						print(v1 .. " is equipped but no EatFruitBecky UI found.")
					elseif PlayerGui:FindFirstChild("EatFruitBecky") then
						func3(PlayerGui:FindFirstChild("EatFruitBecky").Dialogue.Collect)
						wait(1)
					elseif LocalPlayer.Backpack:FindFirstChild(v1) then
						func9(v1)
						wait(1)
						Click()
						click()
					else
						warn("Fruit not found: " .. v1)
					end
				end
			end)
		end
		task.wait(1)
	end
end)
Section4:AddToggle(
	"Auto Store Fruit",
	_G.autocollectfruit,
	function(autocollectfruit)
		_G.autocollectfruit = autocollectfruit
		if _G.autocollectfruit then
			print("Auto Collect Fruit: Enabled")
		else
			print("Auto Collect Fruit: Disabled")
		end
	end
)
Section4:AddSeperator("Gacha Fruit")

DevilFruitList = {
	"SpinFruit",
	"BombFruit",
	"BarrierFruit",
	"HumanFruit",
	"SmokeFruit",
	"SpikeFruit",
	"PawFruit",
	"ShadowFruit",
	"LoveFruit",
	"StringFruit",
	"IceFruit",
	"SandFruit",
	"PhoenixFruit",
	"GumFruit",
	"MagmaFruit",
	"LightFruit",
	"FlameFruit",
	"QuakeFruit",
	"RumbleFruit",
	"GravityFruit",
	"SnowFruit",
	"DoughFruit",
	"ToyFruit",
	"DragonFruit",
	"SpinoFruit",
	"LeopardFruit",
	"BuddhaFruit",
	"OpFruit"
}

Section4:AddDropdown(
	"Select Devil Fruit",
	DevilFruitList,
	"",
	function(arg1)
		DevilFruitSelected = arg1
	end
)
Section4:AddToggle(
	"Auto Buy Devil Fruit",
	BuyDevilFruit,
	function(arg1)
		BuyDevilFruit = arg1
	end
)
task.spawn(function()
	while task.wait() do
		if BuyDevilFruit then
			pcall(function()
				if
					not (game:GetService(
						"Players"
					).LocalPlayer.Backpack:FindFirstChild(DevilFruitSelected)
						and game:GetService(
							"Players"
						).LocalPlayer.Character:FindFirstChild(DevilFruitSelected)
							== nil)
				then
					return
				end

				local tbl = {DevilFruitSelected, true}
				game:GetService(
					"ReplicatedStorage"
				).Chest.Remotes.Functions.BuyFruitStock:InvokeServer(unpack(tbl))
			end)
		end
	end
end)
Section4:AddToggle(
	"Bring All Devil Fruit",
	BringDevilFruit,
	function(arg1)
		BringDevilFruit = arg1
	end
)
spawn(function()
	while task.wait() do
		if BringDevilFruit then
			pcall(function()
				local HumanoidRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
				for _, child in pairs(game.Workspace:GetChildren()) do
					if string.find(child.Name, "Fruit") and child:IsA("Tool") then
						child.Handle.CanCollide = false
						child.Handle.CFrame = HumanoidRootPart.CFrame
						wait(0.2)
						firetouchinterest(
							game.Players.LocalPlayer.Character.HumanoidRootPart,
							child.Handle,
							0
						)
					end
				end
			end)
		end
	end
end)
Section4:Button(
	"Teleport To Random Devil Fruit Shop",
	function()
		func1("DFruitShop")
	end
)
Section4:Button(
	"Teleport To Devil Fruit Shop",
	function()
		func1("DFruitShop")
	end
)

if Sea1 then
	Section5:Button(
		"Soru Shop",
		function()
			tp1(CFrame.new(-2519, 75, -2649))
		end
	)
	Section5:Button(
		"Buso Shop",
		function()
			tp1(CFrame.new(1953, 44, 914))
		end
	)
	Section5:Button(
		"Ken Shop",
		function()
			tp1(CFrame.new(-4960, 462, 1175))
		end
	)
	Section5:Button(
		"Katana",
		function()
			tp1(CFrame.new(-2064, 49, -4258))
		end
	)
	Section5:Button(
		"Pipe Sword",
		function()
			tp1(CFrame.new(1519, 18, 1008))
		end
	)
	Section5:Button(
		"Mini Race",
		function()
			tp1(CFrame.new(2505, 282, -1609))
		end
	)
elseif Sea2 then
	Section5:Button(
		"Water Style Shop",
		function()
			tp1(
				CFrame.new(
					-4831.19971,
					57.822052,
					153.415283,
					-0.414802402,
					-5.4852279199999997e-08,
					-0.909911513,
					-5.5834572500000001e-08,
					1,
					-3.48297213e-08,
					0.909911513,
					3.6357068500000003e-08,
					-0.414802402
				)
			)
		end
	)
	Section5:Button(
		"Dragon Claw Shop",
		function()
			tp1(
				CFrame.new(
					-4603.89355,
					337.312164,
					599.383667,
					-0.962977529,
					-4.1851969000000003e-08,
					-0.269581646,
					-5.8163312400000003e-08,
					1,
					5.2518391400000003e-08,
					0.269581646,
					6.6253789999999998e-08,
					-0.962977529
				)
			)
		end
	)
end

Section5:Button(
	"Sky Jump",
	function()
		if Sea1 then
			tp1(
				CFrame.new(
					-2192.19214,
					48.7368965,
					-4475.83301,
					-0.543718636,
					-7.0270708400000001e-08,
					-0.839267552,
					-9.7505072499999997e-08,
					1,
					-2.05600514e-08,
					0.839267552,
					7.0653960900000001e-08,
					-0.543718636
				)
			)
		else
			if not Sea2 then
				return
			end
			tp1(
				CFrame.new(
					-3730.19189,
					57.8862038,
					204.094666,
					0.984767377,
					-1.1842487000000001e-08,
					0.173876956,
					7.5586621399999992e-09,
					1,
					2.5299288e-08,
					-0.173876956,
					-2.3599635999999999e-08,
					0.984767377
				)
			)
		end
	end
)
Section5:Button(
	"Reroll Race",
	function()
		if Sea1 then
			tp1(
				CFrame.new(
					-2074.55688,
					76.3055191,
					-4497.41357,
					0.6812042,
					-1.1678841200000001e-09,
					-0.732093453,
					3.8793915299999998e-10,
					1,
					-1.2342936700000001e-09,
					0.732093453,
					5.5679832999999999e-10,
					0.6812042
				)
			)
		else
			if not Sea2 then
				return
			end
			tp1(
				CFrame.new(
					-4949.18311,
					57.822052,
					191.524734,
					-0.833928227,
					3.8972931499999997e-08,
					0.551872909,
					-1.38614071e-08,
					1,
					-9.1565198099999998e-08,
					-0.551872909,
					-8.4008533499999997e-08,
					-0.833928227
				)
			)
		end
	end
)
Section5:Button(
	"Teleport Reset Stat NPC",
	function()
		if Sea1 then
			tp1(
				CFrame.new(
					-2072.95557,
					48.7796097,
					-4405.29053,
					0.461064994,
					-2.1405602599999999e-08,
					0.887366354,
					-5.5104250099999999e-09,
					1,
					2.6985771800000001e-08,
					-0.887366354,
					-1.7331959900000001e-08,
					0.461064994
				)
			)
		else
			if not Sea2 then
				return
			end
			tp1(
				CFrame.new(
					-4843.9707,
					58.0297661,
					70.0297165,
					0.288221925,
					5.9515596899999997e-09,
					0.957563639,
					9.6896952700000004e-09,
					1,
					-9.1318659300000001e-09,
					-0.957563639,
					1.1910503700000001e-08,
					0.288221925
				)
			)
		end
	end
)
Section5:Button(
	"Black Leg Shop",
	function()
		if Sea1 then
			tp1(
				CFrame.new(
					-4206.44971,
					109.067413,
					-2932.71362,
					0.979351342,
					6.7444752e-09,
					-0.202165633,
					-1.24095703e-08,
					1,
					-2.6754566600000001e-08,
					0.202165633,
					2.8710909199999999e-08,
					0.979351342
				)
			)
		else
			if not Sea2 then
				return
			end
			tp1(
				CFrame.new(
					-4918.97363,
					60.340538,
					55.1117287,
					0.950969398,
					1.6071847899999999e-08,
					0.309284925,
					-1.4967390900000001e-08,
					1,
					-5.9437637000000001e-09,
					-0.309284925,
					1.0231491199999999e-09,
					0.950969398
				)
			)
		end
	end
)
Section5:Button(
	"Cybrog Shop",
	function()
		if Sea1 then
			tp1(
				CFrame.new(
					-264.232269,
					124.836227,
					-1400.2168,
					-0.385267437,
					7.39628803e-09,
					-0.922804952,
					1.14298544e-08,
					1,
					3.2430871300000001e-09,
					0.922804952,
					-9.29807076e-09,
					-0.385267437
				)
			)
		else
			if not Sea2 then
				return
			end
			tp1(
				CFrame.new(
					-4969.50391,
					57.772007,
					165.519562,
					0.456807017,
					2.9411097599999999e-08,
					0.889565825,
					-7.4581024000000006e-08,
					1,
					5.2363042800000002e-09,
					-0.889565825,
					-6.8736710499999997e-08,
					0.456807017
				)
			)
		end
	end
)

if not Colossuem then
	Section6:AddLabel("In Dungeon Only!")
end

function UseSkill(arg1)
	Tool = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool")
	local VirtualInputManager = game:GetService("VirtualInputManager")
	VirtualInputManager:SendKeyEvent(true, arg1, false, game)
	task.wait()
	game:GetService("VirtualInputManager"):SendKeyEvent(false, arg1, false, game)
end

Section6:Button(
	"Teleport To Raid Entrance",
	function()
		tp1(CFrame.new(-4567, 223, -80))
	end
)

if Colossuem then
	Section6:AddToggle(
		"Auto Farm Dungeon",
		_G.AutoFarmDungeon,
		function(autoFarmDungeon)
			_G.AutoFarmDungeon = autoFarmDungeon
		end
	)
	Section6:Slider(
		"Safe Raid Health",
		1,
		100,
		50,
		function(saveAt)
			_G.SaveAt = saveAt
		end
	)
	Section6:Slider(
		"Distance",
		1,
		100,
		30,
		function(arg1)
			DistanceDungeon = arg1
		end
	)
	spawn(function()
		while wait() do
			if _G.AutoFarmDungeon and not _G.NotEquip then
				pcall(function()
					for _, child in
						ipairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren())
					do
						if child:IsA("Tool") then
							game.Players.LocalPlayer.Character.Humanoid:EquipTool(child)
						end
					end
				end)
			end
		end
	end)
	spawn(function()
		while wait() do
			pcall(function()
				if not _G.AutoFarmDungeon then
					return
				end
				if
					game.Players.LocalPlayer.Character.Humanoid.Health
						<= game.Players.LocalPlayer.Character.Humanoid.MaxHealth / 100 * _G.SaveAt
				then
					AutoFarmMobDungeon = false
					AutoSaveModeDungeon = true
				else
					AutoFarmMobDungeon = true
					AutoSaveModeDungeon = false
				end
			end)
		end
	end)
	spawn(function()
		while wait() do
			if _G.AutoFarmDungeon and AutoFarmMobDungeon then
				pcall(function()
					if
						game.Players.LocalPlayer.Character.Humanoid.Health
							<= game.Players.LocalPlayer.Character.Humanoid.MaxHealth / 100
								* _G.SaveAt
					then
						return
					end
					for _, child in pairs(game:GetService("Workspace").Monster.Mon:GetChildren()) do
						if child:FindFirstChild("HumanoidRootPart") then
							while true do
								task.wait()
								_G.NotEquip = false
								tp1(
									child.HumanoidRootPart.CFrame
										* CFrame.new(0, 15, DistanceDungeon)
								)
								wait(0.5)
								UseSkill("B")
								wait(0.5)
								UseSkill("Z")
								wait(0.5)
								UseSkill("X")
								wait(0.5)
								UseSkill("C")
								wait(0.5)
								UseSkill("V")
								wait(0.5)

								if child.Humanoid.Health <= 0 then
									break
								end

								if _G.AutoFarmDungeon then
									if AutoFarmMobDungeon then
										if
											not (game.Players.LocalPlayer.Character.Humanoid.Health
												<= game.Players.LocalPlayer.Character.Humanoid.MaxHealth
													/ 100
													* _G.SaveAt)
										then
											continue
										end
									end
								end

								break
							end
						end
					end
				end)
			end
		end
	end)
	spawn(function()
		while wait() do
			if _G.AutoFarmDungeon and AutoSaveModeDungeon then
				pcall(function()
					if
						game.Players.LocalPlayer.Character.Humanoid.Health
							> game.Players.LocalPlayer.Character.Humanoid.MaxHealth / 100
								* _G.SaveAt
					then
						return
					end

					repeat
						task.wait()
						_G.NotEquip = true

						if game:GetService("Workspace").Island:FindFirstChild("Arena1") then
							tp1(
								CFrame.new(-9.393295288085938, 201.8232879638672, 16.94792366027832)
							)
						else
							tp1(CFrame.new(-19.639192581176758, 182.88330078125, 6.57674503326416))
						end

						for _, child in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
							if child:IsA("Tool") and child.ToolTip == "Fruit Power" then
								EquipWeapon(child.Name)
							end
						end

						for _, child1 in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
							if child1:IsA("Tool") and child1.ToolTip == "Fruit Power" then
								EquipWeapon(child1.Name)
							end
						end

						local VirtualInputManager = game:GetService("VirtualInputManager")
						VirtualInputManager:SendKeyEvent(
							true,
							"E",
							false,
							game.Players.LocalPlayer.Character.HumanoidRootPart
						)
					until
						game.Players.LocalPlayer.Character.Humanoid.Health
							== game.Players.LocalPlayer.Character.Humanoid.MaxHealth
							or not (AutoSaveModeDungeon and _G.AutoFarmDungeon)

					_G.NotEquip = false
					game:GetService("VirtualInputManager")
						:SendKeyEvent(
							false,
							"E",
							false,
							game.Players.LocalPlayer.Character.HumanoidRootPart
						)
				end)
			end
		end
	end)
end

Section7:AddToggle(
	"Inf Geppo",
	InfGeppo,
	function(arg1)
		InfGeppo = arg1
	end
)
Section7:AddToggle(
	"Fly",
	Flys,
	function(arg1)
		Flys = arg1
	end
)
spawn(function()
	while wait() do
		pcall(function()
			if not Flys then
				return
			end
			fly()
		end)
	end
end)

function fly()
	local Mouse = game.Players.LocalPlayer:GetMouse("")
	localplayer = game.Players.LocalPlayer
	game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
	local HumanoidRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
	local tbl = {a = false, d = false, w = false, s = false}
	local v1
	local v2

	local function func()
		local bodyPosition = Instance.new("BodyPosition", HumanoidRootPart)
		local bodyGyro = Instance.new("BodyGyro", HumanoidRootPart)
		bodyPosition.Name = "EPIXPOS"
		bodyPosition.maxForce = Vector3.new(math.huge, math.huge, math.huge)
		bodyPosition.position = HumanoidRootPart.Position
		bodyGyro.maxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
		bodyGyro.CFrame = HumanoidRootPart.CFrame

		repeat
			wait()
			localplayer.Character.Humanoid.PlatformStand = true
			local v1 = bodyGyro.CFrame - bodyGyro.CFrame.p + bodyPosition.position

			if not (tbl.w or (tbl.s or (tbl.a or tbl.d))) then
				speed = 1
			end

			if tbl.w then
				local speedRef = speed
				v1 = v1 + workspace.CurrentCamera.CoordinateFrame.lookVector * speedRef
				speed = speedRef + 25
			end

			if tbl.s then
				local speedRef1 = speed
				v1 = v1 - workspace.CurrentCamera.CoordinateFrame.lookVector * speedRef1
				speed = speedRef1 + 25
			end

			if tbl.d then
				local speedRef2 = speed
				v1 = v1 * CFrame.new(speedRef2, 0, 0)
				speed = speedRef2 + 25
			end

			if tbl.a then
				v1 = v1 * CFrame.new(-speed, 0, 0)
				speed = speed + 25
			end

			if 25 < speed then
				speed = 25
			end

			bodyPosition.position = v1.p

			if tbl.w then
				bodyGyro.CFrame =
					workspace.CurrentCamera.CoordinateFrame
						* CFrame.Angles(-math.rad(speed * 15), 0, 0)
			elseif tbl.s then
				bodyGyro.CFrame =
					workspace.CurrentCamera.CoordinateFrame
						* CFrame.Angles(math.rad(speed * 15), 0, 0)
			else
				bodyGyro.CFrame = workspace.CurrentCamera.CoordinateFrame
			end
		until not Fly

		if bodyGyro then
			bodyGyro:Destroy()
		end

		if not bodyPosition then
			flying = false
			localplayer.Character.Humanoid.PlatformStand = false
			speed = 0
			return
		end

		bodyPosition:Destroy()
		flying = false
		localplayer.Character.Humanoid.PlatformStand = false
		speed = 0
	end

	v1 = Mouse.KeyDown:connect(function(arg1)
		if HumanoidRootPart and HumanoidRootPart.Parent then
			if arg1 == "w" then
				tbl.w = true
			elseif arg1 == "s" then
				tbl.s = true
			elseif arg1 == "a" then
				tbl.a = true
			else
				if arg1 ~= "d" then
					return
				end
				tbl.d = true
			end
		else
			flying = false
			v1:disconnect()
			v2:disconnect()
		end
	end)
	v2 = Mouse.KeyUp:connect(function(arg1)
		if arg1 == "w" then
			tbl.w = false
		elseif arg1 == "s" then
			tbl.s = false
		elseif arg1 == "a" then
			tbl.a = false
		else
			if arg1 ~= "d" then
				return
			end
			tbl.d = false
		end
	end)
	func()
end

Section7:AddToggle(
	"No Clip",
	_G.NoClip,
	function(noClip)
		_G.NoClip = noClip
	end
)
Section8:AddToggle(
	"Esp Player",
	PlayerESP,
	function(arg1)
		PlayerESP = arg1
		while PlayerESP do
			wait()
			FindPlayer()
		end
	end
)
Section8:AddToggle(
	"Esp Devil Fruit",
	DevilFruitESP,
	function(arg1)
		DevilFruitESP = arg1
		while DevilFruitESP do
			wait()
			FindDevilFruit()
		end
	end
)
Section8:AddToggle(
	"Esp Legacy Island",
	LegacyIslandESP,
	function(arg1)
		LegacyIslandESP = arg1
		while LegacyIslandESP do
			wait()
			FindLegacyIsland()
		end
	end
)
Section8:AddToggle(
	"Esp Hydra Island",
	HydraIslandESP,
	function(arg1)
		HydraIslandESP = arg1
		while HydraIslandESP do
			wait()
			FindHydraIsland()
		end
	end
)
Section8:AddToggle(
	"Esp Ghost Ship",
	GhostShipESP,
	function(arg1)
		GhostShipESP = arg1
		while GhostShipESP do
			wait()
			FindGhostShip()
		end
	end
)
Number = math.random(1, 1000000)

function FindPlayer()
	for _, child in pairs(game:GetService("Players"):GetChildren()) do
		pcall(function()
			if not child.Character then
				return
			end
			if PlayerESP then
				if
					child.Character.Head
						and not child.Character.Head:FindFirstChild("PlayerESP" .. Number)
				then
					local billboardGui = Instance.new("BillboardGui", child.Character.Head)
					billboardGui.Name = "PlayerESP" .. Number
					billboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
					billboardGui.Size = UDim2.new(1, 200, 1, 30)
					billboardGui.Adornee = child.Character.Head
					billboardGui.AlwaysOnTop = true
					local textLabel = Instance.new("TextLabel", billboardGui)
					textLabel.Font = "GothamBold"
					textLabel.FontSize = "Size14"
					textLabel.Text =
						child.Name
							.. "\n"
								.. math.round(
									(child.Character.Head.Position
										- game:GetService(
											"Players"
										).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
										/ 3
								)
									.. " m."
					textLabel.Size = UDim2.new(1, 0, 1, 0)
					textLabel.BackgroundTransparency = 1
					textLabel.TextStrokeTransparency = 0.5

					if child.Team ~= game:GetService("Players").LocalPlayer.Team then
						textLabel.TextColor3 = Color3.new(255, 0, 0)
					else
						textLabel.TextColor3 = Color3.new(0, 255, 0)
					end
				else
					child.Character.Head["PlayerESP" .. Number].TextLabel.Text =
						child.Name
							.. "\n"
								.. math.round(
									(child.Character.Head.Position
										- game:GetService(
											"Players"
										).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
										/ 3
								)
									.. " m."
				end
			else
				if not child.Character.Head:FindFirstChild("PlayerESP" .. Number) then
					return
				end
				child.Character.Head:FindFirstChild("PlayerESP" .. Number):Destroy()
			end
		end)
	end
end

function FindDevilFruit()
	for _, child in pairs(game:GetService("Workspace"):GetChildren()) do
		pcall(function()
			if not string.find(child.Name, "Fruit") then
				return
			end
			if DevilFruitESP then
				if not string.find(child.Name, "Fruit") then
					return
				end
				if child.Handle:FindFirstChild("DevilESP" .. Number) then
					child.Handle["DevilESP" .. Number].TextLabel.Text =
						child.Name
							.. "\n"
								.. math.round(
									(child.Handle.Position
										- game:GetService(
											"Players"
										).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
										/ 3
								)
									.. " m."
				else
					local billboardGui = Instance.new("BillboardGui", child.Handle)
					billboardGui.Name = "DevilESP" .. Number
					billboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
					billboardGui.Size = UDim2.new(1, 200, 1, 30)
					billboardGui.Adornee = child.Handle
					billboardGui.AlwaysOnTop = true
					local textLabel = Instance.new("TextLabel", billboardGui)
					textLabel.Font = "GothamBold"
					textLabel.FontSize = "Size14"
					textLabel.Size = UDim2.new(1, 0, 1, 0)
					textLabel.BackgroundTransparency = 1
					textLabel.TextStrokeTransparency = 0.5
					textLabel.Text =
						child.Name
							.. "\n"
								.. math.round(
									(child.Handle.Position
										- game:GetService(
											"Players"
										).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
										/ 3
								)
									.. " m."
					textLabel.TextColor3 = Color3.new(255, 255, 0)
				end
			else
				if not child.Handle:FindFirstChild("DevilESP" .. Number) then
					return
				end
				child.Handle:FindFirstChild("DevilESP" .. Number):Destroy()
			end
		end)
	end
end

function FindGhostShip()
	for _, child in pairs(game:GetService("Workspace").GhostMonster:GetChildren()) do
		pcall(function()
			if child.Name ~= "Ghost Ship" then
				return
			end
			if GhostShipESP then
				if child.Name ~= "Ghost Ship" then
					return
				end
				if child.HumanoidRootPart:FindFirstChild("GhostESP" .. Number) then
					child.HumanoidRootPart["GhostESP" .. Number].TextLabel.Text =
						"Ghost Ship"
							.. "\n"
								.. math.round(
									(child.HumanoidRootPart.Position
										- game:GetService(
											"Players"
										).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
										/ 3
								)
									.. " m."
				else
					local billboardGui = Instance.new("BillboardGui", child.HumanoidRootPart)
					billboardGui.Name = "GhostESP" .. Number
					billboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
					billboardGui.Size = UDim2.new(1, 200, 1, 30)
					billboardGui.Adornee = child.HumanoidRootPart
					billboardGui.AlwaysOnTop = true
					local textLabel = Instance.new("TextLabel", billboardGui)
					textLabel.Font = "GothamBold"
					textLabel.FontSize = "Size14"
					textLabel.Size = UDim2.new(1, 0, 1, 0)
					textLabel.BackgroundTransparency = 1
					textLabel.TextStrokeTransparency = 0.5
					textLabel.Text =
						"Ghost Ship"
							.. "\n"
								.. math.round(
									(child.HumanoidRootPart.Position
										- game:GetService(
											"Players"
										).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
										/ 3
								)
									.. " m."
					textLabel.TextColor3 = Color3.new(204, 159, 40)
				end
			else
				if not child.HumanoidRootPart:FindFirstChild("GhostESP" .. Number) then
					return
				end
				child.HumanoidRootPart:FindFirstChild("GhostESP" .. Number):Destroy()
			end
		end)
	end
end

function FindLegacyIsland()
	for _, child in pairs(game:GetService("Workspace").Island:GetChildren()) do
		pcall(function()
			if not string.find(child.Name, "Legacy Island") then
				return
			end
			if LegacyIslandESP then
				if not string.find(child.Name, "Legacy Island") then
					return
				end
				if child.Main:FindFirstChild("GayESP" .. Number) then
					child.Main["GhostESP" .. Number].TextLabel.Text =
						"Legacy Island"
							.. "\n"
								.. math.round(
									(child.Main.Position
										- game:GetService(
											"Players"
										).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
										/ 3
								)
									.. " m."
				else
					local billboardGui = Instance.new("BillboardGui", child.Main)
					billboardGui.Name = "GayESP" .. Number
					billboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
					billboardGui.Size = UDim2.new(1, 200, 1, 30)
					billboardGui.Adornee = child.Main
					billboardGui.AlwaysOnTop = true
					local textLabel = Instance.new("TextLabel", billboardGui)
					textLabel.Font = "GothamBold"
					textLabel.FontSize = "Size14"
					textLabel.Size = UDim2.new(1, 0, 1, 0)
					textLabel.BackgroundTransparency = 1
					textLabel.TextStrokeTransparency = 0.5
					textLabel.Text =
						"Legacy Island"
							.. "\n"
								.. math.round(
									(child.Main.Position
										- game:GetService(
											"Players"
										).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
										/ 3
								)
									.. " m."
					textLabel.TextColor3 = Color3.new(255, 255, 255)
				end
			else
				if not child.Main:FindFirstChild("GayESP" .. Number) then
					return
				end
				child.Main:FindFirstChild("GayESP" .. Number):Destroy()
			end
		end)
	end
end

function FindHydraIsland()
	for _, child in pairs(game:GetService("Workspace").Island:GetChildren()) do
		pcall(function()
			if not string.find(child.Name, "Sea King") then
				return
			end
			if HydraIslandESP then
				if not string.find(child.Name, "Sea King") then
					return
				end
				if child.Main:FindFirstChild("HydraESP" .. Number) then
					child.Main["GhostESP" .. Number].TextLabel.Text =
						"Hydra Island"
							.. "\n"
								.. math.round(
									(child.Main.Position
										- game:GetService(
											"Players"
										).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
										/ 3
								)
									.. " m."
				else
					local billboardGui = Instance.new("BillboardGui", child.Main)
					billboardGui.Name = "HydraESP" .. Number
					billboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
					billboardGui.Size = UDim2.new(1, 200, 1, 30)
					billboardGui.Adornee = child.Main
					billboardGui.AlwaysOnTop = true
					local textLabel = Instance.new("TextLabel", billboardGui)
					textLabel.Font = "GothamBold"
					textLabel.FontSize = "Size14"
					textLabel.Size = UDim2.new(1, 0, 1, 0)
					textLabel.BackgroundTransparency = 1
					textLabel.TextStrokeTransparency = 0.5
					textLabel.Text =
						"Hydra Island"
							.. "\n"
								.. math.round(
									(child.Main.Position
										- game:GetService(
											"Players"
										).LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
										/ 3
								)
									.. " m."
					textLabel.TextColor3 = Color3.new(0, 255, 255)
				end
			else
				if not child.Main:FindFirstChild("HydraESP" .. Number) then
					return
				end
				child.Main:FindFirstChild("HydraESP" .. Number):Destroy()
			end
		end)
	end
end

print("[Akuma] UI setup complete - all tabs loaded")
pcall(getSpawn)
local ok, result = pcall(getrawmetatable, game)
local resultRef = result

if not ok or not resultRef then
	warn("getrawmetatable not available")
	resultRef = {}
end

local v39 = resultRef.__namecall or function() end
pcall(setreadonly, resultRef, false)

function resultRef.__namecall(...)
	local tbl = {...}

	if
		getnamecallmethod() ~= "InvokeServer"
			or (tostring(tbl[1]) ~= "SkillAction" or not getgenv().PosMonSkill)
	then
		return v39(...)
	end

	if tbl[3] then
		if tbl[3].Type ~= "Up" then
			if tbl[3].Type ~= "Down" then
				return v39(...)
			end
		end

		tbl[3].MouseHit = getgenv().PosMonSkill
		return v39(unpack(tbl))
	end

	return v39(...)
end

-- https://leakd.fr
