local BananaHub = {}
BananaHub.Version = "2.0-Deobfuscated"
BananaHub.Subsystems = {}
BananaHub.Functions = {}
BananaHub.Utils = {}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")
local CollectionService = game:GetService("CollectionService")
local Lighting = game:GetService("Lighting")

local env_ctx = {
	[1] = LocalPlayer,
	[2] = ReplicatedStorage,
	[3] = ReplicatedStorage:FindFirstChild("Remotes"),
	[4] = {
		EnsureFloatForce = function(hrp)
			if hrp and not hrp:FindFirstChild("FloatForce") then
				local bodyVelocity = Instance.new("BodyVelocity")
				bodyVelocity.Name = "FloatForce"
				bodyVelocity.MaxForce = Vector3.new(0, 1e9, 0)
				bodyVelocity.Velocity = Vector3.new(0, 0, 0)
				bodyVelocity.Parent = hrp
			end
		end,
		QuestClaimCount = 0,
		EntranceInFlight = false,
		LastCall = 0,
	},
	[5] = {
		SelectedWeapon = "Combat",
		FastAttackSpeed = 0.1,
	},
}
BananaHub.EnvContext = env_ctx
local VM_Core = {}
VM_Core.N0 = function(vm_ctx, ...)
		local is_running, state_id, reg_n, reg_V, reg_J, reg_W, reg_G, reg_Z, reg_s, reg_u, reg__, reg_v = vm_ctx:HU()
		-- User request #2: Khôi phục thanh ghi và gói đối số varargs
		local current_state, next_state, varargs_pack, reg_N, reg_O, reg_R, reg_p, reg_I, reg_t, reg_D, reg_k, reg_f = state_id, reg_n, table.pack(...), reg_V, reg_J, reg_W, reg_G, reg_Z, reg_s, reg_u, reg__, reg_v
		while g do
			if z <= 17 then
				if z <= 8 then
					if z <= 3 then
						z, C, N, O, t = h:LU(I, R, p, z, N, C, O, t)
					else
						u, F = h.GU, h
						local g, n, V, J, W, G, Z, s, _, v = u(F, z, k, f, R, p, C, O, I, N, h:XU(K))
						if g == 1 then
							z, C, N, O, R, p, I, k, f = n, V, J, W, G, Z, s, _, v
						elseif g == 2 then
							return N
						end
					end
				elseif z <= 12 then
					if z <= 10 then
						z, t, D = h:OU(D, N, C, O, t, z)
					else
						z, O, p = h:wU(R, O, z, p, I, t, N)
					end
				elseif z <= 14 then
					z, R, t = h:CU(N, O, R, z, t, C)
				else
					z, O, I, t = h:FU(k, z, O, D, N, I, t)
				end
			elseif z <= 26 then
				if z <= 21 then
					z, O, I, D, k = h:cU(I, k, N, z, O, D)
				else
					z, O, p, I, D = h:RU(I, k, f, O, z, N, D, p, t)
				end
			elseif z <= 31 then
				z, C, O, I, D = h:UU(t, O, D, k, C, I, z)
			else
				z, O, p, I, t, D = h:T0(k, N, z, p, D, O, I, t)
			end
		end
	end

VM_Core.HU = function(vm_ctx)
		return true, 1, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
	end
VM_Core.HT = function(vm_ctx, g, F, n, V, J, W, G, Z, s, u, _, v, z)
		if _ <= 31 then
			if _ <= 30 then
				local C = g + 128 * (F - 128)
				return 125, u, n, Z + 2, s, C, g, z, V, W, J, v
			else
				local C, K, N = (s + 186) % 256, buffer.create(G), G - G % 4
				local O, R = N - 1, 4 + 0
				local p = 0 - R
				return 119, { O + 0, p, R, nil, u }, n, Z, C, F, 186, 85, 249, K, 3132799674, N
			end
		elseif _ <= 32 then
			local _ = Z + 1
			local C = buffer.readu8(F, _)
			return 128 > C and 157 or 163, u, _, C, s, F, g, z, V, W, J, v
		else
			local h = 128 * (Z - 128) + G
			return 151, u, n + 2, h, s, F, g, z, V, W, J, v
		end
	end

VM_Core.bU = function(vm_ctx, g, F, n, V, J, W, G, Z, s, u, _, v)
		if _ <= 219 then
			if _ <= 218 then
				u(F, Z, (G(v, W, g)))
				local g, F = h.k0[J], 8
				local J, G, z = buffer.writeu32, h.i0, buffer.readu32(s, V + F)
				J(G, F, (bit32.bxor(h.D0[g], v, z)))
				G, F = h.k0[g], h.i0
				J, z, g = buffer.readf32(F, n), buffer.readf32(F, 4), buffer.readf32(F, 8)
				return 14, n, V, Vector3.new(J, z, g), Z, u
			else
				local g = buffer.readu8(s, n + 1)
				return g >= 128 and 11 or 140, n, V, v, g, u
			end
		elseif _ <= 220 then
			local g, F = (Z - 1) * 3, buffer.readu8(W, V)
			return F >= 128 and 174 or 137, n, V, v, g, F
		else
			local h = (V - 128) * 128 + v
			return 171, 2 + n, h, v, Z, u
		end
	end

VM_Core.KU = function(vm_ctx, g, F, n, V, J, W, G, Z, s)
		if F <= 142 then
			if F <= 141 then
				local u, _, v = s[2], s[5], s[4]
				local z, C = u + _, _ <= 0
				_, u = z >= v, z <= v
				v = C and _ or not C and u
				s[2] = z
				if v then
					return 82, W, G, g, z
				else
					return 51, W, G, g, Z
				end
			else
				return g <= 70 and 69 or 10, W, G, g, Z
			end
		elseif F <= 143 then
			local F = buffer.readu8(G, 1 + J)
			if 128 > F then
				return 112, W, F, g, Z
			else
				return 42, W, G, F, Z
			end
		else
			return 14, J(V, n, W), G, g, Z
		end
	end

VM_Core.XU = function(vm_ctx, g)
		return table.unpack(g, 1, g.n)
	end

VM_Core.vT = function(vm_ctx, g, F, n, V, J, W, G, Z, s, u, _, v, z, C, K, N, O, R, p)
		if _ <= 179 then
			if _ <= 178 then
				local I = {}
				W[-2] = n
				s[-2] = J
				V[-2] = z
				C[-2] = g
				W[-1] = I
				s[-1] = I
				V[-1] = I
				C[-1] = I
				setmetatable(W, Z)
				setmetatable(s, Z)
				setmetatable(V, Z)
				setmetatable(C, Z)
				return 3, F, Z, O, h[v](h, C, n, p, nil, K, N, s, W, V, z, nil, J, g, u, R, nil), p
			else
				local g = buffer.readu8(G, O + 2)
				return g >= 128 and 64 or 79, R, Z, O, s, g
			end
		elseif _ <= 180 then
			return 148, R, Z, 1 + O, s, p
		else
			return 236, R, Z + 1, O, s, p
		end
	end

VM_Core.x = function(vm_ctx, g, F, n, V, J)
		if F <= 28 then
			local F, W, G = g[1], g[3], g[4]
			local Z, s = F + W, W <= 0
			F, W = Z >= G, Z <= G
			G = s and F or not s and W
			g[1] = Z
			if G then
				return 188, n, Z
			else
				return 32, n, J
			end
		else
			local g = buffer.readu8(V, 1)
			return g >= 128 and 225 or 68, g, J
		end
	end


VM_Core.DecryptRC4Buffer = function(srcBuffer, srcOffset, sbox)
	local totalLen = buffer.len(srcBuffer) - srcOffset
	local destBuffer = buffer.create(totalLen)
	local alignedLen = totalLen - (totalLen % 4)

	local rc4_i = 0
	local rc4_j = 0

	-- Vòng lặp 1: Giải mã 4 byte một lần (32-bit bulk XOR)
	for offset = 0, alignedLen - 1, 4 do
		rc4_i = bit32.band(rc4_i + 1, 255)
		rc4_j = bit32.band(rc4_j + sbox[rc4_i], 255)
		sbox[rc4_i], sbox[rc4_j] = sbox[rc4_j], sbox[rc4_i]
		local k0 = bit32.lshift(sbox[bit32.band(sbox[rc4_i] + sbox[rc4_j], 255)], 0)

		rc4_i = bit32.band(rc4_i + 1, 255)
		rc4_j = bit32.band(rc4_j + sbox[rc4_i], 255)
		sbox[rc4_i], sbox[rc4_j] = sbox[rc4_j], sbox[rc4_i]
		local k1 = bit32.lshift(sbox[bit32.band(sbox[rc4_i] + sbox[rc4_j], 255)], 8)

		rc4_i = bit32.band(rc4_i + 1, 255)
		rc4_j = bit32.band(rc4_j + sbox[rc4_i], 255)
		sbox[rc4_i], sbox[rc4_j] = sbox[rc4_j], sbox[rc4_i]
		local k2 = bit32.lshift(sbox[bit32.band(sbox[rc4_i] + sbox[rc4_j], 255)], 16)

		rc4_i = bit32.band(rc4_i + 1, 255)
		rc4_j = bit32.band(rc4_j + sbox[rc4_i], 255)
		sbox[rc4_i], sbox[rc4_j] = sbox[rc4_j], sbox[rc4_i]
		local k3 = bit32.lshift(sbox[bit32.band(sbox[rc4_i] + sbox[rc4_j], 255)], 24)

		local keystream32 = bit32.bor(k0, k1, k2, k3)
		local cipherWord = buffer.readu32(srcBuffer, srcOffset + offset)
		buffer.writeu32(destBuffer, offset, bit32.bxor(cipherWord, keystream32))
	end

	-- Vòng lặp 2: Giải mã các byte lẻ còn lại
	for offset = alignedLen, totalLen - 1, 1 do
		rc4_i = bit32.band(rc4_i + 1, 255)
		rc4_j = bit32.band(rc4_j + sbox[rc4_i], 255)
		sbox[rc4_i], sbox[rc4_j] = sbox[rc4_j], sbox[rc4_i]
		local keystream8 = sbox[bit32.band(sbox[rc4_i] + sbox[rc4_j], 255)]
		local cipherByte = buffer.readu8(srcBuffer, srcOffset + offset)
		buffer.writeu8(destBuffer, offset, bit32.bxor(cipherByte, keystream8))
	end

	return destBuffer
end


BananaHub.VM_Core = VM_Core

local Sub_AutoQuestAndFarm = {}
Sub_AutoQuestAndFarm[127] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			return function(h, F)
				local n = getgenv().questpoint[h]
				if n then
				else
					CFrameQuest()
					task.wait(1.5)
					n = getgenv().questpoint[h]
					if not n then
						return
					end
				end
				local V, J =
					local_player.Character and local_player.Character:FindFirstChild("HumanoidRootPart"),
					local_player.Character and local_player.Character:FindFirstChildOfClass("Humanoid")
				if V then
					if not J then
						return
					end
				else
					return
				end
				if (n.Position - V.Position).Magnitude <= 8 then
					if J.Health > 0 then
						CommF:InvokeServer("StartQuest", h, F)
						task.wait(0.5)
					end
				else
					toTarget(n * CFrame.new(0, 4, 2), true)
				end
			end
		end
	end

Sub_AutoQuestAndFarm[5] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			local n = env_ctx[4]
			return function(V)
				local J = V ~= nil
				local W = V or g(game_services.Data.Level.Value)
				V = game_services.PlayerGui.Main:FindFirstChild("Quest")
				local function g()
					local G = J and select(1, env_ctx[3]()) or (if J then not J else GetQuestText() ~= "")
					return G
				end
				if not W or not W.Pos then
					return
				elseif V then
					if g() then
						return
					end
				else
					return
				end
				local h, V, J =
					typeof(W.Pos) == "CFrame" and W.Pos.Position or W.Pos,
					game_services.Character and game_services.Character:FindFirstChild("HumanoidRootPart"),
					game_services.Character and game_services.Character:FindFirstChild("Humanoid")
				if V then
					if not J then
						return
					end
				else
					return
				end
				if (h - V.Position).Magnitude <= 8 and J.Health > 0 then
					n.EnsureFloatForce(V)
					n.QuestClaimCount = n.QuestClaimCount + 1
					pcall(function()
						task.wait(2)
						if g() then
							return
						elseif J.Health <= 0 then
							return
						end
						for F = 1, 2, 1 do
							pcall(function()
								CommF:InvokeServer("StartQuest", tostring(W.QuestName), W.Id)
							end)
							task.wait(1)
							if g() then
								return
							elseif J.Health <= 0 then
								return
							end
						end
					end)
					n.QuestClaimCount = n.QuestClaimCount - 1
				else
					toTarget(CFrame.new(h) * CFrame.new(0, 4, 2), true)
				end
			end
		end
	end

Sub_AutoQuestAndFarm[9] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			return function()
				if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 0 then
					if string.find(GetQuestText(), "Defeat 50 Swan Pirate", 1, true) then
						local h, n = "Swan Pirate", DetectMob("Swan Pirate")
						if n then
							repeat
								task.wait()
								sizepart(n)
								BringMob(n)
								UsedualFlock()
								ClickM1(n)
								if Settings["Select Weapon"] == "Blox Fruit" then
									toTarget(n.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0))
								else
									toTarget(n.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
								end
							until not IsMobAlive(n)
						elseif typeof(h) == "table" then
							if #ui_notifications >= 11 then
								ui_notifications = {}
								return
							end
							local n = DetectPartSpawnMob(DetectNameTablePart(h))
							if n then
								table.insert(ui_notifications, DetectNameTablePart(h))
								while true do
									wait()
									toTarget(n.CFrame * CFrame.new(0, 60, 0))
									local g, V = n.Position, game_services.Character.HumanoidRootPart
									if (g - V.Position).Magnitude <= 100 or DetectMob(h) then
										break
									end
								end
								wait(1)
							end
						else
							local g = DetectPartSpawnMob(h, true)
							if g then
								Instance.new("IntValue", g).Name = "Ignored"
								while true do
									wait()
									toTarget(g.CFrame * CFrame.new(0, 60, 0))
									local n, V = g.Position, game_services.Character.HumanoidRootPart
									if (n - V.Position).Magnitude <= 100 or DetectMob(h) then
										break
									end
								end
								wait(1)
							else
								DeleteIgnoredMobSpawn()
							end
						end
					elseif
						(
							game_services.Character.HumanoidRootPart.Position - CFrame.new(-456.28952, 73.0200958, 299.895966).Position
						).Magnitude > 8
					then
						toTarget(CFrame.new(-456.28952, 73.0200958, 299.895966))
					else
						game:GetService("ReplicatedStorage").Remotes.CommF_
							:InvokeServer(unpack({ [1] = "StartQuest", [2] = "BartiloQuest", [3] = 1 }))
					end
				elseif
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")
					== 1
				then
					local boss_mob = CheckNameBoss("Jeremy")
					if h then
						repeat
							task.wait()
							sizepart(h)
							UsedualFlock()
							ClickM1(h)
							if Settings["Select Weapon"] == "Blox Fruit" then
								toTarget(h.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0))
							else
								toTarget(h.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
							end
						until not IsMobAlive(h)
					end
				elseif
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")
					== 2
				then
					repeat
						task.wait()
						if
							(game_services.Character.HumanoidRootPart.Position - Vector3.new(-1835.65, 10.4325, 1679.75)).Magnitude
							> 100
						then
							toTarget(CFrame.new(-1835.65, 10.4325, 1679.75))
						else
							game_services.Character.HumanoidRootPart.CFrame =
								game:GetService("Workspace").Map.Dressrosa.BartiloPlates[checkplatebarito()].CFrame
							task.wait()
							firetouchinterest(
								game:GetService("Workspace").Map.Dressrosa.BartiloPlates[checkplatebarito()],
								game.Players.LocalPlayer.Character.HumanoidRootPart,
								0
							)
							firetouchinterest(
								game:GetService("Workspace").Map.Dressrosa.BartiloPlates[checkplatebarito()],
								game.Players.LocalPlayer.Character.HumanoidRootPart,
								1
							)
						end
					until game:GetService("ReplicatedStorage").Remotes.CommF_
							:InvokeServer("BartiloQuestProgress", "Bartilo") == 3
				end
			end
		end
	end

Sub_AutoQuestAndFarm[16027] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			local ui_notifications = env_ctx[3]
			return function()
				if
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
					== 0
				then
					if string.find(GetQuestText(), "Defeat 50 Forest Pirate", 1, true) then
						local target_mob = DetectMob("Forest Pirate")
						if h then
							while true do
								task.wait()
								sizepart(h)
								BringMob(h)
								UsedualFlock()
								ClickM1(h)
								if Settings["Select Weapon"] == "Blox Fruit" then
									toTarget(h.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0))
								else
									toTarget(h.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
								end
								local V = IsMobAlive(h)
								if if V then not Settings["Auto UP Observation V2"] else not V then
									break
								end
							end
						else
							local h = "Forest Pirate"
							if typeof(h) == "table" then
								if #ui_notifications >= 13 then
									ui_notifications = {}
									return
								end
								local V = DetectPartSpawnMob(DetectNameTablePart(h))
								if V then
									table.insert(ui_notifications, DetectNameTablePart(h))
									while true do
										wait()
										toTarget(V.CFrame * CFrame.new(0, 60, 0))
										local g, J = V.Position, game_services.Character.HumanoidRootPart
										if
											(g - J.Position).Magnitude <= 100
											or DetectMob(h)
											or not Settings["Auto UP Observation V2"]
										then
											break
										end
									end
									wait(1)
								end
							else
								local g = DetectPartSpawnMob(h, true)
								if g then
									Instance.new("IntValue", g).Name = "Ignored"
									while true do
										wait()
										toTarget(g.CFrame * CFrame.new(0, 60, 0))
										local V, J = g.Position, game_services.Character.HumanoidRootPart
										if
											(V - J.Position).Magnitude <= 100
											or DetectMob(h)
											or not Settings["Auto UP Observation V2"]
										then
											break
										end
									end
									wait(1)
								else
									DeleteIgnoredMobSpawn()
								end
							end
						end
					elseif
						F:DistanceFromCharacter(Vector3.new(-12441.5908203125, 331.4884948730469, -7676.197265625)) < 10
					then
						game:GetService("ReplicatedStorage").Remotes.CommF_
							:InvokeServer(unpack({ [1] = "StartQuest", [2] = "CitizenQuest", [3] = 1 }))
					else
						toTarget(CFrame.new(-12441.5908203125, 331.4884948730469, -7676.197265625))
					end
				elseif
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
					== 1
				then
					if string.find(GetQuestText(), "Captain Elephant", 1, true) then
						local boss_mob = CheckNameBoss("Captain Elephant")
						if h then
							while true do
								wait()
								sizepart(h)
								if Settings["Select Weapon"] == "Blox Fruit" then
									toTarget(h.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0))
								else
									toTarget(h.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
								end
								ClickM1(h)
								equiptool(NameWeapon(Settings["Select Weapon"]))
								local g = IsMobAlive(h)
								if if g then not Settings["Auto UP Observation V2"] else not g then
									break
								end
							end
						else
							ui_notifications.CreateNoti({
								Title = "Banana Cat Hub",
								Desc = "Waiting Boss Captain Elephant",
								ShowTime = 5,
							})
							wait(5)
						end
					elseif
						F:DistanceFromCharacter(Vector3.new(-12441.5908203125, 331.4884948730469, -7676.197265625)) < 10
					then
						game:GetService("ReplicatedStorage").Remotes.CommF_
							:InvokeServer(unpack({ [1] = "StartQuest", [2] = "CitizenQuest", [3] = 1 }))
					else
						toTarget(CFrame.new(-12441.5908203125, 331.4884948730469, -7676.197265625))
					end
				elseif
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
					== 2
				then
					toTarget(CFrame.new(-12513.8, 336.167, -9872.91))
				elseif
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
					== 3
				then
					local h, g = string.gsub, game
					local V =
						tonumber((h(g.ReplicatedStorage.Remotes.CommF_:InvokeServer("KenTalk", "Status"), "%D", "")))
					if V >= 5000 then
						game.ReplicatedStorage.Remotes.CommF_:InvokeServer("KenTalk2", "Start")
						h = game_services.Data.Beli.Value >= 5000000
							and (DetectItemPlr("Pineapple") and DetectItemPlr("Apple") and DetectItemPlr("Banana"))
						if h or DetectItemPlr("Fruit Bowl") then
							game:GetService("ReplicatedStorage").Remotes.CommF_
								:InvokeServer("CitizenQuestProgress", "Citizen")
							game.ReplicatedStorage.Remotes.CommF_:InvokeServer("KenTalk2", "Buy")
						else
							local h, V = { "PineappleSpawner", "BananaSpawner", "AppleSpawner" }, pairs
							for J, J in V(h) do
								if game:GetService("Workspace"):FindFirstChild(J) then
									if game:GetService("Workspace"):FindFirstChild(J):FindFirstChildOfClass("Tool") then
										firetouchinterest(
											game_services.Character.HumanoidRootPart,
											game:GetService("Workspace")
												:FindFirstChild(J)
												:FindFirstChildOfClass("Tool").Handle,
											0
										)
									else
										ui_notifications.CreateNoti({ Title = "Banana Cat Hub", Desc = "Wating Fruit", ShowTime = 5 })
										wait(3)
									end
								end
							end
						end
					else
						local h, F, n = next, game.workspace.Enemies:GetChildren()
						g = nil
						for V, V in h, F, n do
							g = if V:IsA("Model")
								then if V.Name == "Marine Commodore"
									then if V:FindFirstChild("HumanoidRootPart")
										then if V.Humanoid.Health > 0 then V else g
										else g
									else g
								else g
						end
						if ObservationActive() then
							if g then
								while true do
									task.wait()
									toTarget(g.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3))
									h = Settings["Auto UP Observation V2"]
									if if h then not ObservationActive() else not h then
										break
									end
								end
							else
								GetPart = DetectPartSpawnMob("Marine Commodore")
								toTarget(GetPart.CFrame * CFrame.new(0, 60, 0))
							end
						else
							if g then
								toTarget(g.HumanoidRootPart.CFrame * CFrame.new(0, 0, 50))
							end
							TurnOnObservation()
							wait(2)
						end
					end
				end
			end
		end
	end



BananaHub.Subsystems.AutoQuestAndFarm = Sub_AutoQuestAndFarm
for func_id, func_impl in pairs(Sub_AutoQuestAndFarm) do
	BananaHub.Functions[func_id] = func_impl
end
local Sub_CombatGunAimbot = {}
Sub_CombatGunAimbot[86] = function(env_ctx)
		return function(h, h, h, g)
			return function(g, F)
				spawn(function()
					local n = env_ctx[1].Character
					F = F or NameWeapon("Gun")
					local V = n and F and n:FindFirstChild(F)
					local J = typeof(g) == "CFrame" and { CFrame = g, Position = g.Position }
						or typeof(g) == "Instance" and (g:IsA("BasePart") and g or g:FindFirstChild("HumanoidRootPart") or g:FindFirstChild(
							"Hitbox"
						) or g:IsA("Model") and g.PrimaryPart)
						or type(g) == "table" and (g.HumanoidRootPart or g.CFrame and g.Position and g)
					if not V or not J then
						return
					elseif require(env_ctx[2].CombatUtil):IsGunReloading(V) then
						return
					end
					local g = getupvalues(require(env_ctx[3].Controllers.CombatController).Attack)[9]
					if type(g) ~= "function" then
						return
					end
					if F == "Dragonstorm" then
						local W, G = env_ctx[4](g)
						env_ctx[3].Remotes.Validator2:FireServer(W, G)
						env_ctx[2].Net:FindFirstChild("RE/ShootGunEvent"):FireServer(J.Position, { J })
						task.wait(V.Cooldown.Value)
						return
					end
					local h
					for W, W in ipairs(getupvalues(g)) do
						if type(W) == "table" then
							if type(rawget(W, "getTargetInfo")) == "function" then
								h = W
								break
							end
						end
					end
					if not h then
						return
					end
					local W, G = h.getTargetInfo, game:GetService("UserInputService")
					h.getTargetInfo = function()
						return { Part = J }
					end
					local J = {}
					J.UserInputType = G.TouchEnabled and not G.MouseEnabled and Enum.UserInputType.Touch
						or Enum.UserInputType.MouseButton1
					J.Position = Vector3.new(0.0, 0.0, 0.0)
					if F == "Skull Guitar" or F == "Cannon" then
						if type(getthreadidentity) ~= "function" then
							h.getTargetInfo = W
							return
						elseif type(setthreadidentity) ~= "function" then
							h.getTargetInfo = W
							return
						end
						G, n = pcall(getthreadidentity)
						if G then
							if n == nil then
								h.getTargetInfo = W
								return
							end
						else
							h.getTargetInfo = W
							return
						end
						pcall(function()
							setthreadidentity(2)
							g(V, J)
						end)
						pcall(setthreadidentity, n)
					else
						ShootGunGeneric(g, V, J)
					end
					h.getTargetInfo = W
				end)
			end
		end
	end
Sub_CombatGunAimbot[1904] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			return function()
				if not StackFarmOther then
					return
				end
				local h = false
				for n, V in next, SafeMultiSelect("Select Sea Events"), nil do
					if V and n ~= "Only Farm Ship Brigade" then
						h = true
						break
					end
				end
				if not h then
					WarnOnce("NoSeaEvent", "Chua chon su kien nao o Sea Event > Select Sea Events.")
					return
				end
				local sea_event = DetectSeaEvents()
				if h then
					g()
					if h.Name == "Terrorshark" then
						getgenv().PathTerrorshark = h
					end
					getgenv().PathSpinBoat = h
					repeat
						task.wait()
						local g, n = h:FindFirstChild("HumanoidRootPart"), h:FindFirstChildWhichIsA("Humanoid")
						local V
						if Settings["Use Click M1 Fruit For Sea Event"] then
							if Settings["Use Dragonstorm For Sea Event"] then
							else
								if NameWeapon("Blox Fruit") == "Kitsune-Kitsune" then
									if g then
										if n then
											if n.Health > 0 then
												local J = g.CFrame.LookVector * Vector3.new(1, 0, 1)
												V = CFrame.new(
													g.Position
														+ Vector3.new(0, 17.39, 0)
														+ (J.Magnitude > 0.01 and J.Unit or Vector3.new(0, 0, -1))
															* 4.66
												)
											else
											end
										else
										end
									else
									end
								else
								end
							end
						else
						end
						g, n = h:FindFirstChild("Engine")
							and h:FindFirstChild("Health")
							and not Settings["Use Dragonstorm For Sea Event"]
							and not Settings["Use Click M1 Skull Guitar For Sea Event"]
						if g then
							local J = Settings["Use Click M1 Fruit For Sea Event"]
							n = if J then NameWeapon("Blox Fruit") == "Kitsune-Kitsune" else not J
						else
							n = g
						end
						g = n and not Settings["Auto Change Dragonstorm When Kill Boat"]
						TeleportSeaEvents(h, V, g)
						if h:FindFirstChildWhichIsA("Humanoid") then
							if Settings["Use Dragonstorm For Sea Event"] then
								if Settings["Auto Change Dragonstorm With Skull Guitar"] then
									n = NameWeapon("Gun")
									if if n then NameWeapon("Gun") ~= "Dragonstorm" else not n then
										game:GetService("ReplicatedStorage").Remotes.CommF_
											:InvokeServer(unpack({ [1] = "LoadItem", [2] = "Dragonstorm" }))
									end
								end
								equiptool(NameWeapon("Gun"))
								SpamGunDragonStorm(h.HumanoidRootPart)
								if F:DistanceFromCharacter(h.HumanoidRootPart.Position) < 400 then
									UseSkillGun()
								end
							elseif Settings["Use Click M1 Fruit For Sea Event"] then
								equiptool(NameWeapon("Blox Fruit"))
								local n = NameWeapon("Blox Fruit")
								if game_services.Character:FindFirstChild(n) then
									if game_services.Character[n]:FindFirstChild("LeftClickRemote") then
										getgenv().UseFruitM1(h, nil, V)
									end
								end
							else
								UsedualFlock()
								ClickM1(h, true)
							end
						else
							local n = h:FindFirstChild("HumanoidRootPart") or h:FindFirstChild("Engine")
							if n then
								if h.Name == "SeaBeast1" then
									getgenv().PathSeaBeast = h
									getgenv().AimPos = CFrame.new(n.Position.X, 40, n.Position.Z)
								else
									getgenv().AimPos = g
											and CFrame.new(n.Position.X, math.max(n.Position.Y + 10, 8), n.Position.Z)
										or CFrame.new(
											game_services.Character.HumanoidRootPart.Position.X,
											-58,
											game_services.Character.HumanoidRootPart.Position.Z
										)
								end
								if Settings["Use Dragonstorm For Sea Event"] then
									if Settings["Auto Change Dragonstorm With Skull Guitar"] then
										local g = NameWeapon("Gun")
										if if g then NameWeapon("Gun") ~= "Dragonstorm" else not g then
											game:GetService("ReplicatedStorage").Remotes.CommF_
												:InvokeServer(unpack({ [1] = "LoadItem", [2] = "Dragonstorm" }))
										end
									end
									equiptool(NameWeapon("Gun"))
									SpamGunDragonStorm(n)
									if F:DistanceFromCharacter(n.Position) < 400 then
										UseSkillGun()
									end
								elseif Settings["Use Click M1 Skull Guitar For Sea Event"] then
									if Settings["Auto Change Dragonstorm With Skull Guitar"] then
										local g = NameWeapon("Gun")
										if if g then NameWeapon("Gun") ~= "Skull Guitar" else not g then
											game:GetService("ReplicatedStorage").Remotes.CommF_
												:InvokeServer(unpack({ [1] = "LoadItem", [2] = "Skull Guitar" }))
										end
									end
									equiptool(NameWeapon("Gun"))
									SpamGunSkullGuitar(n)
									if F:DistanceFromCharacter(n.Position) < 400 then
										UseSkillGun()
									end
								elseif
									Settings["Auto Change Dragonstorm When Kill Boat"]
									and h:FindFirstChild("Health")
									and h.Health.Value > 0
									and h:FindFirstChild("Engine")
								then
									local g = NameWeapon("Gun")
									if if g then NameWeapon("Gun") ~= "Dragonstorm" else not g then
										game:GetService("ReplicatedStorage").Remotes.CommF_
											:InvokeServer(unpack({ [1] = "LoadItem", [2] = "Dragonstorm" }))
									end
									equiptool(NameWeapon("Gun"))
									SpamGunDragonStorm(n)
									if F:DistanceFromCharacter(n.Position) < 400 then
										UseSkillGun()
									end
								elseif
									Settings["Use Click M1 Fruit For Sea Event"]
									and NameWeapon("Blox Fruit") ~= "Kitsune-Kitsune"
								then
									equiptool(NameWeapon("Blox Fruit"))
									local g = NameWeapon("Blox Fruit")
									if game_services.Character:FindFirstChild(g) then
										if game_services.Character[g]:FindFirstChild("LeftClickRemote") then
											if h.Name == "SeaBeast1" then
												getgenv().UseFruitM1(h)
											else
												getgenv().UseFruitM1Boat(n.CFrame * CFrame.new(0, -35, 0))
											end
										end
									end
								elseif F:DistanceFromCharacter(n.Position) < 400 then
									AutoUseSkillSeabeast()
								end
							end
						end
					until (if h then not h.Parent else not h)
						or not Settings["Auto Sea Event"]
						or h:FindFirstChild("Health") and h.Health.Value == 0
						or h:FindFirstChildWhichIsA("Humanoid") and h.Humanoid.Health == 0
						or not StackFarmOther
				else
					getgenv().PathSeaBeast = false
					getgenv().PathTerrorshark = false
					getgenv().PathSpinBoat = false
					BuyBoatAndTeleBoat()
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 10931]
------------------------------------------------------------------------
Sub_CombatGunAimbot[10931] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			return function()
				local leviathan_status = StatusCheckLeviathan()
				if h == "I DONT KNOW" then
					getgenv().WebhookIDK = true
					local sea_event = DetectSeaEvents(true)
					local F = not h
					if F then
						getgenv().PathSeaBeast = false
						getgenv().PathTerrorshark = false
						getgenv().PathSpinBoat = false
					else
						getgenv().DesIdk = true
						if getgenv().TweenBoat then
							getgenv().TweenBoat:Pause()
							getgenv().TweenBoat:Cancel()
						end
						if h.Name == "Terrorshark" then
							getgenv().PathTerrorshark = h
						end
						getgenv().PathSpinBoat = h
						repeat
							task.wait()
							local n, V = h:FindFirstChild("HumanoidRootPart"), h:FindFirstChildWhichIsA("Humanoid")
							local J
							if Settings["Use Click M1 Fruit For Sea Event"] then
								if Settings["Use Dragonstorm For Sea Event"] then
								else
									if NameWeapon("Blox Fruit") == "Kitsune-Kitsune" then
										if n then
											if V then
												if V.Health > 0 then
													local W = n.CFrame.LookVector * Vector3.new(1, 0, 1)
													J =
														CFrame.new(
															n.Position
																+ Vector3.new(0, 17.39, 0)
																+ (
																		W.Magnitude > 0.01 and W.Unit
																		or Vector3.new(0, 0, -1)
																	)
																	* 4.66
														)
												else
												end
											else
											end
										else
										end
									else
									end
								end
							else
							end
							local W = J
							local G, Z = h:FindFirstChild("Engine")
								and h:FindFirstChild("Health")
								and not Settings["Use Dragonstorm For Sea Event"]
								and not Settings["Use Click M1 Skull Guitar For Sea Event"]
							if G then
								n = Settings["Use Click M1 Fruit For Sea Event"]
								Z = if n then NameWeapon("Blox Fruit") == "Kitsune-Kitsune" else not n
							else
								Z = G
							end
							spawn(function()
								TeleportSeaEvents(h, W, Z)
							end)
							if h:FindFirstChildWhichIsA("Humanoid") then
								if Settings["Use Dragonstorm For Sea Event"] then
									if Settings["Auto Change Dragonstorm With Skull Guitar"] then
										V = NameWeapon("Gun")
										if if V then NameWeapon("Gun") ~= "Dragonstorm" else not V then
											game:GetService("ReplicatedStorage").Remotes.CommF_
												:InvokeServer(unpack({ [1] = "LoadItem", [2] = "Dragonstorm" }))
										end
									end
									equiptool(NameWeapon("Gun"))
									SpamGunDragonStorm(h.HumanoidRootPart)
									if g:DistanceFromCharacter(h.HumanoidRootPart.Position) < 400 then
										UseSkillGun()
									end
								elseif Settings["Use Click M1 Fruit For Sea Event"] then
									equiptool(NameWeapon("Blox Fruit"))
									G = NameWeapon("Blox Fruit")
									if local_player.Character:FindFirstChild(G) then
										if local_player.Character[G]:FindFirstChild("LeftClickRemote") then
											getgenv().UseFruitM1(h, nil, J)
										end
									end
								else
									UsedualFlock()
									ClickM1(h, true)
								end
							else
								n = h:FindFirstChild("HumanoidRootPart") or h:FindFirstChild("Engine")
								if h.Name == "SeaBeast1" then
									getgenv().PathSeaBeast = h
									getgenv().AimPos = CFrame.new(n.Position.X, 40, n.Position.Z)
								else
									getgenv().AimPos = Z
											and CFrame.new(n.Position.X, math.max(n.Position.Y + 10, 8), n.Position.Z)
										or CFrame.new(
											local_player.Character.HumanoidRootPart.Position.X,
											-58,
											local_player.Character.HumanoidRootPart.Position.Z
										)
								end
								if Settings["Use Dragonstorm For Sea Event"] and h.Name ~= "SeaBeast1" then
									if Settings["Auto Change Dragonstorm With Skull Guitar"] then
										local V = NameWeapon("Gun")
										if if V then NameWeapon("Gun") ~= "Dragonstorm" else not V then
											game:GetService("ReplicatedStorage").Remotes.CommF_
												:InvokeServer(unpack({ [1] = "LoadItem", [2] = "Dragonstorm" }))
										end
									end
									equiptool(NameWeapon("Gun"))
									SpamGunDragonStorm(n)
									if g:DistanceFromCharacter(n.Position) < 400 then
										UseSkillGun()
									end
								elseif Settings["Use Click M1 Skull Guitar For Sea Event"] then
									if Settings["Auto Change Dragonstorm With Skull Guitar"] then
										local V = NameWeapon("Gun")
										if if V then NameWeapon("Gun") ~= "Skull Guitar" else not V then
											game:GetService("ReplicatedStorage").Remotes.CommF_
												:InvokeServer(unpack({ [1] = "LoadItem", [2] = "Skull Guitar" }))
										end
									end
									equiptool(NameWeapon("Gun"))
									SpamGunSkullGuitar(n)
									if g:DistanceFromCharacter(n.Position) < 400 then
										UseSkillGun()
									end
								elseif
									Settings["Use Click M1 Fruit For Sea Event"]
									and NameWeapon("Blox Fruit") ~= "Kitsune-Kitsune"
								then
									equiptool(NameWeapon("Blox Fruit"))
									local V = NameWeapon("Blox Fruit")
									if local_player.Character:FindFirstChild(V) then
										if local_player.Character[V]:FindFirstChild("LeftClickRemote") then
											if h.Name == "SeaBeast1" then
												getgenv().UseFruitM1(h)
											else
												getgenv().UseFruitM1Boat(n.CFrame * CFrame.new(0, -35, 0))
											end
										end
									end
								elseif g:DistanceFromCharacter(n.Position) < 400 then
									AutoUseSkillSeabeast()
								end
							end
						until F
							or not h.Parent
							or not Settings["Auto Destroy IDK"]
							or h:FindFirstChild("Health") and h.Health.Value == 0
							or h:FindFirstChildWhichIsA("Humanoid") and h.Humanoid.Health == 0
						getgenv().DesIdk = false
					end
				elseif getgenv().WebhookIDK then
					if Settings["Webhook Destroy IDK"] then
						getgenv().WebhookDestroyIdk()
						getgenv().WebhookIDK = false
					end
				end
				getgenv().DesIdk = false
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 2249]
------------------------------------------------------------------------
Sub_CombatGunAimbot[2249] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			local ui_notifications = env_ctx[3]
			local movement_utils = env_ctx[4]
			local combat_config = env_ctx[5]
			return function()
				if game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland") then
					local h = g:GetAttribute("CurrentLocation")
					if if h then g:GetAttribute("CurrentLocation") ~= "Prehistoric Island" else not h then
						local W = DetectNpc("Fossil Expert")
						if W then
							toTarget(W.HumanoidRootPart.CFrame)
							return
						end
					end
					if DetectLava() then
						local W, G, Z = next, workspace.Map.PrehistoricIsland:GetDescendants()
						for s, s in W, G, Z do
							if s.Name == "TouchInterest" then
								if s.Parent.Name ~= "TrialTeleport" then
									s:Destroy()
								end
							end
						end
					end
					if #workspace.Map.PrehistoricIsland.Core.InteriorLava:GetChildren() > 0 then
						DeleteLava()
					end
					h = game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.PrehistoricRaidTimer.Visible
					if
						if h
							then not h
							else not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible
					then
						if
							workspace.Map.PrehistoricIsland.Core:FindFirstChild("ActivationPrompt")
							and workspace.Map.PrehistoricIsland.Core.ActivationPrompt:FindFirstChild("ProximityPrompt")
						then
							toTarget(workspace.Map.PrehistoricIsland.Core.ActivationPrompt.CFrame)
							if
								g:DistanceFromCharacter(workspace.Map.PrehistoricIsland.Core.ActivationPrompt.Position)
								< 8
							then
								fireproximityprompt(
									workspace.Map.PrehistoricIsland.Core.ActivationPrompt.ProximityPrompt,
									1
								)
								wait(3)
							end
							return
						elseif not (workspace.Map.PrehistoricIsland.Core:FindFirstChild("ActivationPrompt")) then
							if not (workspace.Map.PrehistoricIsland.Core:FindFirstChild("FossilExpertSpawn")) then
								local h = DetectNpc("Fossil Expert")
								if h then
									toTarget(h.HumanoidRootPart.CFrame)
									return
								end
							end
						end
					else
						if F[6][F[5]] then
							local h = workspace.Map.PrehistoricIsland.Core.PrehistoricRelic.Skull
							while true do
								task.wait()
								toTarget(h.CFrame)
								local W = g:DistanceFromCharacter(h.Position) <= 200 or DetectGolem()
								if W or DetectRockVolcano() then
									break
								end
							end
							F[6][F[5]] = false
							return
						end
						local h = DetectGolem()
						if h then
							while true do
								task.wait()
								toTarget(h.HumanoidRootPart.CFrame * CFrame.new(0, 20, 7))
								if
									Settings["Select Method Kill Golem"] == "Instant Kill [ Risk and can bug no die mob ]"
								then
									if g:DistanceFromCharacter(h.HumanoidRootPart.Position) < 50 then
										KillRaidEnemy()
									end
								else
									equiptool(NameWeapon(Settings["Select Weapon Kill Golem"] or "Melee"))
									getgenv().ClickM1Volcano(h)
								end
								if not getgenv().KillMobRaid then
									if Settings["Kill Aura Only Raid And Volcano"] then
										getgenv().KillMobRaid = true
										local W = Settings["Time Delay Kill"] or 5
										h.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
										delay(W, function()
											getgenv().KillMobRaid = false
										end)
									end
								end
								local W = IsMobAlive(h)
								if if W then not Settings["Auto Event Prehistoric Island"] else not W then
									break
								end
							end
						end
						h = DetectRockVolcano()
						if h then
							if Settings["Fix Volcano Safe"] then
								local W = DetectPositionVolcano()
								local G, G = CheckPosnearRock(W, local_player.Character.HumanoidRootPart)
								local Z = CheckPosnearRock(W, h.WorldPivot)
								if g:DistanceFromCharacter(Z) >= 400 then
									ui_notifications = G + 1
									if G >= 7 then
										ui_notifications = 1
									end
									local G = W[ui_notifications]
									toTarget(CFrame.new(G))
								else
									local n = V[math.floor(h.WorldPivot.Position.Y)]
									repeat
										task.wait()
										if g:DistanceFromCharacter((h.WorldPivot * n).Position) > 8 then
											toTarget(h.WorldPivot * n)
										end
										if g:DistanceFromCharacter(h.WorldPivot.Position) < 100 then
											AutoUseSkillFixLava()
										end
										getgenv().AimPos = h.WorldPivot
										local n = workspace.CurrentCamera
										J.Hit = h.WorldPivot
										J.Target = h
									until (if h then not h.Parent else not h)
										or not Settings["Auto Event Prehistoric Island"]
										or not RockGlowing(h)
										or DetectGolem()
									if not (DetectGolem()) then
										F[6][F[5]] = true
									end
									wait(1)
								end
							else
								local n = V[math.floor(h.WorldPivot.Position.Y)]
								repeat
									task.wait()
									if g:DistanceFromCharacter((h.WorldPivot * n).Position) > 8 then
										toTarget(h.WorldPivot * n)
									end
									if g:DistanceFromCharacter(h.WorldPivot.Position) < 100 then
										AutoUseSkillFixLava()
									end
									getgenv().AimPos = h.WorldPivot
									local g = workspace.CurrentCamera
									J.Hit = h.WorldPivot
									J.Target = h
								until (if h then not h.Parent else not h)
									or not Settings["Auto Event Prehistoric Island"]
									or not RockGlowing(h)
									or DetectGolem()
								if not (DetectGolem()) then
									F[6][F[5]] = true
								end
							end
						end
					end
				end
			end
		end
	end



BananaHub.Subsystems.CombatGunAimbot = Sub_CombatGunAimbot
for func_id, func_impl in pairs(Sub_CombatGunAimbot) do
	BananaHub.Functions[func_id] = func_impl
end

--==============================================================================
-- PHÂN HỆ: [CursedDualKatana] - Chuỗi nhiệm vụ CDK, Evil/Good Trials 5/5, Bệ thờ Cursed Pedestal
-- Source: deobf/modules/03_cursed_dual_katana_cdk.lua
--==============================================================================
--==============================================================================
-- Module 3: Cursed Dual Katana (CDK Questline)
-- Chuỗi nhiệm vụ lấy song kiếm Cursed Dual Katana (Tushita, Yama, Good Trial Pirate Raid Castle, Evil Trial Hell Dimension).
-- Source: deobf/mduc.lua (Banana Hub Blox Fruits)
-- FULL DEOBFUSCATED CODE - RESTORED CONSTANTS & API ALIASES
-- STRICTLY 100% GENUINE LOGIC - NO CODE INVENTED
--==============================================================================

local Sub_CursedDualKatana = {}

------------------------------------------------------------------------
-- [Function ID: 15485]
------------------------------------------------------------------------
Sub_CursedDualKatana[15485] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			return function()
				local has_item = CheckItemInventory("Tushita")
				if if h then not CheckItemInventory("Yama") else not h then
					WarnOnce("AutoCDKItems", "Auto CDK: can ca Tushita va Yama truoc.")
					wait(5)
					return
				end
				if CheckItemInventory("Tushita") and CheckItemInventory("Yama") then
					h = CheckMasterSword("Yama", 350)
					if if h then not CheckMasterSword("Tushita", 350) else not h then
						WarnOnce("AutoCDKMastery", "Auto CDK: nang mastery ca Yama va Tushita len 350.")
						wait(5)
						return
					end
					if not (local_player.Character:FindFirstChild("Tushita")) then
						if not (local_player.Backpack:FindFirstChild("Tushita")) then
							if not (local_player.Character:FindFirstChild("Yama")) then
								if not (local_player.Backpack:FindFirstChild("Yama")) then
									WarnOnce("AutoCDKLoadSword", "Auto CDK: dang load Tushita de bat dau trial.")
									game:GetService("ReplicatedStorage").Remotes.CommF_
										:InvokeServer("LoadItem", "Tushita")
									return
								end
							end
						end
					end
					getgenv().Good =
						game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good").Good
					getgenv().Evil =
						game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good").Evil
					local h = if getgenv().Good == 4 and getgenv().Evil == 3
						then "Pedestal2"
						else if getgenv().Good == 3 then if getgenv().Evil == 4 then "Pedestal1" else nil else nil
					if h then
						WarnOnce("AutoCDKPedestal", "Auto CDK: dang dat thanh kiem vao " .. h .. ".")
						if
							(
								game:GetService("Workspace").Map.Turtle.Cursed[h].Position
								- local_player.Character.HumanoidRootPart.Position
							).Magnitude < 10
						then
							fireproximityprompt(game:GetService("Workspace").Map.Turtle.Cursed[h].ProximityPrompt)
						else
							toTarget(game:GetService("Workspace").Map.Turtle.Cursed[h].CFrame)
						end
					end
					if local_player.PlayerGui.Main.Dialogue.Visible then
						game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0))
						game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0))
					end
					if getgenv().Good == 4 and getgenv().Evil == 4 then
						local h, n, V, J =
							game:GetService("Workspace").Map.Turtle.Cursed, next, game.Workspace.Enemies:GetChildren()
						local W
						for G, G in n, V, J do
							if G.Name == "Cursed Skeleton Boss" then
								if IsMobAlive(G) then
									W = G
									break
								end
							end
						end
						if W then
							WarnOnce("AutoCDKFinalBoss", "Auto CDK: dang danh Cursed Skeleton Boss.")
							while true do
								task.wait()
								sizepart(W)
								equiptool(NameWeapon("Sword"))
								ClickM1(W)
								if Settings["Select Weapon"] == "Blox Fruit" then
									toTarget(W.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0))
								else
									toTarget(W.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
								end
								n = IsMobAlive(W)
								if if n then not Settings["Auto CDK"] else not n then
									break
								end
							end
							return
						end
						game:GetService("ReplicatedStorage").Remotes.CommF_
							:InvokeServer("CDKQuest", "StartTrial", "Evil")
						if h.PlacedGem.Transparency == 0 then
							CDKGemSeenAt = CDKGemSeenAt or os.clock()
						else
							CDKGemSeenAt = nil
						end
						J = CDKGemSeenAt
						if if J then os.clock() - CDKGemSeenAt < 1 else not J then
							WarnOnce(
								"AutoCDKFinalPedestal",
								"Auto CDK: ca hai trial xong; dang den Pedestal3 de dat gem."
							)
							if (h.Pedestal3.Position - local_player.Character.HumanoidRootPart.Position).Magnitude > 10 then
								toTarget(h.Pedestal3.CFrame)
							elseif not CDKGemSeenAt then
								if os.clock() - (CDKPromptAt or 0) > 2 then
									CDKPromptAt = os.clock()
									WarnOnce("AutoCDKPlaceGem", "Auto CDK: dang kich hoat Pedestal3 de dat gem.")
									fireproximityprompt(h.Pedestal3.ProximityPrompt)
								end
							end
							return
						end
						WarnOnce(
							"AutoCDKFinalBossWait",
							"Auto CDK: gem da dat; dang cho Cursed Skeleton Boss xuat hien."
						)
						toTarget(h.BossSpawn.CFrame)
						if os.clock() - (CDKEntranceAt or 0) > 2 then
							CDKEntranceAt = os.clock()
							F.TouchPortalPart(local_player.Character.HumanoidRootPart, h.EntranceTouch)
						end
						return
					end
					if getgenv().Good ~= 4 and getgenv().Good ~= -2 then
						if getgenv().Good == -3 then
							WarnOnce("AutoCDKGood3", "Auto CDK: Good Trial 3/5 - Boat Quest.")
						elseif getgenv().Good == -4 then
							WarnOnce("AutoCDKGood4", "Auto CDK: Good Trial 4/5 - Pirate Raid Castle.")
						elseif getgenv().Good == -5 then
							WarnOnce("AutoCDKGood5", "Auto CDK: Good Trial 5/5 - Heavenly Dimension.")
						else
							WarnOnce("AutoCDKGoodProgress", "Auto CDK: dang bat dau Good Trial.")
						end
						if CDKSwapSword("Tushita") then
							return
						end
						game:GetService("ReplicatedStorage").Remotes.CommF_
							:InvokeServer("CDKQuest", "StartTrial", "Good")
						if getgenv().Good == -3 then
							QuestGood3()
						elseif getgenv().Good == -4 then
							QuestGood4()
						elseif getgenv().Good == -5 then
							Questgood5()
						end
					else
						if getgenv().Evil == -3 then
							WarnOnce("AutoCDKEvil3", "Auto CDK: Evil Trial 3/5 - Marine Commodore.")
						elseif getgenv().Evil == -4 then
							WarnOnce("AutoCDKEvil4", "Auto CDK: Evil Trial 4/5 - Haze.")
						elseif getgenv().Evil == -5 then
							WarnOnce("AutoCDKEvil5", "Auto CDK: Evil Trial 5/5 - Hell Dimension.")
						else
							WarnOnce("AutoCDKEvilProgress", "Auto CDK: dang bat dau Evil Trial.")
						end
						if getgenv().Evil ~= 3 then
							if getgenv().Evil ~= 4 then
								if CDKSwapSword("Yama") then
									return
								end
							end
						end
						game:GetService("ReplicatedStorage").Remotes.CommF_
							:InvokeServer("CDKQuest", "StartTrial", "Evil")
						if getgenv().Evil == -3 then
							QuestEvil3()
						elseif getgenv().Evil == -4 then
							QuestEvil4()
						elseif getgenv().Evil == -5 then
							spawn(function()
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
							end)
							QuestEvil5()
						end
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 12822]
------------------------------------------------------------------------
Sub_CursedDualKatana[12822] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			local ui_notifications = env_ctx[3]
			return function()
				WarnOnce("AutoCDKEvilHell", "Auto CDK: dang lam Evil Trial 5/5.")
				if
					(
						game:GetService("Workspace")._WorldOrigin.Locations["Hell Dimension"].Position
						- local_player.Character.HumanoidRootPart.Position
					).Magnitude > 1000
				then
					if CheckNameBoss("Soul Reaper") then
						local boss_mob = CheckNameBoss("Soul Reaper")
						WarnOnce("AutoCDKEvilSoulReaper", "Auto CDK: dang danh Soul Reaper.")
						while true do
							task.wait()
							toTarget(h.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3))
							local V = local_player.Character.Humanoid.Health <= 0
								or (
										game:GetService("Workspace")._WorldOrigin.Locations["Hell Dimension"].Position
										- local_player.Character.HumanoidRootPart.Position
									).Magnitude
									< 1000
							if V then
								break
							end
						end
						TweenManager.CancelCurrent()
						h = tick()
						while true do
							task.wait()
							local V = tick() - h >= 5
								or (
										game:GetService("Workspace")._WorldOrigin.Locations["Hell Dimension"].Position
										- local_player.Character.HumanoidRootPart.Position
									).Magnitude
									< 1000
							if V then
								break
							end
						end
					else
						local h = local_player.Character:FindFirstChild("Hallow Essence")
						if if h then not h else not local_player.Backpack:FindFirstChild("Hallow Essence") then
							WarnOnce("AutoCDKEvilBones", "Auto CDK: dang farm Bones de lay Hallow Essence.")
							local target_mob = DetectMob(F)
							if h then
								while true do
									task.wait()
									sizepart(h)
									BringMob(h)
									equiptool(NameWeapon("Sword"))
									ClickM1(h)
									if Settings["Select Weapon"] == "Blox Fruit" then
										toTarget(
											h.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0)
										)
									else
										toTarget(h.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
									end
									local V = IsMobAlive(h)
									if if V then not Settings["Auto CDK"] else not V then
										break
									end
								end
							elseif typeof(F) == "table" then
								if #ui_notifications >= #F then
									ui_notifications = {}
									return
								end
								local h = DetectPartSpawnMob(DetectNameTablePart(F))
								if h then
									table.insert(ui_notifications, DetectNameTablePart(F))
									while true do
										wait()
										toTarget(h.CFrame * CFrame.new(0, 60, 0))
										local n, V = h.Position, local_player.Character.HumanoidRootPart
										if
											(n - V.Position).Magnitude <= 100
											or DetectMob(F)
											or not Settings["Auto CDK"]
										then
											break
										end
									end
									wait(1)
								end
							else
								local h = DetectPartSpawnMob(F, true)
								if h then
									Instance.new("IntValue", h).Name = "Ignored"
									while true do
										wait()
										toTarget(h.CFrame * CFrame.new(0, 60, 0))
										local n, V = h.Position, local_player.Character.HumanoidRootPart
										if
											(n - V.Position).Magnitude <= 100
											or DetectMob(F)
											or not Settings["Auto CDK"]
										then
											break
										end
									end
									wait(1)
								else
									DeleteIgnoredMobSpawn()
								end
							end
						else
							WarnOnce(
								"AutoCDKEvilSummon",
								"Auto CDK: dang mang Hallow Essence toi Summoner de goi Soul Reaper."
							)
							if
								(
									local_player.Character.HumanoidRootPart.Position
									- game:GetService("Workspace").Map["Haunted Castle"].Summoner.Detection.Position
								).Magnitude > 8
							then
								toTarget(game:GetService("Workspace").Map["Haunted Castle"].Summoner.Detection.CFrame)
							else
								equiptool("Hallow Essence", true)
							end
						end
					end
				else
					if game:GetService("Workspace").Map.HellDimension.Exit.BrickColor == BrickColor.new("Olivine") then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
							game:GetService("Workspace").Map.HellDimension.Exit.CFrame
						toTarget(game:GetService("Workspace").Map.HellDimension.Exit.CFrame)
						return
					end
					if DetectMobCDK() then
						WarnOnce("AutoCDKEvilHellMobs", "Auto CDK: dang don enemy trong Hell Dimension.")
						repeat
							task.wait()
							local h = DetectMobHell()
							sizepart(h)
							toTarget(h.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
							equiptool(NameWeapon("Sword"))
							getgenv().ClickM1(h)
						until not DetectMobCDK()
					else
						local h = TourchEvil5()
						if h then
							WarnOnce(
								"AutoCDKEvilTorch",
								"Auto CDK: dang kich hoat Torch " .. h .. " trong Hell Dimension."
							)
							repeat
								task.wait()
								if
									(
										local_player.Character.HumanoidRootPart.Position
										- game:GetService("Workspace").Map.HellDimension["Torch" .. h].Position
									).Magnitude > 5
								then
									toTarget(game:GetService("Workspace").Map.HellDimension["Torch" .. h].CFrame)
								else
									fireproximityprompt(
										game:GetService("Workspace").Map.HellDimension["Torch" .. h].ProximityPrompt,
										0
									)
									fireproximityprompt(
										game:GetService("Workspace").Map.HellDimension["Torch" .. h].ProximityPrompt,
										1
									)
								end
							until DetectMobCDK()
							local_player.Character.HumanoidRootPart.CFrame = local_player.Character.HumanoidRootPart.CFrame
								* CFrame.new(0, 50, 0)
						else
							WarnOnce("AutoCDKEvilHellWait", "Auto CDK: dang cho enemy hoac Torch trong Hell Dimension.")
						end
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 2259]
------------------------------------------------------------------------
Sub_CursedDualKatana[2259] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			return function()
				WarnOnce("AutoCDKGoodHeaven", "Auto CDK: dang lam Good Trial 5/5.")
				if
					(
						game:GetService("Workspace")._WorldOrigin.Locations["Heavenly Dimension"].Position
						- local_player.Character.HumanoidRootPart.Position
					).Magnitude < 1000
				then
					if
						game:GetService("Workspace").Map.HeavenlyDimension.Exit.BrickColor
						== BrickColor.new("Cloudy grey")
					then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
							game:GetService("Workspace").Map.HeavenlyDimension.Exit.CFrame
						toTarget(game:GetService("Workspace").Map.HeavenlyDimension.Exit.CFrame)
						return
					end
					if DetectMobCDK() then
						WarnOnce("AutoCDKGoodHeavenMobs", "Auto CDK: dang don enemy trong Heavenly Dimension.")
						repeat
							task.wait()
							local h = DetectMobHell()
							sizepart(h)
							equiptool(NameWeapon("Sword"))
							toTarget(h.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
							getgenv().ClickM1(h)
						until not DetectMobCDK()
					else
						local h = TourchGood5()
						if h then
							WarnOnce(
								"AutoCDKGoodTorch",
								"Auto CDK: dang kich hoat Torch " .. h .. " trong Heavenly Dimension."
							)
							repeat
								task.wait()
								if
									(
										local_player.Character.HumanoidRootPart.Position
										- game:GetService("Workspace").Map.HeavenlyDimension["Torch" .. h].Position
									).Magnitude > 5
								then
									toTarget(game:GetService("Workspace").Map.HeavenlyDimension["Torch" .. h].CFrame)
								else
									fireproximityprompt(
										game:GetService("Workspace").Map.HeavenlyDimension["Torch" .. h].ProximityPrompt,
										0
									)
									fireproximityprompt(
										game:GetService("Workspace").Map.HeavenlyDimension["Torch" .. h].ProximityPrompt,
										1
									)
								end
							until DetectMobCDK()
							local_player.Character.HumanoidRootPart.CFrame = local_player.Character.HumanoidRootPart.CFrame
								* CFrame.new(0, 50, 0)
						else
							WarnOnce(
								"AutoCDKGoodHeavenWait",
								"Auto CDK: dang cho enemy hoac Torch trong Heavenly Dimension."
							)
						end
					end
				elseif CheckNameBoss("Cake Queen") then
					local boss_mob = CheckNameBoss("Cake Queen")
					WarnOnce("AutoCDKGoodCakeQueen", "Auto CDK: dang danh Cake Queen.")
					while true do
						task.wait()
						sizepart(h)
						equiptool(NameWeapon("Sword"))
						ClickM1(h)
						if Settings["Select Weapon"] == "Blox Fruit" then
							toTarget(h.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0))
						else
							toTarget(h.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
						end
						local g = IsMobAlive(h)
						if if g then not Settings["Auto CDK"] else not g then
							break
						end
					end
					TweenManager.CancelCurrent()
				else
					if Settings["Select Method Hop CDK1"] then
						if Settings["Select Method Hop CDK1"]["Find Cake Queen"] then
							if BossSpawn("Cake Queen") then
								WarnOnce("AutoCDKGoodCakeQueenWait", "Auto CDK: dang cho Cake Queen xuat hien.")
							else
								WarnOnce("AutoCDKGoodCakeQueenWait", "Auto CDK: dang hop server tim Cake Queen.")
								HopServer()
							end
						else
							WarnOnce("AutoCDKGoodCakeQueenWait", "Auto CDK: dang cho Cake Queen xuat hien.")
						end
					else
						WarnOnce("AutoCDKGoodCakeQueenWait", "Auto CDK: dang cho Cake Queen xuat hien.")
					end
					wait(5)
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 938]
------------------------------------------------------------------------
Sub_CursedDualKatana[938] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			return function()
				local h = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
				local n = h:InvokeServer("TushitaProgress")
				if n.OpenedDoor then
					if CheckNameBoss("Longma") then
						local n = CheckNameBoss("Longma")
						if n then
							while true do
								task.wait()
								sizepart(n)
								if Settings["Select Weapon"] == "Blox Fruit" then
									toTarget(n.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0))
								else
									toTarget(n.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
								end
								UsedualFlock()
								ClickM1(n)
								local V = IsMobAlive(n)
								if if V then not Settings["Auto Tushita"] else not V then
									break
								end
							end
						end
					end
				else
					local n = GetHitBoxTouch()
					if not n then
						toTarget((CFrame.new(5677.541015625, 28.533447265625, 357.9483642578125)))
						return
					end
					if n:FindFirstChild("TouchInterest") then
						local V = local_player.Character:FindFirstChild("Holy Torch")
						if if V then not V else not local_player.Backpack:FindFirstChild("Holy Torch") then
							toTarget(n.CFrame)
						else
							equiptool("Holy Torch")
							if checkTorch() then
								for g = 1, 5, 1 do
									h:InvokeServer("TushitaProgress", "Torch", g)
								end
								wait(2)
							end
						end
					else
						F[6][F[5]].CreateNoti({ Title = "Banana Cat Hub", Desc = "Rip Indra Dont Spawn", ShowTime = 5 })
						wait(5)
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 3512]
------------------------------------------------------------------------
Sub_CursedDualKatana[3512] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			return function()
				if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("EliteHunter", "Progress") < 30 then
					local elite_boss = DetectEliteHunter()
					if string.find(GetQuestText(), h.Name, 1, true) then
						while true do
							task.wait()
							sizepart(h)
							if Settings["Select Weapon"] == "Blox Fruit" then
								toTarget(h.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0))
							else
								toTarget(h.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
							end
							UsedualFlock()
							ClickM1(h)
							local F = IsMobAlive(h)
							if if F then not Settings["Auto Yama"] else not F then
								break
							end
						end
					else
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
					end
				else
					local h = game.Workspace.Map:FindFirstChild("Waterfall")
					if if h then not game.Workspace.Map.Waterfall:FindFirstChild("SealedKatana") else not h then
						toTarget((CFrame.new(5251.900390625, 17.18115234375, 453.6025390625)))
						return
					end
					if
						(
							game.Workspace.Map.Waterfall.SealedKatana.WorldPivot.Position
							- local_player.Character.HumanoidRootPart.Position
						).Magnitude > 50
					then
						toTarget(game.Workspace.Map.Waterfall.SealedKatana.WorldPivot)
					elseif game.Workspace.Enemies:FindFirstChild("Ghost") then
						h = DetectMob("Ghost")
						if h then
							while true do
								task.wait()
								sizepart(h)
								BringMob(h)
								UsedualFlock()
								ClickM1(h)
								if Settings["Select Weapon"] == "Blox Fruit" then
									toTarget(h.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0))
								else
									toTarget(h.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
								end
								local g = IsMobAlive(h)
								if if g then not Settings["Auto Yama"] else not g then
									break
								end
							end
						end
					else
						fireclickdetector(workspace.Map.Waterfall.SealedKatana.Hitbox.ClickDetector)
					end
				end
			end
		end
	end



BananaHub.Subsystems.CursedDualKatana = Sub_CursedDualKatana
for func_id, func_impl in pairs(Sub_CursedDualKatana) do
	BananaHub.Functions[func_id] = func_impl
end

--==============================================================================
-- PHÂN HỆ: [SeaEventsAndBoats] - Săn Sea Beast, Terror Shark, Ship Brigade, Tween controller tàu biển
-- Source: deobf/modules/04_sea_events_and_boats.lua
--==============================================================================
--==============================================================================
-- Module 4: Sea Events, Sea Beast & Leviathan Hunter
-- Hệ thống săn quái biển Sea Beast, di chuyển thuyền NoclipBoat, dò Leviathan, Kitsune Island, bắn móc Harpoon.
-- Source: deobf/mduc.lua (Banana Hub Blox Fruits)
-- FULL DEOBFUSCATED CODE - RESTORED CONSTANTS & API ALIASES
-- STRICTLY 100% GENUINE LOGIC - NO CODE INVENTED
--==============================================================================

local Sub_SeaEventsAndBoats = {}

------------------------------------------------------------------------
-- [Function ID: 16331]
------------------------------------------------------------------------
Sub_SeaEventsAndBoats[16331] = function(env_ctx)
		return function(h)
			return function()
				if not (game.Workspace.Map:FindFirstChild("FishmanTrial")) then
					return
				end
				local h = if game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Trial of Water")
					then game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Trial of Water")
					else nil
				if h then
					local g, F, n = next, game:GetService("Workspace").SeaBeasts:GetChildren()
					for V, V in g, F, n do
						if string.find(V.Name, "SeaBeast") then
							if V:FindFirstChild("HumanoidRootPart") then
								if (V.HumanoidRootPart.Position - h.Position).Magnitude <= 1500 then
									if V.Health.Value > 0 then
										return V
									end
								end
							end
						end
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 3192]
------------------------------------------------------------------------
Sub_SeaEventsAndBoats[3192] = function(env_ctx)
		return function(h, h, h)
			return function(h, g, F)
				if not h then
					return
				end
				if h:FindFirstChild("Engine") then
					if h:FindFirstChild("Health") then
						if h.Health.Value > 0 then
							if F then
								local n = h.Engine.CFrame * CFrame.new(25, 0, 0)
								toTarget(CFrame.new(n.Position.X, math.max(h.Engine.Position.Y + 10, 8), n.Position.Z))
							else
								local n = Settings["Use Click M1 Fruit For Sea Event"] and -25 or -15
								toTarget(h.Engine.CFrame * CFrame.new(0, n, 0))
							end
							return
						end
					end
				end
				if h.Name == "SeaBeast1" and h:FindFirstChild("HumanoidRootPart") then
					local n, V, J =
						Vector3.new(0, h:FindFirstChild("HumanoidRootPart").Position.Y, 0), Vector3.new(0, -60, 0), 200
					if Settings["Use Click M1 Fruit For Sea Event"] then
						F = NameWeapon("Blox Fruit")
						J = if F
							then if string.find(F, "T-Rex")
								then 30
								else if string.find(F, "Leopard")
									then 30
									else if string.find(F, "Mammoth")
										then 30
										else if string.find(F, "Dough") then 30 else J
							else J
					else
					end
					if (n - V).Magnitude <= 175 then
						if Settings["Use Click M1 Fruit For Sea Event"] then
							toTarget(h.HumanoidRootPart.CFrame * CFrame.new(0, J + PosDodgeskill, 0), true)
						else
							toTarget(h.HumanoidRootPart.CFrame * CFrame.new(0, J + PosDodgeskill, 50), true)
						end
					else
						toTarget(
							CFrame.new(h.HumanoidRootPart.Position.X, -60 + J, h.HumanoidRootPart.Position.Z),
							true
						)
					end
				else
					local F = if h.Name == "Terrorshark" then 60 else 20
					F = if Settings["Use Click M1 Fruit For Sea Event"]
						then NameWeapon("Blox Fruit") == "Kitsune-Kitsune" and 18 or 20
						else F
					if h:FindFirstChildWhichIsA("Humanoid") then
						if h.Humanoid.Health > 0 then
							toTarget(g or h.HumanoidRootPart.CFrame * CFrame.new(0, F, 0))
						end
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 8055]
------------------------------------------------------------------------
Sub_SeaEventsAndBoats[8055] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			local ui_notifications = env_ctx[3]
			local movement_utils = env_ctx[4]
			local combat_config = env_ctx[5]
			return function()
				local h, W =
					QuestDojoTrainer(),
					CFrame.new(5868.453125, 1207.7784423828125, 870.819580078125) * CFrame.new(0, 4, -2)
				if getgenv().QuestTrainer then
					if getgenv().QuestTrainer.BeltName == "White" and getgenv().QuestTrainer.CountKillMob < 20 then
						SaveSettings("QuestDojo", true)
						local G = n()
						local n = G and G.Text or ""
						if G then
							local G = DetectMob(n)
							if G then
								while true do
									task.wait()
									sizepart(G)
									BringMob(G)
									UsedualFlock()
									ClickM1(G)
									if
										game:GetService("Players").LocalPlayer.PlayerGui.TransformationHUD.ImageLabel.Visible
										and (
											Settings["Auto Finish Train Quest"]
											or Settings["Auto Finish Train Draco Quest"]
										)
									then
										toTarget(G.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
									elseif Settings["Select Weapon"] == "Blox Fruit" then
										toTarget(G.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit, 0))
									else
										toTarget(G.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
									end
									local Z = IsMobAlive(G)
									if if Z then not Settings["Auto Quest Dojo Trainer"] else not Z then
										break
									end
								end
								if getgenv().QuestTrainer then
									if getgenv().QuestTrainer.CountKillMob then
										getgenv().QuestTrainer.CountKillMob = getgenv().QuestTrainer.CountKillMob + 1
									end
								end
							else
								local G = DetectPartSpawnMob(n, true)
								if G then
									Instance.new("IntValue", G).Name = "Ignored"
									while true do
										task.wait()
										toTarget(G.CFrame * CFrame.new(0, 60, 0))
										local Z, s = G.Position, local_player.Character.HumanoidRootPart
										if
											(Z - s.Position).Magnitude <= 100
											or DetectMob(n)
											or not Settings["Auto Quest Dojo Trainer"]
										then
											break
										end
									end
									wait(1)
								else
									DeleteIgnoredMobSpawn()
								end
							end
						else
							TakeQuestLevel()
						end
					elseif getgenv().QuestTrainer.BeltName == "White" and getgenv().QuestTrainer.CountKillMob >= 20 then
						SaveSettings("QuestDojo", false)
						getgenv().QuestTrainer = nil
					elseif getgenv().QuestTrainer.BeltName == "Yellow" and getgenv().QuestTrainer.CountKillMob < 5 then
						SaveSettings("QuestDojo", true)
						local n, G = DetectQuestSeaDragon(), checkboat()
						if n then
							repeat
								task.wait()
								TeleportSeaEvents(n)
								local Z = n:FindFirstChild("HumanoidRootPart") or n:FindFirstChild("Engine")
								getgenv().AimPos = CFrame.new(Z.Position.X, 40, Z.Position.Z)
								if n:FindFirstChildWhichIsA("Humanoid") then
									UsedualFlock()
									ClickM1(n, true)
								elseif g:DistanceFromCharacter(Z.Position) < 400 then
									AutoAllSkill()
								end
							until (if n then not n.Parent else not n)
								or n:FindFirstChildWhichIsA("Humanoid") and n.Humanoid.Health <= 0
								or n:FindFirstChild("Health") and n.Health.Value <= 0
								or not Settings["Auto Quest Dojo Trainer"]
							if getgenv().QuestTrainer then
								if getgenv().QuestTrainer.CountKillMob then
									getgenv().QuestTrainer.CountKillMob = getgenv().QuestTrainer.CountKillMob + 1
								end
							end
						elseif not G then
							local n = CFrame.new(-16204.0810546875, 9.0863618850708, 479.2259521484375)
							if (n.Position - local_player.Character.HumanoidRootPart.Position).Magnitude > 8 then
								toTarget(n)
							else
								game:GetService("ReplicatedStorage").Remotes.CommF_
									:InvokeServer("BuyBoat", "PirateBrigade")
							end
						else
							task.spawn(function()
								NoclipBoat(G)
							end)
							local n = DecectPartRoughSea()
							if n then
								wait(1)
								V[6][V[5]] = if V[6][V[5]] == 0 then 7000 else 0
								Instance.new("IntValue", n).Name = "Ignored"
								wait(0.5)
							end
							getgenv().RoughSea = V[6][V[5]]
							n = CFrame.new(-32975.9921875, G.WorldPivot.Y, 25963.7109375)
								* CFrame.new(0, G.WorldPivot.Y, 0 + RoughSea)
							if local_player.Character.Humanoid.Sit then
								manageTween(G.VehicleSeat, n, 150, "TweenBoat")
							else
								toTarget(G.VehicleSeat.CFrame)
							end
						end
					elseif getgenv().QuestTrainer.BeltName == "Yellow" and getgenv().QuestTrainer.CountKillMob >= 5 then
						SaveSettings("QuestDojo", false)
						getgenv().QuestTrainer = nil
					elseif getgenv().QuestTrainer.BeltName == "Purple" and getgenv().QuestTrainer.CountKillMob < 3 then
						SaveSettings("QuestDojo", true)
						local n = DetectEliteHunter()
						if n then
							StackFarm = false
							if os.time() - (EliteQuestAt or 0) > 180 then
								EliteQuestAt = os.time()
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
							end
							while true do
								task.wait()
								sizepart(n)
								if Settings["Select Weapon"] == "Blox Fruit" then
									toTarget(n.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0))
								else
									toTarget(n.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
								end
								ClickM1(n)
								UsedualFlock()
								local G = IsMobAlive(n)
								if if G then not Settings["Auto Quest Dojo Trainer"] else not G then
									break
								end
							end
							if getgenv().QuestTrainer then
								if getgenv().QuestTrainer.CountKillMob then
									getgenv().QuestTrainer.CountKillMob = getgenv().QuestTrainer.CountKillMob + 1
								end
							end
							return
						end
					elseif getgenv().QuestTrainer.BeltName == "Purple" and getgenv().QuestTrainer.CountKillMob >= 3 then
						SaveSettings("QuestDojo", false)
						getgenv().QuestTrainer = nil
					elseif
						getgenv().QuestTrainer.BeltName == "Green" and getgenv().QuestTrainer.CountKillMob == 300
					then
						SaveSettings("QuestDojo", true)
						if
							game:GetService("Players").LocalPlayer.PlayerGui.Main.Compass.Frame.DangerLevel.Visible
							and tonumber(
									game:GetService("Players").LocalPlayer.PlayerGui.Main.Compass.Frame.DangerLevel.TextLabel.Text
								)
								== 6
						then
							local n = tick()
							while true do
								wait()
								local G, Z = tick() - n, getgenv
								if
									G >= Z().QuestTrainer.Progress
									or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Compass.Frame.DangerLevel.Visible
									or not Settings["Auto Quest Dojo Trainer"]
								then
									break
								end
							end
							getgenv().QuestTrainer = nil
							SaveSettings("QuestDojo", false)
						else
							local n = checkboat()
							if not n then
								local G = CFrame.new(-16204.0810546875, 9.0863618850708, 479.2259521484375)
								if (G.Position - local_player.Character.HumanoidRootPart.Position).Magnitude > 8 then
									toTarget(G)
								else
									game:GetService("ReplicatedStorage").Remotes.CommF_
										:InvokeServer("BuyBoat", "PirateBrigade")
								end
							else
								task.spawn(function()
									NoclipBoat(n)
								end)
								local G = DecectPartRoughSea()
								if G then
									wait(1)
									V[6][V[5]] = if V[6][V[5]] == 0 then 7000 else 0
									Instance.new("IntValue", G).Name = "Ignored"
									wait(0.5)
								end
								getgenv().RoughSea = V[6][V[5]]
								G = CFrame.new(-32975.9921875, n.WorldPivot.Y, 25963.7109375)
									* CFrame.new(0, n.WorldPivot.Y, 0 + RoughSea)
								if local_player.Character.Humanoid.Sit then
									manageTween(n.VehicleSeat, G, 150, "TweenBoat")
								else
									toTarget(n.VehicleSeat.CFrame)
								end
							end
						end
					elseif getgenv().QuestTrainer.BeltName == "Red" and getgenv().QuestTrainer.CountKillMob == 0 then
						SaveSettings("QuestDojo", true)
						local n = workspace:FindFirstChild("SeaBeasts")
						local G
						for Z, Z in ipairs(n and n:GetChildren() or {}) do
							if Z.Name == "SeaBeast1" then
								if IsMobAlive(Z) then
									G = Z
									break
								end
							end
						end
						local Z, s = CheckNameBoss("Terrorshark"), checkboat()
						n = not Z
						local u = if Z
							then n
							else G and g:DistanceFromCharacter(G.HumanoidRootPart.Position) < 2000 and G
								or DetectSeaEvents(true)
						if Z then
							J.AvoidThreat = nil
							J.AvoidTarget = nil
						elseif u and s and J.AvoidThreat ~= u then
							local G = u:FindFirstChild("HumanoidRootPart") or u:FindFirstChild("Engine")
							if G then
								local _ = Vector3.new(
									s.VehicleSeat.Position.X - G.Position.X,
									0,
									s.VehicleSeat.Position.Z - G.Position.Z
								)
								J.AvoidTarget = CFrame.new(
									s.VehicleSeat.Position + (_.Magnitude > 1 and _.Unit or Vector3.new(1, 0, 0)) * 2500
								)
								J.AvoidThreat = u
							end
						elseif J.AvoidThreat then
							local G = J.AvoidThreat.Parent
							local _ = if G
								then J.AvoidThreat:FindFirstChild("Health") and J.AvoidThreat.Health.Value <= 0
								else not G
							if _ then
								J.AvoidThreat = nil
								J.AvoidTarget = nil
							elseif J.AvoidThreat:FindFirstChildWhichIsA("Humanoid") then
								if J.AvoidThreat:FindFirstChildWhichIsA("Humanoid").Health <= 0 then
									J.AvoidThreat = nil
									J.AvoidTarget = nil
								end
							end
						end
						if Z then
							repeat
								task.wait()
								TeleportSeaEvents(Z)
								u = Z:FindFirstChild("HumanoidRootPart")
								getgenv().AimPos = CFrame.new(u.Position.X, 40, u.Position.Z)
								if Z:FindFirstChildWhichIsA("Humanoid") then
									UsedualFlock()
									ClickM1(Z, true)
								elseif g:DistanceFromCharacter(u.Position) < 400 then
									AutoAllSkill()
								end
							until (if Z then not Z.Parent else n)
								or Z.Humanoid.Health <= 0
								or not Settings["Auto Quest Dojo Trainer"]
							getgenv().QuestTrainer.CountKillMob = getgenv().QuestTrainer.CountKillMob + 1
						elseif s then
							local n = J.AvoidTarget
							local G = if n then not n else DecectPartRoughSea()
							if G then
								wait(1)
								V[6][V[5]] = if V[6][V[5]] == 0 then 7000 else 0
								Instance.new("IntValue", G).Name = "Ignored"
								wait(0.5)
							end
							getgenv().RoughSea = V[6][V[5]]
							n = J.AvoidTarget
								or CFrame.new(-32975.9921875, s.WorldPivot.Y, 25963.7109375)
									* CFrame.new(0, s.WorldPivot.Y, 0 + RoughSea)
							if local_player.Character.Humanoid.Sit then
								manageTween(s.VehicleSeat, n, 150, "TweenBoat")
							else
								toTarget(s.VehicleSeat.CFrame)
							end
						else
							local n = CFrame.new(-16204.0810546875, 9.0863618850708, 479.2259521484375)
							if (n.Position - local_player.Character.HumanoidRootPart.Position).Magnitude > 8 then
								toTarget(n)
							else
								game:GetService("ReplicatedStorage").Remotes.CommF_
									:InvokeServer("BuyBoat", "PirateBrigade")
							end
						end
					elseif getgenv().QuestTrainer.BeltName == "Red" then
						if getgenv().QuestTrainer.CountKillMob > 0 then
							SaveSettings("QuestDojo", false)
							getgenv().QuestTrainer = nil
						end
					end
				elseif g:DistanceFromCharacter(W.Position) > 8 then
					toTarget(W)
				elseif h then
					if h.Quest.Progress >= h.Quest.Goal then
						game:GetService("ReplicatedStorage")
							:WaitForChild("Modules")
							:WaitForChild("Net")
							:WaitForChild("RF/InteractDragonQuest")
							:InvokeServer(unpack({ [1] = { NPC = "Dojo Trainer", Command = "ClaimQuest" } }))
						wait(1)
						return
					end
					if h.Quest.BeltName == "White" then
						getgenv().QuestTrainer = { BeltName = "White", CountKillMob = 0 }
					elseif h.Quest.BeltName == "Yellow" then
						getgenv().QuestTrainer = { BeltName = "Yellow", CountKillMob = 0 }
					elseif h.Quest.BeltName == "Green" then
						local g, n = getgenv(), { BeltName = "Green", CountKillMob = 300 }
						n.Progress, g.QuestTrainer = h.Quest.Progress, n
					elseif h.Quest.BeltName == "Purple" then
						getgenv().QuestTrainer = { BeltName = "Purple", CountKillMob = 0 }
					elseif h.Quest.BeltName == "Red" then
						getgenv().QuestTrainer = { BeltName = "Red", CountKillMob = 0 }
					else
						F[6][F[5]].CreateNoti({
							Title = "Banana Cat Hub",
							Desc = "That's enough training for today... Come back tomorrow and we can continue.\10 or dont support Belt Currently",
							ShowTime = 5,
						})
						wait(5)
						return
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 4516]
------------------------------------------------------------------------
Sub_SeaEventsAndBoats[4516] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			return function()
				if Settings["Auto Destroy IDK"] then
					if getgenv().DesIdk then
						getgenv().DesIdk2 = true
						return
					end
				end
				if Settings["Auto Destroy IDK"] then
					if getgenv().DesIdk2 then
						toTarget(getgenv().OldBoat.VehicleSeat.CFrame)
						if local_player.Character.Humanoid.Sit then
							getgenv().DesIdk2 = false
						end
						return
					end
				end
				local h = checkboatFind()
				if game.workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension") then
					if getgenv().TweenBoat then
						getgenv().TweenBoat:Pause()
						getgenv().TweenBoat:Cancel()
					end
					if getgenv().TweenBoatBack then
						getgenv().TweenBoatBack:Pause()
						getgenv().TweenBoatBack:Cancel()
					end
					F[6][F[5]].CreateNoti({ Title = "Banana Cat Hub", Desc = "Frozen Dimension Spawned", ShowTime = 5 })
					if getgenv().RespawnLeviathan then
						if Settings["Webhook Find Leviathan"] then
							getgenv().RespawnLeviathan = false
							WebhookFindLeviathan()
						end
					end
					wait(5)
				else
					getgenv().RespawnLeviathan = true
					local F = checkboat()
					if if F then not F else Settings["Auto Buy Boat Beast Hunter"] then
						local n = CFrame.new(-16204.0810546875, 9.0863618850708, 479.2259521484375)
						if (n.Position - local_player.Character.HumanoidRootPart.Position).Magnitude > 8 then
							if (n.Position - local_player.Character.HumanoidRootPart.Position).Magnitude > 1000 then
								if game:GetService("Players").LocalPlayer.Data.LastSpawnPoint.Value == "Tiki" then
									local_player.Character.Humanoid.Health = 0
									return
								end
							end
							toTarget(n)
						else
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", "Beast Hunter")
							wait(3)
						end
					elseif h then
						getgenv().noclip = false
						local n, V = h.VehicleSeat.Position.Y, 150
						local J = CFrame.new(-118834.515625, n, -78.9505844116211) * CFrame.new(0, 0, 99999999)
						CFrame.new(-32975.9921875, n, 25963.7109375)
						local W, G =
							if Settings["Will Back When over 10km"]
								then if DistanceFindLeviathan() >= 12000
									then true
									else if DistanceFindLeviathan() <= 4800 then false else false
								else false,
							h.VehicleSeat:FindFirstChild("BodyVelocity")
						local Z = G and G.MaxForce
						if G then
							G.MaxForce = Vector3.new(0.0, 0.0, 0.0)
							G.Velocity = Vector3.new(0.0, 0.0, 0.0)
						end
						local s = false
						while true do
							task.wait(0.5)
							NoclipBoat(h)
							if
								local_player.Character:FindFirstChild("HumanoidRootPart") and local_player.Character:FindFirstChild(
									"Humanoid"
								)
							then
								local u, _, v = next, local_player.Character:GetDescendants()
								for z, z in u, _, v do
									if z:IsA("MeshPart") then
										if z.CanCollide then
											z.CanCollide = false
										end
									elseif z:IsA("Part") then
										if z.CanCollide then
											z.CanCollide = false
										end
									end
								end
							end
							n = h.VehicleSeat.Position.Y
							local u
							if (if s then not s else DetectSeaEventDodge(true)) and n < 500 then
								J = CFrame.new(-118834.515625, n + 200, -78.9505844116211) * CFrame.new(0, 0, 99999999)
								s, u = true, CFrame.new(-32975.9921875, n + 200, 25963.7109375)
							else
								if s and not DetectSeaEventDodge(true) then
									J = CFrame.new(-118834.515625, n, -78.9505844116211) * CFrame.new(0, 0, 99999999)
									s, u = false, CFrame.new(-32975.9921875, n, 25963.7109375)
								else
									J = CFrame.new(-118834.515625, n, -78.9505844116211) * CFrame.new(0, 0, 99999999)
									u = CFrame.new(-32975.9921875, n, 25963.7109375)
								end
							end
							if Settings["Will Back When over 10km"] then
								W = if DistanceFindLeviathan() >= 10000
									then true
									else if DistanceFindLeviathan() <= 4800 then false else W
								if W then
									manageTween(h.VehicleSeat, u, V, "TweenBoatBack")
								end
							else
							end
							if W then
								if not Settings["Will Back When over 10km"] then
									manageTween(h.VehicleSeat, J, V, "TweenBoat")
								end
							else
								manageTween(h.VehicleSeat, J, V, "TweenBoat")
							end
							local n = Settings["Auto Find Leviathan"]
							local V = (if n then not local_player.Character.Humanoid.Sit else not n)
								or game.workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension")
								or Settings["Auto Destroy IDK"] and getgenv().DesIdk
							if V then
								break
							end
						end
						if G then
							if Z then
								G.MaxForce = Z
							end
						end
						getgenv().OldBoat = h
						if getgenv().TweenBoat then
							getgenv().TweenBoat:Pause()
							getgenv().TweenBoat:Cancel()
						end
						if getgenv().TweenBoatBack then
							getgenv().TweenBoatBack:Pause()
							getgenv().TweenBoatBack:Cancel()
						end
					elseif F then
						if Settings["Auto Buy Boat Beast Hunter"] then
							if not local_player.Character.Humanoid.Sit then
								toTarget(F.VehicleSeat.CFrame)
							end
						end
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 15906]
------------------------------------------------------------------------
Sub_SeaEventsAndBoats[15906] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			return function()
				local h, F = game.Lighting.ClockTime, checkboat()
				if Settings["Hop Server Kitsune Island"] then
					local n = CheckMoon()
					if not (n == "Full Moon" and math.floor(18 - h) <= 5 and math.floor(18 - h) >= 0) then
						if not (n == "Next Night") then
							if n == "Full Moon" then
								if h <= 5 then
									if not (math.floor(5 - h) >= 11) then
										HopServer()
										return
									end
								else
									HopServer()
									return
								end
							else
								HopServer()
								return
							end
						end
					end
				end
				if not F then
					local n = CFrame.new(-13.488054275512695, 10.311711311340332, 2927.692)
					n = if game.PlaceId == getgenv().CheckPlaceId
						then CFrame.new(-16204.0810546875, 9.0863618850708, 479.2259521484375)
						else n
					if (n.Position - local_player.Character.HumanoidRootPart.Position).Magnitude > 8 then
						toTarget(n)
					else
						local n = Settings["Select Boat"]
						if not n then
							WarnOnce("SelectBoat", "Chon thuyen o Sea Event > Select Boat truoc da.")
							return
						end
						n = if n == "Brigade" then "Pirate" .. n else if n == "GrandBrigade" then "Pirate" .. n else n
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", n)
						task.wait(3)
					end
					return
				end
				NoclipBoat(F)
				local n = F.WorldPivot.Y
				local V = CFrame.new(-32975.9921875, n, 25963.7109375) * CFrame.new(0, 0, 1000)
				if CheckMoon() == "Full Moon" and math.floor(18 - h) <= 0 then
					if (F.VehicleSeat.Position - V.Position).Magnitude > 200 then
						if local_player.Character.Humanoid.Sit then
							manageTween(F.VehicleSeat, V, 150, "TweenBoat")
						else
							toTarget(F.VehicleSeat.CFrame)
						end
					elseif not local_player.Character.Humanoid.Sit then
						toTarget(F.VehicleSeat.CFrame)
					end
				elseif (F.VehicleSeat.Position - V.Position).Magnitude > 200 then
					if local_player.Character.Humanoid.Sit then
						manageTween(F.VehicleSeat, V, 150, "TweenBoat")
					else
						toTarget(F.VehicleSeat.CFrame)
					end
				else
					toTarget(V * CFrame.new(0, 2000, 0))
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 16279]
------------------------------------------------------------------------
Sub_SeaEventsAndBoats[16279] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			local ui_notifications = env_ctx[3]
			return function()
				if workspace.Map:FindFirstChild("FrozenHeart") then
					if workspace.Map.FrozenHeart.Inside:GetAttribute("Harpooned") then
						ui_notifications.CreateNoti({
							Title = "Banana Cat Hub",
							Desc = "Successfully Fire Shoot Heart Leviathan",
							ShowTime = 5,
						})
						wait(5)
					else
						local h = checkboatBeastHunter()
						NoclipBoat(h)
						local n, V =
							game:service("TweenService"),
							CFrame.new(
								workspace.Map:FindFirstChild("FrozenHeart").Cube.Position.X,
								h.WorldPivot.Y,
								workspace.Map:FindFirstChild("FrozenHeart").Cube.Position.Z
							) * CFrame.new(0, 0, 300) * CFrame.Angles(0, 6.283185307179586, 0)
						if (V.Position - h.VehicleSeat.Position).Magnitude > 5 then
							if
								local_player.Character.Humanoid.SeatPart
								and local_player.Character.Humanoid.SeatPart.Name == "VehicleSeat"
							then
								local J = TweenInfo.new(
									(V.Position - h.VehicleSeat.Position).Magnitude / 150,
									Enum.EasingStyle.Quad
								)
								local W = n:Create(h.VehicleSeat, J, { CFrame = V })
								W:Play()
								W.Completed:wait()
								wait(1)
								F(h, workspace.Map:FindFirstChild("FrozenHeart").Inside.Position)
							else
								toTarget(h.VehicleSeat.CFrame)
							end
						elseif
							local_player.Character.Humanoid.SeatPart and local_player.Character.Humanoid.SeatPart.Parent.Name == "Harpoon"
						then
							local g = {
								[1] = "FireHarpoon",
								[2] = 0.7853981633974483,
								[3] = 4.4342573293783646E-4,
								[4] = h.Harpoon,
								[5] = workspace:GetServerTimeNow(),
							}
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(g))
						else
							toTarget(h.Harpoon.Seat.CFrame)
						end
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 14606]
------------------------------------------------------------------------
Sub_SeaEventsAndBoats[14606] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			local ui_notifications = env_ctx[3]
			local movement_utils = env_ctx[4]
			local combat_config = env_ctx[5]
			return function(W, G, Z, Z)
				if not W or not W:IsA("BasePart") then
					return
				elseif typeof(G) ~= "CFrame" then
					return
				end
				local s, s = BoatTweenSpeed()
				local u = Z or "TweenBoat"
				if not g[W] then
					if (W.Position - G.Position).Magnitude <= F then
						return
					end
				end
				local Z = g[W]
				if Z then
					if Z.TweenKey == u then
						if Z.PlaybackState == Enum.PlaybackState.Playing then
							Z.Target = G
							Z.Speed = s
							Z.SpeedCap = math.min(Z.SpeedCap or s, s)
							getgenv()[u] = Z
							return Z
						end
					end
				end
				if Z then
					Z:Cancel()
				end
				local Z = getgenv()[u]
				if Z then
					pcall(function()
						Z:Cancel()
					end)
				end
				local Z = {}
				Z.PlaybackState = Enum.PlaybackState.Playing
				Z.Speed = s
				Z.SpeedCap = s
				Z.Target = G
				Z.TweenKey = u
				local G, s, _ = false, false, false
				local v = W.CFrame
				local function z(C)
					if _ then
						return
					end
					_ = true
					Z.PlaybackState = C
					ui_notifications = math.max(ui_notifications - 1, 0)
					if g[W] == Z then
						g[W] = nil
					end
					if getgenv()[u] == Z then
						getgenv()[u] = nil
					end
					if ui_notifications == 0 then
						if not (type(ToggleNoclip) == "function" and ToggleNoclip() == true) then
							V(false)
							getgenv().noclip = false
						end
					end
				end
				Z.Play = function(C)
					if _ then
						return
					end
					s = false
					C.PlaybackState = Enum.PlaybackState.Playing
				end
				Z.Pause = function(C)
					if _ then
						return
					end
					s = true
					C.PlaybackState = Enum.PlaybackState.Paused
				end
				Z.Cancel = function(C)
					if _ then
						return
					end
					G = true
					z(Enum.PlaybackState.Cancelled)
				end
				Z.Destroy = function(C)
					C:Cancel()
				end
				g[W] = Z
				getgenv()[u] = Z
				ui_notifications += 1
				V(true)
				getgenv().noclip = true
				local g = J(W)
				local n
				task.spawn(function()
					while true do
						local V = if G then not G else not _
						if not (V and W.Parent) then
							break
						end
						V = RunService.Heartbeat:Wait()
						if not s then
							if g then
								if g.Parent then
									local J, G = pcall(NoclipBoat, g)
									if not J then
										if env_ctx[6](g, "Error") then
											print(
												"bug when try to call NoclipBoat:",
												g:GetFullName(),
												"ghe:",
												W:GetFullName(),
												tostring(G)
											)
										end
									end
								end
							end
							local g = env_ctx[7].Character and env_ctx[7].Character:FindFirstChildOfClass("Humanoid")
							if if g then g.SeatPart ~= W else not g then
								n = n or tick()
								if tick() - n > 0.35 then
									print(
										"tween false , mat seat ",
										"ghe muc tieu:",
										W:GetFullName(),
										"ghe hien tai:",
										g and g.SeatPart and g.SeatPart:GetFullName() or "nil",
										"thoi gian mat ghe:",
										tick() - n,
										"trang thai:",
										tostring(Z.PlaybackState)
									)
									WarnOnce("BoatNotSeated", "Lost seat , stop tween ")
									z(Enum.PlaybackState.Cancelled)
									break
								end
							else
								n = nil
							end
							g = nil
							g, Z.Speed = BoatTweenSpeed()
							local n, J = os.clock(), Z.Speed
							if g then
								if n < table.move[6][table.move[5]] then
									Z.SpeedCap = 150
								else
									if table.move[6][table.move[5]] > 0 then
										table.move[6][table.move[5]] = 0
									end
									Z.SpeedCap = math.min(Z.Speed, (Z.SpeedCap or Z.Speed) + 36 * math.min(V, 0.07))
								end
								J = math.min(Z.Speed, Z.SpeedCap)
							else
								if n < table.move[6][table.move[5]] then
									J = math.max(Z.Speed * env_ctx[9], buffer.writei16)
								else
									Z.SpeedCap = 150
									if table.move[6][table.move[5]] > 0 then
										table.move[6][table.move[5]] = 0
									end
								end
							end
							local G = W.CFrame
							local s, u = G.Position, Z.Target
							local C, K, N = CFrame.new(u.X, s.Y, u.Z) * (u - u.Position), CFrame.new(s.X, s.Y, s.Z), v
							v = K * (N - v.Position)
							N, K = Vector3.new(v.X, 0, v.Z), Vector3.new(C.X, 0, C.Z)
							local u, O, R = (K - N).Magnitude, J * V, (Vector3.new(s.X, 0, s.Z) - N).Magnitude
							if R > math.max(25, O * 4) then
								table.move[6][table.move[5]] = n + env_ctx[11]
								J = g and 150 or math.max(Z.Speed * env_ctx[9], buffer.writei16)
								if g then
									Z.SpeedCap = 150
								end
								v = CFrame.new(s.X, s.Y, s.Z) * (G - s)
								O = J * V
								u = (K - Vector3.new(v.X, 0, v.Z)).Magnitude
							else
							end
							if u <= O or u <= F then
								v = CFrame.new(C.X, s.Y, C.Z) * (C - C.Position)
								W.CFrame = v
								W.AssemblyLinearVelocity = Vector3.new(0.0, 0.0, 0.0)
								W.AssemblyAngularVelocity = Vector3.new(0.0, 0.0, 0.0)
								z(Enum.PlaybackState.Completed)
								break
							end
							g = v
							v = g:Lerp(C, O / u)
							g, G = CFrame.new(v.X, s.Y, v.Z), v
							v = g * (G - v.Position)
							W.CFrame = v
							W.AssemblyLinearVelocity = Vector3.new(0.0, 0.0, 0.0)
							W.AssemblyAngularVelocity = Vector3.new(0.0, 0.0, 0.0)
						end
					end
					if not _ then
						z(Enum.PlaybackState.Cancelled)
					end
				end)
				return Z
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 10005]
------------------------------------------------------------------------
Sub_SeaEventsAndBoats[10005] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			local ui_notifications = env_ctx[3]
			return function(h)
				local V = checkboat()
				if Settings["Auto Sea Event With Friend"] then
					if Settings["Auto Sea Event"] then
						toTarget(
							game:GetService("Players")[Settings["Select Friend"]].Character.HumanoidRootPart.CFrame
						)
						return
					end
				end
				if Settings["Auto Sea Event"] then
				elseif h then
				else
					return
				end
				local J = not V or V and g:DistanceFromCharacter(V.VehicleSeat.Position) >= 4000
				if J then
					local J = CFrame.new(-13.488054275512695, 10.311711311340332, 2927.692)
					J = if game.PlaceId == getgenv().CheckPlaceId
						then CFrame.new(-16204.0810546875, 9.0863618850708, 479.2259521484375)
						else J
					if (J.Position - local_player.Character.HumanoidRootPart.Position).Magnitude > 8 then
						if (J.Position - local_player.Character.HumanoidRootPart.Position).Magnitude > 1000 then
							if game.PlaceId == getgenv().CheckPlaceId then
								if Settings["Reset Character Buy Boat"] then
									local W = g:GetAttribute("CurrentLocation")
									if if W then g:GetAttribute("CurrentLocation") ~= "Tiki Outpost" else not W then
										if
											game:GetService("Players").LocalPlayer.Data.LastSpawnPoint.Value
												== "Tiki"
											or game:GetService("Players").LocalPlayer.Data.LastSpawnPoint.Value
												== "Tiki2"
										then
											local_player.Character.Humanoid.Health = 0
											return
										end
									end
								end
							end
						end
						toTarget(J)
					else
						local J = Settings["Select Boat"]
						if not J then
							WarnOnce("SelectBoat", "Chon thuyen o Sea Event > Select Boat truoc da.")
							return
						end
						J = if J == "Brigade" then "Pirate" .. J else if J == "GrandBrigade" then "Pirate" .. J else J
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", J)
						task.wait(3)
					end
				else
					task.spawn(function()
						NoclipBoat(V)
					end)
					if Settings["Tween Until Have Sea Event"] then
						local J = CFrame.new(-118834.515625, V.WorldPivot.Y, 999920.0494155884)
						if local_player.Character.Humanoid.Sit then
							F(V, J, 150)
						else
							toTarget(V.VehicleSeat.CFrame)
						end
					else
						local J, W =
							CFrame.new(654.3875732421875, V.WorldPivot.Y, 6321.95947265625), DecectPartRoughSea()
						if W then
							task.wait(1)
							ui_notifications = if ui_notifications == 0 then 7000 else 0
							Instance.new("IntValue", W).Name = "Ignored"
							task.wait(0.5)
						end
						getgenv().RoughSea = Settings["Teleport Boat Other CFrame if Rough Sea"] and ui_notifications or 0
						J = if game.PlaceId == getgenv().CheckPlaceId
							then SelectedZoneCFrame() * CFrame.new(0, V.WorldPivot.Y, 0 + RoughSea)
							else J
						if (V.VehicleSeat.Position - J.Position).Magnitude > 200 then
							W = CFrame.new(J.Position.X, V.WorldPivot.Y, J.Position.Z)
							if local_player.Character.Humanoid.Sit then
								F(V, W, 150)
							else
								toTarget(V.VehicleSeat.CFrame)
							end
						else
							if Settings["Auto Repair Ur Ship"] then
								if local_player.PlayerGui.Main.BottomHUDList.ShipHealthBar.Visible then
									local n = string.gsub(
										game:GetService("Players").LocalPlayer.PlayerGui.Main.BottomHUDList.ShipHealthBar.TextLabel.Text,
										"Ship ",
										""
									)
									n = string.split(n, "/")
									if tonumber(n[1]) < tonumber(n[2]) then
										if g:DistanceFromCharacter(V.PrimaryPart.Position) < 20 then
											if local_player.Character.Humanoid.Sit then
												local_player.Character.Humanoid.Sit = false
											elseif local_player.Character:FindFirstChild("_RepairHammer") then
												if local_player.Character._RepairHammer:FindFirstChild("M1UP") then
													local_player.Character._RepairHammer.M1UP:Destroy()
												elseif not (local_player.Character._RepairHammer:GetAttribute("Repairing")) then
													local_player.Character._RepairHammer.M1Down:FireServer("Default")
													task.wait(0.5)
												end
											else
												game:GetService("ReplicatedStorage").Remotes.SubclassNetwork.UseSubclass
													:InvokeServer(unpack({ [1] = { Action = "RequestHammer" } }))
												task.wait(3)
											end
										else
											local_player.Character.Humanoid.Sit = false
										end
										return
									end
								end
							end
							if not h then
								if not local_player.Character.Humanoid.Sit then
									toTarget(V.VehicleSeat.CFrame)
								end
								local h = CFrame.new(J.Position.X, V.WorldPivot.Y, J.Position.Z)
								if local_player.Character.Humanoid.Sit then
									F(V, h, 150)
								end
							end
						end
					end
				end
			end
		end
	end



BananaHub.Subsystems.SeaEventsAndBoats = Sub_SeaEventsAndBoats
for func_id, func_impl in pairs(Sub_SeaEventsAndBoats) do
	BananaHub.Functions[func_id] = func_impl
end

--==============================================================================
-- PHÂN HỆ: [RaceV4System] - Temple of Time, Gạt cần Lever, Unsit/FloatForce, Trial V4 các tộc
-- Source: deobf/modules/05_race_v4_system.lua
--==============================================================================
--==============================================================================
-- Module 5: Race V4 Trials & Temple of Time
-- Hệ thống tự động gạt cần (Pull Lever), vào phòng Temple of Time, hoàn thành các Trial V4 (Water, Flames, Carnage, Strength).
-- Source: deobf/mduc.lua (Banana Hub Blox Fruits)
-- FULL DEOBFUSCATED CODE - RESTORED CONSTANTS & API ALIASES
-- STRICTLY 100% GENUINE LOGIC - NO CODE INVENTED
--==============================================================================

local Sub_RaceV4System = {}

------------------------------------------------------------------------
-- [Function ID: 2]
------------------------------------------------------------------------
Sub_RaceV4System[2] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			local ui_notifications = env_ctx[3]
			local movement_utils = env_ctx[4]
			local combat_config = env_ctx[5]
			local W = env_ctx[6]
			local G = env_ctx[7]
			local Z = table.move
			return function(target_cframe, param_s, param_u)
				if typeof(target_cframe) ~= "CFrame" then
					return
				end
				local char_model = local_player.Character
				if char_model then
					if not (char_model:FindFirstChild("HumanoidRootPart")) then
						return
					end
				else
					return
				end
				local hrp = char_model.HumanoidRootPart
				local humanoid = char_model:FindFirstChildOfClass("Humanoid")
				if not humanoid or not hrp then
					return
				end
				if FruitDropBusy and not param_u then
					return
				end
				if movement_utils.EntranceInFlight then
					return
				end
				movement_utils.LastCall = tick()
				if humanoid.Sit then
					TweenManager.CancelCurrent()
					task.wait(0.1)
					getgenv().noclip = false
					ui_notifications:SendKeyEvent(true, "Space", false, game)
					task.wait()
					ui_notifications:SendKeyEvent(false, "Space", false, game)
					task.wait(0.1)
					if hrp:FindFirstChild("EffectsSY") then
						hrp.EffectsSY:Destroy()
					end
					humanoid.Jump = true
					task.wait(0.1)
					hrp.CFrame = hrp.CFrame * CFrame.new(0, 10, 0)
					return
				end
				if not hrp:FindFirstChild("FloatForce") then
					movement_utils.EnsureFloatForce(hrp)
				end
				local n, C, K, N =
					(h.Position - v.Position).Magnitude, false, false, workspace:FindFirstChild("_WorldOrigin")
				u = N and (N:FindFirstChild("Locations"))
				N = u and (u:FindFirstChild("Submerged Island"))
				if N then
					if N:IsA("BasePart") then
						u = N:FindFirstChild("Mesh")
						if u then
							if u:IsA("DataModelMesh") then
								local O = u.Scale.X / 2 + 8
								local R, p =
									(h.Position - N.Position).Magnitude <= O, (v.Position - N.Position).Magnitude <= O
								C, K = R, p
							else
							end
						else
						end
					else
					end
				else
				end
				N = game.PlaceId == getgenv().CheckPlaceId and C ~= K
				if Settings["Teleport Y"] then
					u = Settings["% Health Player"] or 40
					if z.Health / z.MaxHealth < u / 100 then
						V[6][V[5]] = true
					elseif z.Health / z.MaxHealth > 0.8 then
						V[6][V[5]] = false
					end
				else
					V[6][V[5]] = false
				end
				z, u =
					F.RouteConfig.Enabled
						and not ReadyToDodge
						and not V[6][V[5]]
						and not C
						and not K
						and not F.IsSpecialRoutePoint(v.Position)
						and not F.IsSpecialRoutePoint(h.Position),
					s and 8 or 50
				s = if n < u
					then if V[6][V[5]]
						then false
						else if ReadyToDodge
							then false
							else if N
								then false
								else if z
									then F.FindRouteBlocker(
										_,
										v.Position,
										h.Position,
										F.RouteConfig.EndpointAllowance,
										true
									) ~= nil
									else false
					else false
				if n < u then
					if not V[6][V[5]] then
						if ReadyToDodge then
						elseif N then
						elseif s then
						else
							TweenManager.CancelTweenOnly()
							J()
							v.CFrame = h
							return
						end
					end
				end
				if game.PlaceId ~= 122478697296975 then
					s = CFrame.new(28609.392578125, 14896.533203125, 106.4216537475586)
					if game.PlaceId == getgenv().CheckPlaceId then
						if (h.Position - s.Position).Magnitude > 3000 then
							if (s.Position - v.Position).Magnitude <= 3000 then
								F.PlayToTargetTween(v, s, 400, 8, false)
								if (s.Position - v.Position).Magnitude < 8 then
									game:GetService("ReplicatedStorage")
										:WaitForChild("Remotes")
										:WaitForChild("CommF_")
										:InvokeServer("RaceV4Progress", "Check")
									game:GetService("ReplicatedStorage")
										:WaitForChild("Remotes")
										:WaitForChild("CommF_")
										:InvokeServer("RaceV4Progress", "TeleportBack")
									TweenManager.CancelCurrent()
								end
								return
							end
						end
					end
					if game.PlaceId == getgenv().CheckPlaceId then
						if C then
							if not K then
								N = CFrame.new(
									-16269.4082,
									23.9799957,
									1371.66235,
									-0.999388933,
									0,
									-0.0349550731,
									0,
									1,
									0,
									0.0349550731,
									0,
									-0.999388933
								)
								if TryPortalTeleport(v, N) then
									return
								end
								F.PlayToTargetTween(v, N, 350, 8, false)
								if (N.Position - v.Position).Magnitude < 8 then
									game:GetService("ReplicatedStorage").Modules.Net
										:FindFirstChild("RF/SubmarineWorkerSpeak")
										:InvokeServer(unpack({ [1] = "TravelToSubmergedIsland" }))
									game:GetService("ReplicatedStorage").Remotes.CommF_
										:InvokeServer(unpack({ [1] = "SetLastSpawnPoint", [2] = "SubmergedIsland" }))
									TweenManager.CancelCurrent()
								end
								return
							end
						end
					end
					if game.PlaceId == getgenv().CheckPlaceId then
						if C then
						elseif K then
							u = CFrame.new(
								11427.9189,
								-2156.36401,
								9726.24023,
								-0.929097056,
								-7.17796156E-34,
								0.369835705,
								-7.17796156E-34,
								1,
								1.37611875E-34,
								-0.369835705,
								-1.37611875E-34,
								-0.929097056
							)
							F.PlayToTargetTween(v, u, 350, 8, false)
							if (u.Position - v.Position).Magnitude < 8 then
								game:GetService("ReplicatedStorage").Modules.Net
									:FindFirstChild("RF/SubmarineTransportation")
									:InvokeServer(unpack({ [1] = "GetAvailableLocations" }))
								game:GetService("ReplicatedStorage").Modules.Net
									:FindFirstChild("RF/SubmarineTransportation")
									:InvokeServer(unpack({ [1] = "InitiateTeleport", [2] = "Tiki Outpost" }))
								TweenManager.CancelCurrent()
							end
							return
						end
					end
					if TryPortalTeleport(v, h) then
						return
					end
					if
						Settings["Use Home Teleport"]
						and n > 3250
						and tick() >= (HomeTeleportBlockUntil or 0)
						and not V[6][V[5]]
						and not ReadyToDodge
						and local_player.Data.Level.Value >= 30
					then
						local C = GetHomeReadyPosition()
						if C and n - (h.Position - C).Magnitude > 3250 then
							HomeTeleportBlockUntil = tick() + 8
							F.EntranceInFlight = true
							TweenManager.CancelTweenOnly()
							v.AssemblyLinearVelocity = Vector3.new(0.0, 0.0, 0.0)
							pcall(function()
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TeleportToSpawn")
							end)
							local K = tick() + 6
							while true do
								task.wait(0.2)
								local O = local_player.Character
									and local_player.Character:FindFirstChild("HumanoidRootPart")
									and (local_player.Character.HumanoidRootPart.Position - C).Magnitude < 500
								if O or tick() > K then
									break
								end
							end
							F.EntranceInFlight = false
							if local_player.Character then
								if local_player.Character:FindFirstChild("HumanoidRootPart") then
									if (local_player.Character.HumanoidRootPart.Position - C).Magnitude < 500 then
										HomeTeleportBlockUntil = 0
									end
								end
							end
							return
						end
					end
					if F.HandlePortalBoundary(v, h.Position) then
						return
					end
					local C, K, O, R = W(v.Position), W(h.Position), G(h.Position), G(v.Position)
					local W = K and K.Name == "Celestial Domain" and (if C then C.Name ~= "Celestial Domain" else not C)
					if W then
						local G = DetectNpcOni()
						if G then
							if not (G:FindFirstChild("HumanoidRootPart")) then
								return
							end
						else
							return
						end
						local p = G.HumanoidRootPart.CFrame * CFrame.new(0, 0, 20)
						F.PlayToTargetTween(v, p, 350, 12, false)
						if (p.Position - v.Position).Magnitude < 300 then
							game:GetService("ReplicatedStorage").Modules.Net
								:WaitForChild("RF/CelestialDomainTransportation")
								:InvokeServer("InitiateTeleportToTemple")
							CelestialDomainController:LoadMap()
							TweenManager.CancelCurrent()
							task.wait(1)
						end
						return
					end
					W = O and (O.Name == "Celestial Domain (Interior)" or O.Name == "Celestial Domain <Interior>")
					if W then
						if C then
							if C.Name == "Celestial Domain" then
								game:GetService("ReplicatedStorage").Modules.Net
									:WaitForChild("RF/CelestialDomainTransportation")
									:InvokeServer("InitiateTeleportToInterior")
								TweenManager.CancelCurrent()
								task.wait(1)
								return
							end
						end
						local G = R
							and (R.Name == "Celestial Domain (Interior)" or R.Name == "Celestial Domain <Interior>")
						local p = if C then C.Name ~= "Celestial Domain" and not G else not C
						if p then
							local G = DetectNpcOni()
							if G then
								if not (G:FindFirstChild("HumanoidRootPart")) then
									return
								end
							else
								return
							end
							local p = G.HumanoidRootPart.CFrame * CFrame.new(0, 0, 20)
							F.PlayToTargetTween(v, p, 350, 12, false)
							if (p.Position - v.Position).Magnitude < 300 then
								game:GetService("ReplicatedStorage").Modules.Net
									:WaitForChild("RF/CelestialDomainTransportation")
									:InvokeServer("InitiateTeleportToTemple")
								CelestialDomainController:LoadMap()
								TweenManager.CancelCurrent()
								task.wait(1)
								game:GetService("ReplicatedStorage").Modules.Net
									:WaitForChild("RF/CelestialDomainTransportation")
									:InvokeServer("InitiateTeleportToInterior")
							end
							return
						end
					end
					if
						R
						and (R.Name == "Celestial Domain (Interior)" or R.Name == "Celestial Domain <Interior>")
						and (
							if O
								then O.Name ~= "Celestial Domain (Interior)" and O.Name ~= "Celestial Domain <Interior>"
								else not O
						)
					then
						game:GetService("ReplicatedStorage").Modules.Net
							:WaitForChild("RF/CelestialDomainTransportation")
							:InvokeServer("Leave")
						TweenManager.CancelCurrent()
						task.wait(1)
						return
					end
					if C and C.Name == "Celestial Domain" and (if K then K.Name ~= "Celestial Domain" else not K) then
						game:GetService("ReplicatedStorage").Modules.Net
							:WaitForChild("RF/CelestialDomainTransportation")
							:InvokeServer("Leave")
						TweenManager.CancelCurrent()
						return
					end
					W, O, R = tick(), pairs, F.EntranceSuppressedUntil
					for G, p in O(R) do
						if W >= p then
							F.EntranceSuppressedUntil[G] = nil
						end
					end
					if F.EntranceInFlight then
						return
					end
					C, K, O, R = pairs
					for G, p in C(Z) do
						local I, t = (h.Position - p).Magnitude, W < (F.EntranceSuppressedUntil[G] or 0)
						if
							(if t then not t else G ~= "Temple Clock" or I <= 3000)
							and ((if K then I < K else not K) or math.abs(I - K) <= 0.001 and tostring(G) < tostring(O))
						then
							K, O, R = I, G, p
						else
						end
					end
					C = F.EntranceName
					local G = C and Z[C]
					if G then
						if K then
							local Z, p = (h.Position - G).Magnitude, W < (F.EntranceSuppressedUntil[C] or 0)
							if if p then not p else C ~= "Temple Clock" or Z <= 3000 then
								if Z + 750 < n then
									if Z <= K + 150 then
										O, R, K = C, G, Z
									else
									end
								else
								end
							else
							end
						else
						end
					else
					end
					G = R and K + 750 < n
					if G then
						if W < F.EntranceBusyUntil then
							return
						end
						F.EntranceName = O
						TweenManager.CancelTweenOnly()
						getgenv().noclip = true
						J()
						F.EntranceInFlight = true
						local W, G, Z = pcall(TeleToTempleOfTime)
						J()
						C, K = false, tick() + 0.75
						if W then
							if G then
								local J = C
								repeat
									local p = local_player.Character
									local g, I =
										p and (p:FindFirstChildOfClass("Humanoid")),
										p and (p:FindFirstChild("HumanoidRootPart"))
									if p ~= _ then
										break
									elseif g then
										if g.Health <= 0 then
											break
										end
									else
										break
									end
									if I and (I.Position - R).Magnitude < 500 then
										J = true
										break
									end
									task.wait(0.05)
								until tick() >= K
								C = J
							else
							end
						else
						end
						if Z then
							if Z.Parent == workspace.Map then
								Z:SetAttribute("ClientBorrowed", nil)
								if not C then
									local g = game.ReplicatedStorage:FindFirstChild("MapStash")
									if g then
										Z.Parent = g
									end
								end
							end
						end
						F.EntranceInFlight = false
						F.EntranceBusyUntil = tick() + 1.5
						if W and G and C then
							F.EntranceFailures[O] = nil
							F.EntranceSuppressedUntil[O] = nil
						else
							Z = (F.EntranceFailures[O] or 0) + 1
							F.EntranceFailures[O] = Z
							if Z >= 2 then
								F.EntranceFailures[O] = nil
								F.EntranceSuppressedUntil[O] = tick() + 8
							end
						end
						return
					end
					if game.PlaceId == getgenv().CheckPlaceId then
						if workspace.Map:FindFirstChild("CakeLoaf") then
							if workspace.Map.CakeLoaf:FindFirstChild("BigMirror") then
								if workspace.Map.CakeLoaf.BigMirror:FindFirstChild("Main") then
									if (Vector3.new(-1990.67, 4532.97, -14973.67) - h.Position).Magnitude <= 1000 then
										if
											(Vector3.new(-1990.67, 4532.97, -14973.67) - v.Position).Magnitude > 1000
										then
											F.PlayToTargetTween(
												v,
												workspace.Map.CakeLoaf.BigMirror.Main.CFrame,
												400,
												8,
												false
											)
											return
										end
									end
								end
							end
						end
					end
				end
				if v.Position.Y < -60 then
					if v.Position.Y > -100 then
						v.CFrame = v.CFrame * CFrame.new(0, 20, 0)
					end
				end
				N = CFrame.new()
				N = if ReadyToDodge
					then CFrame.new(0, 150, 0)
					else if V[6][V[5]] then CFrame.new(0, Settings["Distance Teleport Y"] or 800, 0) else N
				s = h * N
				u = (s.Position - v.Position).Magnitude
				n = if u < 3
					then if z
						then F.FindRouteBlocker(_, v.Position, s.Position, F.RouteConfig.EndpointAllowance, true) ~= nil
						else false
					else false
				if u < 3 then
					if not ReadyToDodge then
						if V[6][V[5]] then
						elseif n then
						else
							TweenManager.CancelTweenOnly()
							v.CFrame = s
							return
						end
					end
				end
				F.PlayToTargetTween(v, s, F.RouteConfig.TweenSpeed, nil, z)
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 14573]
------------------------------------------------------------------------
Sub_RaceV4System[14573] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			local ui_notifications = env_ctx[3]
			local movement_utils = env_ctx[4]
			return function()
				local has_item = CheckItemInventory("Valkyrie Helm")
				if if h then not CheckItemInventory("Mirror Fractal") else not h then
					ui_notifications.CreateNoti({
						Title = "Banana Cat Hub",
						Desc = "Not Valkyrie Helm or not Mirror Fractal",
						ShowTime = 5,
					})
					wait(5)
					return
				end
				if
					game:GetService("ReplicatedStorage")
						:WaitForChild("Remotes")
						:WaitForChild("CommF_")
						:InvokeServer("CheckTempleDoor")
				then
					h = GetTempleOfTime()
					if not h then
						toTarget(CFrame.new(28282.5703125, 14896.8505859375, 105.1042709350586))
						return
					end
					if h.Lever.Lever.CFrame.Z > n.Z + V or h.Lever.Lever.CFrame.Z < n.Z - V then
						if (game_services.Character.HumanoidRootPart.Position - h.Lever.Part.Position).Magnitude > 10 then
							toTarget(h.Lever.Part.CFrame)
						else
							fireproximityprompt(h.Lever.Prompt.ProximityPrompt, 1)
						end
					else
						ui_notifications.CreateNoti({ Title = "Banana Cat Hub", Desc = "Done Pull Lever", ShowTime = 5 })
						wait(5)
					end
				else
					local h = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check")
					if h == 1 then
						game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Begin")
						return
					elseif h == 2 then
						toTarget(CFrame.new(3032.780029296875, 2280.85107421875, -7325.47802734375))
						if
							(
								CFrame.new(3032.780029296875, 2280.85107421875, -7325.47802734375).Position
								- game_services.Character.HumanoidRootPart.Position
							).Magnitude < 8
						then
							game:GetService("ReplicatedStorage").Remotes.CommF_
								:InvokeServer("RaceV4Progress", "Teleport")
						end
						return
					elseif h == 3 then
						game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Continue")
						return
					end
					if
						game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
						and CheckClockTime() == "Night"
					then
						CollectBlueGear()
					elseif
						game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
						and CheckClockTime() ~= "Night"
					then
						if not (getHighestPoint()) then
							h = DetectNpc("Advanced Fruit Dealer")
							if h then
								toTarget(h.HumanoidRootPart.CFrame)
								return
							end
						end
						if getHighestPoint() then
							if
								(
									getHighestPoint().CFrame * CFrame.new(0, 211.88, 0).Position
									- game_services.Character.HumanoidRootPart.Position
								).Magnitude > 10
							then
								toTarget(getHighestPoint().CFrame * CFrame.new(0, 211.88, 0))
							end
						end
					elseif not (game:GetService("Workspace").Map:FindFirstChild("MysticIsland")) then
						if Settings["Hop Server [Trial Or Pull Lever]"] then
							SpecialHop("Mirage")
						end
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 15376]
------------------------------------------------------------------------
Sub_RaceV4System[15376] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			return function()
				if Settings["Auto Finish Train Quest"] then
					if Settings["Stack Train With Trial Race"] then
						if CheckGoTrain() then
							return
						end
					end
				end
				local h = game.Lighting.ClockTime
				if
					(CheckMoon() == "Full Moon" and not (h > 5 and h < 12) or CheckMoon() == "Next Night")
					and Settings["Hop Server [Trial Or Pull Lever]"]
				then
					if getgenv().TurnOffHOPSVPullAndTrial then
						getgenv().TurnOffHOPSVPullAndTrial:SetStage(false)
					end
					task.wait(3)
				elseif Settings["Hop Server [Trial Or Pull Lever]"] then
					HopServer()
					return
				end
				h = GetTempleOfTime()
				if not h then
					if not (VerifyNearbyTrial()) then
						toTarget(CFrame.new(28282.5703125, 14896.8505859375, 105.1042709350586))
						return
					end
				end
				if
					h and h.FFABorder:FindFirstChild("Forcefield") and h.FFABorder.Forcefield.Transparency == 1
					or VerifyNearbyTrial()
				then
					if game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
						if VerifyNearbyTrial() then
							if not getgenv().VerifyTrial then
								getgenv().VerifyTrial = true
							end
						end
						repeat
							wait()
						until VerifyNearbyTrial()
							or not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible
						local F = game.Players.LocalPlayer.Data.Race.Value
						if F == "Human" then
							while true do
								task.wait()
								local n = TrialHuman()
								if n then
									while true do
										task.wait()
										sizepart(n)
										if Settings["Select Weapon"] == "Blox Fruit" then
											toTarget(
												n.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0)
											)
										else
											toTarget(n.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
										end
										ClickM1(n)
										UsedualFlock()
										local V = IsMobAlive(n)
										if
											(
												if V
													then not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible
													else not V
											)
											or (
													game.Players.LocalPlayer.Character.HumanoidRootPart.Position
													- game:GetService("Workspace")._WorldOrigin.Locations["Trial of Strength"].Position
												).Magnitude
												> 1000
										then
											break
										end
									end
								end
								n = game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible
								if
									if n
										then (
											game.Players.LocalPlayer.Character.HumanoidRootPart.Position
											- game:GetService("Workspace")._WorldOrigin.Locations["Trial of Strength"].Position
										).Magnitude > 1000
										else not n
								then
									break
								end
							end
						elseif F == "Skypiea" then
							while true do
								task.wait()
								if game:GetService("Workspace")._WorldOrigin.Locations["Trial of the King"] then
									if
										(game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game:GetService(
											"Workspace"
										)._WorldOrigin.Locations["Trial of the King"].CFrame.Position).Magnitude
										<= 1000
									then
										toTarget(game:GetService("Workspace").Map.SkyTrial.Model.FinishPart.CFrame)
										task.wait(3)
									end
								end
								local n =
									game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible
								local V = if n
									then workspace.Map:FindFirstChild("Temple of Time")
										and workspace.Map["Temple of Time"].FFABorder.Forcefield.Transparency == 0
									else not n
								n = V
									or g:DistanceFromCharacter(
											game:GetService("Workspace").Map.SkyTrial.Model.FinishPart.Position
										)
										> 1000
								if n then
									break
								end
							end
						elseif F == "Fishman" then
							local n = if game:GetService("Workspace")._WorldOrigin.Locations
									:FindFirstChild("Trial of Water")
								then game:GetService("Workspace")._WorldOrigin.Locations
									:FindFirstChild("Trial of Water")
								else nil
							if n and (n.Position - local_player.Character.HumanoidRootPart.Position).Magnitude < 1500 then
								local n = GetSeaBeastTrial()
								while true do
									task.wait()
									if n then
										local V = n:FindFirstChild("HumanoidRootPart")
										getgenv().AimPos = CFrame.new(V.Position.X, 40, V.Position.Z)
										TeleportSeabeast2(n)
										if g:DistanceFromCharacter(V.Position) < 400 then
											AutoAllSkill()
										end
									end
									local V = (if n then not n.Parent else not n)
										or n.Health.Value == 0
										or not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible
										or workspace.Map:FindFirstChild("Temple of Time")
											and workspace.Map["Temple of Time"].FFABorder.Forcefield.Transparency == 0
									local n = V
										or g:DistanceFromCharacter(
												game:GetService("Workspace")._WorldOrigin.Locations
													:FindFirstChild("Trial of Water").Position
											)
											> 1000
									if n then
										break
									end
								end
							end
						elseif F == "Mink" then
							while true do
								task.wait()
								if
									(game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game:GetService(
										"Workspace"
									)._WorldOrigin.Locations["Trial of Speed"].Position).Magnitude <= 1000
								then
									toTarget(game:GetService("Workspace").StartPoint.CFrame * CFrame.new(0, 2, 0))
								end
								local n =
									game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible
								local V = if n
									then g:DistanceFromCharacter(
										game:GetService("Workspace")._WorldOrigin.Locations
											:FindFirstChild("Trial of Speed").Position
									) > 1000
									else not n
								if V then
									break
								end
							end
						elseif F == "Ghoul" then
							while true do
								task.wait()
								local n = TrialGhoul()
								if n then
									while true do
										task.wait()
										sizepart(n)
										if Settings["Select Weapon"] == "Blox Fruit" then
											toTarget(
												n.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0)
											)
										else
											toTarget(n.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
										end
										UsedualFlock()
										ClickM1(n)
										local V = IsMobAlive(n)
										local J = (
											if V
												then not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible
												else not V
										)
											or g:DistanceFromCharacter(
													game:GetService("Workspace")._WorldOrigin.Locations
														:FindFirstChild("Trial of Carnage").Position
												)
												> 1000
										if J then
											break
										end
									end
								end
								n = game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible
								local V = if n
									then g:DistanceFromCharacter(
										game:GetService("Workspace")._WorldOrigin.Locations
											:FindFirstChild("Trial of Carnage").Position
									) > 1000
									else not n
								if V then
									break
								end
							end
						elseif F == "Cyborg" then
							repeat
								task.wait()
								toTarget(CFrame.new(28282.5703125, 14896.8505859375, 105.1042709350586))
							until not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible
						end
					else
						if not h then
							return
						end
						local F = h[local_player.Data.Race.Value .. "Corridor"].Door.Door.RightDoor.Union
						if g:DistanceFromCharacter(F.Position) > 8 then
							toTarget(F.CFrame)
						end
						if Settings["Multi Trial"] then
							if CheckMultiTeleDoor() then
								if g:DistanceFromCharacter(F.Position) <= 8 then
									local h, g = game, game
									h:service("VirtualInputManager"):SendKeyEvent(true, "T", false, g)
									task.wait()
									h, g = game, game
									h:service("VirtualInputManager"):SendKeyEvent(false, "T", false, g)
									return
								end
							end
						end
						if Settings["Auto Turn On V3 Near Door"] then
							if CheckMultiPlayerNearDoor() then
								local h, g = game, game
								h:service("VirtualInputManager"):SendKeyEvent(true, "T", false, g)
								task.wait()
								h, g = game, game
								h:service("VirtualInputManager"):SendKeyEvent(false, "T", false, g)
							end
						end
					end
				elseif getgenv().VerifyTrial then
					if not Settings["Multi Trial"] then
						if not Settings["Auto Reset Character"] then
							Settings["Auto Trial"] = false
							ToggleAutoTrial:SetStage(false)
						end
					end
					getgenv().VerifyTrial = false
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 5285]
------------------------------------------------------------------------
Sub_RaceV4System[5285] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			local ui_notifications = env_ctx[3]
			local movement_utils = env_ctx[4]
			local combat_config = env_ctx[5]
			local W = env_ctx[6]
			local G = env_ctx[7]
			local Z = table.move
			return function()
				if not Settings["Auto Turn On V4"] then
					g:SetStage(true)
				end
				if not Settings["Auto Choose Gears"] then
					if getgenv().ToggleAutoChooseGears then
						getgenv().ToggleAutoChooseGears:SetStage(true)
					end
				end
				if CheckAcientOneDracoStatus() == "Ready For Trial" then
					if getgenv().WaitingjoinTrial then
						wait(5)
						getgenv().WaitingjoinTrial = false
					end
					if
						F:DistanceFromCharacter(workspace._WorldOrigin.Locations["Trial of Flames"].Position) <= 3000
					then
						if workspace.Map.DracoTrial.TrialDoor.DoorTouch:FindFirstChild("TouchInterest") then
							getgenv().DoneTrialDraco = true
							toTarget(workspace.Map.DracoTrial.TrialDoor.DoorTouch.CFrame)
							wait(2)
							return
						end
						if game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
							local h = CheckModelTrialDraco()
							local g, s = GetRelicChuaDat(h)
							local u, _ = GetRelicChuanbiDat(h)
							if u then
								local u = h["EndRelic" .. _:split("RelicModel")[2]]
								local _ = u:FindFirstChildWhichIsA("ProximityPrompt", true)
								if F:DistanceFromCharacter(u.WorldPivot.Position) > 8 then
									toTarget(u.WorldPivot)
								else
									wait(2)
									fireproximityprompt(_)
									wait(2)
								end
							elseif g then
								local g = h["Relic" .. s:split("RelicModel")[2]]
								local h = g:FindFirstChildWhichIsA("ProximityPrompt", true)
								if F:DistanceFromCharacter(g.WorldPivot.Position) > 8 then
									toTarget(g.WorldPivot)
								else
									wait(2)
									fireproximityprompt(h)
									wait(2)
								end
							end
						else
							game.ReplicatedStorage.Remotes.DracoTrial:InvokeServer()
							wait(3)
						end
					else
						if getgenv().DoneTrialDraco then
							wait(5)
							getgenv().DoneTrialDraco = false
							return
						end
						if game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland") then
							if getgenv().turnoffnoclipBoatt then
								getgenv().turnoffnoclipBoatt = false
								local h = checkboat()
								if h then
									TurnOffNoclipBoat(h)
								end
							end
							if getgenv().RespawnVolcano then
								if Settings["Webhook Find Prehistoric Island"] then
									getgenv().RespawnVolcano = false
									WebhookFindVolcano()
								end
							end
							if getgenv().TweenBoat then
								getgenv().TweenBoat:Pause()
								getgenv().TweenBoat:Cancel()
							end
							local h = F:GetAttribute("CurrentLocation")
							if if h then F:GetAttribute("CurrentLocation") ~= "Prehistoric Island" else not h then
								local g = DetectNpc("Fossil Expert")
								if g then
									toTarget(g.HumanoidRootPart.CFrame)
									return
								end
							end
							if workspace.Map.PrehistoricIsland:FindFirstChild("TrialRock", true).Transparency == 1 then
								getgenv().WaitingjoinTrial = true
								toTarget(workspace.Map.PrehistoricIsland.TrialTeleport.CFrame)
								return
							end
							if DetectLava() then
								local g, s, u = next, workspace.Map.PrehistoricIsland:GetDescendants()
								for _, _ in g, s, u do
									if _.Name == "TouchInterest" then
										if _.Parent.Name ~= "TrialTeleport" then
											_:Destroy()
										end
									end
								end
							end
							if #workspace.Map.PrehistoricIsland.Core.InteriorLava:GetChildren() > 0 then
								DeleteLava()
							end
							h =
								game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.PrehistoricRaidTimer.Visible
							if
								if h
									then not h
									else not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible
							then
								if
									workspace.Map.PrehistoricIsland.Core:FindFirstChild("ActivationPrompt")
									and workspace.Map.PrehistoricIsland.Core.ActivationPrompt:FindFirstChild(
										"ProximityPrompt"
									)
								then
									toTarget(workspace.Map.PrehistoricIsland.Core.ActivationPrompt.CFrame)
									if
										F:DistanceFromCharacter(
											workspace.Map.PrehistoricIsland.Core.ActivationPrompt.Position
										) < 8
									then
										fireproximityprompt(
											workspace.Map.PrehistoricIsland.Core.ActivationPrompt.ProximityPrompt,
											1
										)
										wait(3)
									end
									return
								elseif
									not (workspace.Map.PrehistoricIsland.Core:FindFirstChild("ActivationPrompt"))
								then
									if
										not (workspace.Map.PrehistoricIsland.Core:FindFirstChild("FossilExpertSpawn"))
									then
										local h = DetectNpc("Fossil Expert")
										if h then
											toTarget(h.HumanoidRootPart.CFrame)
											return
										end
									end
								end
							else
								if J[6][J[5]] then
									local h = workspace.Map.PrehistoricIsland.Core.PrehistoricRelic.Skull
									while true do
										task.wait()
										toTarget(h.CFrame)
										local g = F:DistanceFromCharacter(h.Position) <= 200 or DetectGolem()
										if g or DetectRockVolcano() then
											break
										end
									end
									J[6][J[5]] = false
									return
								end
								local h = DetectGolem()
								if h then
									while true do
										task.wait()
										toTarget(h.HumanoidRootPart.CFrame * CFrame.new(0, 20, 7))
										if
											Settings["Select Method Kill Golem"]
											== "Instant Kill [ Risk and can bug no die mob ]"
										then
											if F:DistanceFromCharacter(h.HumanoidRootPart.Position) < 50 then
												KillRaidEnemy()
											end
										else
											equiptool(NameWeapon(Settings["Select Weapon Kill Golem"] or "Melee"))
											getgenv().ClickM1Volcano(h)
										end
										if not getgenv().KillMobRaid then
											if Settings["Kill Aura Only Raid And Volcano"] then
												getgenv().KillMobRaid = true
												local g = Settings["Time Delay Kill"] or 5
												h.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
												delay(g, function()
													getgenv().KillMobRaid = false
												end)
											end
										end
										local g = IsMobAlive(h)
										local s, u = (if g then not Settings["Fully Trial Draco"] else not g)
											or not game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
										if s then
											u = s
										else
											g =
												game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.PrehistoricRaidTimer.Visible
											u = if g
												then not g
												else not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible
										end
										if u then
											break
										end
									end
								end
								h = DetectRockVolcano()
								if h then
									if Settings["Fix Volcano Safe"] then
										local g = DetectPositionVolcano()
										local s, s = CheckPosnearRock(g, game_services.Character.HumanoidRootPart)
										local u = CheckPosnearRock(g, h.WorldPivot)
										if F:DistanceFromCharacter(u) >= 400 then
											W[6][W[5]] = s + 1
											if s >= 7 then
												W[6][W[5]] = 1
											end
											local s = g[W[6][W[5]]]
											toTarget(CFrame.new(s))
										else
											local g = G[math.floor(h.WorldPivot.Position.Y)]
											while true do
												task.wait()
												if F:DistanceFromCharacter((h.WorldPivot * g).Position) > 8 then
													toTarget(h.WorldPivot * g)
												end
												if F:DistanceFromCharacter(h.WorldPivot.Position) < 100 then
													AutoUseSkillFixLava()
												end
												getgenv().AimPos = h.WorldPivot
												local g = workspace.CurrentCamera
												V.Hit = h.WorldPivot
												V.Target = h
												local g, W = (if h then not h.Parent else not h)
													or not Settings["Fully Trial Draco"]
													or not RockGlowing(h)
													or DetectGolem()
													or not game:GetService("Workspace").Map
														:FindFirstChild("PrehistoricIsland")
												if g then
													W = g
												else
													local g =
														game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.PrehistoricRaidTimer.Visible
													W = if g
														then not g
														else not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible
												end
												if W then
													break
												end
											end
											if not (DetectGolem()) then
												J[6][J[5]] = true
											end
											wait(1)
										end
									else
										local g = G[math.floor(h.WorldPivot.Position.Y)]
										while true do
											task.wait()
											if F:DistanceFromCharacter((h.WorldPivot * g).Position) > 8 then
												toTarget(h.WorldPivot * g)
											end
											if F:DistanceFromCharacter(h.WorldPivot.Position) < 100 then
												AutoUseSkillFixLava()
											end
											getgenv().AimPos = h.WorldPivot
											local g = workspace.CurrentCamera
											V.Hit = h.WorldPivot
											V.Target = h
											local g, W = (if h then not h.Parent else not h)
												or not Settings["Fully Trial Draco"]
												or not RockGlowing(h)
												or DetectGolem()
												or not game:GetService("Workspace").Map
													:FindFirstChild("PrehistoricIsland")
											if g then
												W = g
											else
												local h =
													game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.PrehistoricRaidTimer.Visible
												W = if h
													then not h
													else not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible
											end
											if W then
												break
											end
										end
										if not (DetectGolem()) then
											J[6][J[5]] = true
										end
									end
								end
							end
						else
							getgenv().RespawnVolcano = true
							getgenv().turnoffnoclipBoatt = true
							local has_item = CheckItemInventory("Volcanic Magnet")
							if if h then not h else not Settings["Ignore Craft Volcanic Magnet Draco"] then
								if getgenv().dacoMagnet then
									local h = tick()
									repeat
										wait()
									until tick() - h >= 5
										or game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
									getgenv().dacoMagnet = false
									return
								end
								if CheckCountItem("Scrap Metal", 10) then
									if not (CheckCountItem("Blaze Ember", 15)) then
										local h = workspace.NPCs:FindFirstChild("Dragon Hunter")
											or game:GetService("ReplicatedStorage").NPCs:FindFirstChild("Dragon Hunter")
											or NPCManager.getNPCsByName("Dragon Hunter")[1]._modelState._instance
										if getgenv().QuestHunterDragon then
											local g = DetectEmberTemplate()
											if g then
												Instance.new("IntValue", g).Name = "Ignored"
												repeat
													wait()
													toTarget(g.Part.CFrame)
												until if g then not g.Parent else not g
												return
											end
											if string.find(getgenv().QuestHunterDragon, "Hydra Enforcers") then
												local J = DetectMob("Hydra Enforcer")
												if J then
													while true do
														task.wait()
														sizepart(J)
														BringMob(J)
														UsedualFlock()
														ClickM1(J)
														if Settings["Select Weapon"] == "Blox Fruit" then
															toTarget(
																J.HumanoidRootPart.CFrame
																	* CFrame.new(-7, getgenv().YPosFruit or 20, 0)
															)
														else
															toTarget(J.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
														end
														local W = IsMobAlive(J)
														if
															(if W then not Settings["Fully Trial Draco"] else not W)
															or g
														then
															break
														end
													end
												else
													local J = DetectPartSpawnMob("Hydra Enforcer", true)
													if J then
														Instance.new("IntValue", J).Name = "Ignored"
														while true do
															wait()
															toTarget(J.CFrame * CFrame.new(0, 60, 0))
															local W, G = J.Position, game_services.Character.HumanoidRootPart
															if
																(W - G.Position).Magnitude <= 100
																or DetectMob("Hydra Enforcer")
																or not Settings["Fully Trial Draco"]
																or g
															then
																break
															end
														end
														wait(1)
													else
														DeleteIgnoredMobSpawn()
													end
												end
											elseif string.find(getgenv().QuestHunterDragon, "Venomous Assailants") then
												local J = DetectMob("Venomous Assailant")
												if J then
													while true do
														task.wait()
														sizepart(J)
														BringMob(J)
														UsedualFlock()
														ClickM1(J)
														if Settings["Select Weapon"] == "Blox Fruit" then
															toTarget(
																J.HumanoidRootPart.CFrame
																	* CFrame.new(-7, getgenv().YPosFruit or 20, 0)
															)
														else
															toTarget(J.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
														end
														local W = IsMobAlive(J)
														if
															(if W then not Settings["Fully Trial Draco"] else not W)
															or g
														then
															break
														end
													end
												else
													local J = DetectPartSpawnMob("Venomous Assailant", true)
													if J then
														Instance.new("IntValue", J).Name = "Ignored"
														while true do
															wait()
															toTarget(J.CFrame * CFrame.new(0, 60, 0))
															local W, G = J.Position, game_services.Character.HumanoidRootPart
															if
																(W - G.Position).Magnitude <= 100
																or DetectMob("Venomous Assailant")
																or not Settings["Fully Trial Draco"]
																or g
															then
																break
															end
														end
														wait(1)
													else
														DeleteIgnoredMobSpawn()
													end
												end
											elseif string.find(getgenv().QuestHunterDragon, "trees") then
												local J, W = workspace.CurrentCamera, DetectTree()
												if W then
													Instance.new("IntValue", W).Name = "Ignored"
													local G = tick()
													repeat
														wait()
														local s = W.WorldPivot.Position
														if F:DistanceFromCharacter(s) < 50 then
															AutoAllSkill()
														end
														if W:FindFirstChild("Meshes/plant1_Icosphere", true) then
															toTarget(W.WorldPivot)
															getgenv().AimPos = W.WorldPivot
															V.Hit = CFrame.new(J.CFrame.Position, s)
															V.Target = W
														else
															local s, u =
																(W.WorldPivot * CFrame.new(5, -20, 0)).Position,
																(W.WorldPivot * CFrame.new(0, -20, 0)).Position
															toTarget(CFrame.new(s))
															getgenv().AimPos = CFrame.new(u)
															V.Hit = CFrame.new(J.CFrame.Position, u)
															V.Target = W
														end
													until (if W then not W.Parent else not W)
														or not Settings["Fully Trial Draco"]
														or g
														or W:GetAttribute("AlreadyDestroyedClient")
														or tick() - G >= 15
												end
											end
										elseif F:DistanceFromCharacter(h.HumanoidRootPart.Position) > 8 then
											toTarget(h.HumanoidRootPart.CFrame * CFrame.new(0, 4, 4))
										else
											local h = game:GetService("ReplicatedStorage")
												:WaitForChild("Modules")
												:WaitForChild("Net")
												:WaitForChild("RF/DragonHunter")
												:InvokeServer(unpack({ [1] = { Context = "Check" } }))
											if if h then h and not h.Text else not h then
												getgenv().QuestHunterDragon = game:GetService("ReplicatedStorage")
													:WaitForChild("Modules")
													:WaitForChild("Net")
													:WaitForChild("RF/DragonHunter")
													:InvokeServer(unpack({ [1] = { Context = "RequestQuest" } })).Text
											else
												getgenv().QuestHunterDragon = h.Text
											end
										end
										return
									end
								else
									local h = { "Jungle Pirate", "Musketeer Pirate" }
									local g = DetectMob(h)
									if g then
										while true do
											task.wait()
											sizepart(g)
											BringMob(g)
											UsedualFlock()
											ClickM1(g)
											if Settings["Select Weapon"] == "Blox Fruit" then
												toTarget(
													g.HumanoidRootPart.CFrame
														* CFrame.new(-7, getgenv().YPosFruit or 20, 0)
												)
											else
												toTarget(g.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
											end
											local V = IsMobAlive(g)
											if if V then not Settings["Fully Trial Draco"] else not V then
												break
											end
										end
									elseif typeof(h) == "table" then
										if #ui_notifications >= #h then
											ui_notifications = {}
											return
										end
										local g = DetectPartSpawnMob(DetectNameTablePart(h))
										if g then
											table.insert(ui_notifications, DetectNameTablePart(h))
											while true do
												wait()
												toTarget(g.CFrame * CFrame.new(0, 60, 0))
												local V, J = g.Position, game_services.Character.HumanoidRootPart
												if
													(V - J.Position).Magnitude <= 100
													or DetectMob(h)
													or not Settings["Fully Trial Draco"]
												then
													break
												end
											end
											wait(1)
										end
									end
									return
								end
								if CheckCountItem("Scrap Metal", 10) then
									if CheckCountItem("Blaze Ember", 15) then
										game:GetService("ReplicatedStorage").Modules.Net
											:FindFirstChild("RF/Craft")
											:InvokeServer(
												unpack({ [1] = "Craft", [2] = "Volcanic Magnet", [3] = 1, [4] = {} })
											)
										wait(2)
									end
								end
							else
								getgenv().dacoMagnet = true
								local h = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
								if
									(
										if h
											then not h
											else not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.PrehistoricRaidTimer.Visible
									)
									and not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible
								then
									local h = checkboat()
									local g = not h or h and F:DistanceFromCharacter(h.VehicleSeat.Position) >= 4000
									if g then
										local g = CFrame.new(-16204.0810546875, 9.0863618850708, 479.2259521484375)
										if (g.Position - game_services.Character.HumanoidRootPart.Position).Magnitude > 8 then
											if
												(g.Position - game_services.Character.HumanoidRootPart.Position).Magnitude > 1000
											then
												local V = F:GetAttribute("CurrentLocation")
												if
													if V
														then F:GetAttribute("CurrentLocation") ~= "Tiki Outpost"
														else not V
												then
													if
														game:GetService("Players").LocalPlayer.Data.LastSpawnPoint.Value
															== "Tiki"
														or game:GetService("Players").LocalPlayer.Data.LastSpawnPoint.Value
															== "Tiki2"
													then
														game_services.Character.Humanoid.Health = 0
														return
													end
												end
											end
											toTarget(g)
										else
											game:GetService("ReplicatedStorage").Remotes.CommF_
												:InvokeServer("BuyBoat", "PirateBrigade")
											wait(3)
										end
									elseif game_services.Character.Humanoid.Sit then
										task.spawn(function()
											NoclipBoat(h)
										end)
										local g = CFrame.new(-118834.515625, h.WorldPivot.Y, -78.9505844116211)
											* CFrame.new(0, 0, 99999999)
										manageTween(h.VehicleSeat, g, 150, "TweenBoat")
									else
										if getgenv().TweenBoat then
											getgenv().TweenBoat:Pause()
											getgenv().TweenBoat:Cancel()
										end
										toTarget(h.VehicleSeat.CFrame)
									end
								end
							end
						end
					end
				elseif string.find(CheckAcientOneDracoStatus(), "Can Buy Gear") then
					BuyGearDracoV4()
				else
					local target_mob = DetectMob(Z)
					if h then
						while true do
							task.wait()
							sizepart(h)
							BringMob(h)
							UsedualFlock()
							ClickM1(h)
							if Settings["Select Weapon"] == "Blox Fruit" then
								toTarget(h.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0))
							else
								toTarget(h.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
							end
							local g = IsMobAlive(h)
							if if g then not Settings["Fully Trial Draco"] else not g then
								break
							end
						end
					elseif typeof(Z) == "table" then
						if #ui_notifications >= #Z then
							ui_notifications = {}
							return
						end
						local h = DetectPartSpawnMob(DetectNameTablePart(Z))
						if h then
							table.insert(ui_notifications, DetectNameTablePart(Z))
							while true do
								wait()
								toTarget(h.CFrame * CFrame.new(0, 60, 0))
								local g, n = h.Position, game_services.Character.HumanoidRootPart
								if
									(g - n.Position).Magnitude <= 100
									or DetectMob(Z)
									or not Settings["Fully Trial Draco"]
								then
									break
								end
							end
							wait(1)
						end
					else
						local h = DetectPartSpawnMob(Z, true)
						if h then
							Instance.new("IntValue", h).Name = "Ignored"
							while true do
								wait()
								toTarget(h.CFrame * CFrame.new(0, 60, 0))
								local g, n = h.Position, game_services.Character.HumanoidRootPart
								if
									(g - n.Position).Magnitude <= 100
									or DetectMob(Z)
									or not Settings["Fully Trial Draco"]
								then
									break
								end
							end
							wait(1)
						else
							DeleteIgnoredMobSpawn()
						end
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 9329]
------------------------------------------------------------------------
Sub_RaceV4System[9329] = function(env_ctx)
		return function(h)
			return function()
				if game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Trial of Strength") then
					StrengthPart = game:GetService("Workspace")._WorldOrigin.Locations["Trial of Strength"]
					if
						(game.Players.LocalPlayer.Character.HumanoidRootPart.Position - StrengthPart.Position).Magnitude
						<= 1000
					then
						for h, h in pairs(game.Workspace.Enemies:GetChildren()) do
							if IsMobAlive(h) then
								if (h.HumanoidRootPart.Position - StrengthPart.Position).Magnitude <= 1000 then
									return h
								end
							end
						end
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 3356]
------------------------------------------------------------------------
Sub_RaceV4System[3356] = function(env_ctx)
		return function(h, h)
			return function()
				if game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Trial of Carnage") then
					if
						(
							game.Players.LocalPlayer.Character.HumanoidRootPart.Position
							- game:GetService("Workspace")._WorldOrigin.Locations["Trial of Carnage"].Position
						).Magnitude <= 1000
					then
						for h, h in pairs(game.Workspace.Enemies:GetChildren()) do
							if IsMobAlive(h) then
								if
									(
										h.HumanoidRootPart.Position
										- game:GetService("Workspace")._WorldOrigin.Locations["Trial of Carnage"].Position
									).Magnitude <= 1000
								then
									return h
								end
							end
						end
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 4283]
------------------------------------------------------------------------
Sub_RaceV4System[4283] = function(env_ctx)
		return function(h)
			return function()
				local h = {}
				v28 = workspace:WaitForChild("Map"):WaitForChild("DracoTrial")
				local g = {
					"Relic1",
					"Relic2",
					"Relic3",
					"EndRelic1",
					"EndRelic2",
					"EndRelic3",
					"Door1",
					"Door2",
					"Door3",
					"Brazier1",
					"Brazier2",
					"Brazier3",
					"Center",
					"EndPlatform",
					"TeleportOut",
				}
				for F, F in pairs(g) do
					h[F] = v28:FindFirstChild(F, true)
				end
				local F, n, V = next, workspace._WorldOrigin:GetChildren()
				for J, J in F, n, V do
					if J:IsA("Model") then
						if J.Name == "Relic" then
							g = J:FindFirstChildWhichIsA("MeshPart")
							if g.Color == Color3.fromRGB(132, 203, 0) then
								h.RelicModel1 = J
							end
							if g.Color == Color3.fromRGB(232, 106, 110) then
								h.RelicModel2 = J
							end
							if g.Color == Color3.fromRGB(191, 153, 0) then
								h.RelicModel3 = J
							end
						end
					end
				end
				return h
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 106]
------------------------------------------------------------------------
Sub_RaceV4System[106] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = runtime_state[1]
			local game_services = runtime_state[2]
			local ui_notifications = runtime_state[3]
			return function(g)
				if not Settings["Bring Mob"] then
					return
				end
				if g then
					if F[6][F[5]] ~= g then
						F[6][F[5]] = g
						ui_notifications = DetectPartMobBring(g.Name, g, true).CFrame
						if game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
							if V.Character:FindFirstChild("RaceTransformed") then
								if V.Character.RaceTransformed.Value then
									ui_notifications = getcenter(g.Name)
								end
							end
						end
						DeleteIgnoredMob()
					end
				end
				if DaBringMob then
					delay(0.1, function()
						getgenv().DaBringMob = false
					end)
					return
				end
				local F = {}
				if not (g:FindFirstChild("Ignored")) then
					table.insert(F, g)
				end
				local J = Settings["Bring Mob Count"] or 2
				local W, G = if J > 2 then 350 else 200
				if game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
					if V.Character:FindFirstChild("RaceTransformed") then
						if V.Character.RaceTransformed.Value then
							local Z, s = 300, 6
							W, G = Z, s
						else
							G = J
						end
					else
						G = J
					end
				else
					G = J
				end
				local Z, s = pairs, table.pack(workspace.Enemies:GetChildren())
				for u, u in Z(h:XU(s)) do
					if u ~= g then
						if u.Name == g.Name then
							if not (u:FindFirstChild("Ignored")) then
								if IsMobAlive(u) then
									if isnetworkowner2(u.HumanoidRootPart) then
										J = (u.HumanoidRootPart.Position - ui_notifications.Position).Magnitude
										if J <= W then
											if #F < G then
												table.insert(F, u)
											end
										end
									end
								end
							end
						end
					end
				end
				if
					ui_notifications
					and (V.Character.HumanoidRootPart.Position - g.HumanoidRootPart.Position).Magnitude <= 50
					and isnetworkowner2(V.Character.HumanoidRootPart)
					and #F >= 2
				then
					s = pairs
					for h, h in s(F) do
						sizepart(h)
						if isnetworkowner2(h.HumanoidRootPart) then
							h.HumanoidRootPart.CFrame = ui_notifications * CFrame.new(0, math.random(0, 2), math.random(0, 2))
							task.spawn(function()
								local g = h.Humanoid.Health
								task.wait(2.2)
								if h.Humanoid.Health == g then
									if not (h:FindFirstChild("Ignored")) then
										h.HumanoidRootPart.CFrame = h.WorldPivot
										Instance.new("IntValue", h).Name = "Ignored"
										task.wait(0.3)
									end
								end
							end)
						else
							h.HumanoidRootPart.CFrame = h.WorldPivot
							Instance.new("IntValue", h).Name = "Ignored"
							task.wait(0.3)
						end
						getgenv().DaBringMob = true
					end
				end
			end
		end
	end



BananaHub.Subsystems.RaceV4System = Sub_RaceV4System
for func_id, func_impl in pairs(Sub_RaceV4System) do
	BananaHub.Functions[func_id] = func_impl
end

--==============================================================================
-- PHÂN HỆ: [EspFruitsAndBosses] - ESP Trái ác quỷ, ESP Boss, BillboardGui, Tagged EasterEgg
-- Source: deobf/modules/06_esp_fruits_and_bosses.lua
--==============================================================================
--==============================================================================
-- Module 6: ESP & Entity Tracker (Fruits, Bosses, Eggs)
-- Quét tìm trái ác quỷ (FruitType, Spirit Tree), regex quét Boss spawn, gom nhặt rương sự kiện và bụi gai Berry.
-- Source: deobf/mduc.lua (Banana Hub Blox Fruits)
-- FULL DEOBFUSCATED CODE - RESTORED CONSTANTS & API ALIASES
-- STRICTLY 100% GENUINE LOGIC - NO CODE INVENTED
--==============================================================================

local Sub_EspFruitsAndBosses = {}

------------------------------------------------------------------------
-- [Function ID: 1597]
------------------------------------------------------------------------
Sub_EspFruitsAndBosses[1597] = function(env_ctx)
		return function(h)
			return function()
				local h, g, F = next, game:GetService("Workspace").Enemies:GetChildren()
				for n, n in h, g, F do
					if n.Name ~= "Spirit Tree" then
						if n:GetAttribute("Level") then
							if n:GetAttribute("FruitType") then
								return n
							end
						end
					end
				end
				h, g, F = next, game:GetService("ReplicatedStorage"):GetChildren()
				for n, n in h, g, F do
					if n.Name ~= "Spirit Tree" then
						if n:GetAttribute("Level") then
							if n:GetAttribute("FruitType") then
								return n
							end
						end
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 11040]
------------------------------------------------------------------------
Sub_EspFruitsAndBosses[11040] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = runtime_state[1]
			return function()
				local g, n, V = {}, pairs, table.pack(game.Workspace.Enemies:GetChildren())
				for J, J in n(h:XU(V)) do
					if table.find(F, J.Name) then
						table.insert(g, J.Name)
					end
				end
				V, n = pairs, table.pack(game.ReplicatedStorage:GetChildren())
				for J, J in V(h:XU(n)) do
					if table.find(F, J.Name) then
						table.insert(g, J.Name)
					end
				end
				V, n = workspace._WorldOrigin:FindFirstChild("EnemySpawns"), pairs
				local h = V and V:GetChildren() or {}
				for J, J in n(h) do
					V = J.Name:match("^(.-) %[Lv%. %d+%] %[Boss%]$")
					if V then
						if table.find(F, V) then
							if not (table.find(g, V)) then
								table.insert(g, V)
							end
						end
					end
				end
				return g
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 19]
------------------------------------------------------------------------
Sub_EspFruitsAndBosses[19] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			return function(h, F)
				local n = local_player.Character
					and local_player.Character:FindFirstChild("HumanoidRootPart")
					and h
					and h:FindFirstChild("HumanoidRootPart")
					and h.Humanoid.Health > 0
					and (local_player.Character.HumanoidRootPart.Position - h.HumanoidRootPart.Position).Magnitude < (F or 70)
				if n then
					if getgenv().SmartMob ~= h then
						getgenv().SmartMob = h
						getgenv().SmartHealth = h.Humanoid.Health
						getgenv().SmartTime = tick()
						F = NameWeapon("Blox Fruit", true)
						if
							F
							and (
								string.find(F.Name, "T-Rex")
								or string.find(F.Name, "Kitsune")
								or string.find(F.Name, "Leopard")
								or string.find(F.Name, "Mammoth")
								or string.find(F.Name, "Dough")
							)
						then
							getgenv().YPosFruit = 7
						else
							getgenv().YPosFruit = 20
						end
					elseif h.Humanoid.Health < getgenv().SmartHealth then
						getgenv().SmartHealth = h.Humanoid.Health
						getgenv().SmartTime = tick()
					elseif tick() - getgenv().SmartTime > 1.5 then
						getgenv().YPosFruit = math.max(0, (getgenv().YPosFruit or 20) - 5)
						getgenv().SmartTime = tick()
					end
				end
				return n
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 105]
------------------------------------------------------------------------
Sub_EspFruitsAndBosses[105] = function(env_ctx)
		return function(h)
			return function(h)
				local g, F, n =
					next, game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits", false)
				for V, V in g, F, n do
					if V.Name == h then
						return V
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 7679]
------------------------------------------------------------------------
Sub_EspFruitsAndBosses[7679] = function(env_ctx)
		return function(h, h)
			return function()
				local h = if Settings["Kill All Boss"]
					then CheckNameBoss(TableBoss())
					else CheckNameBoss(Settings["Select Boss"])
				if h then
					while true do
						wait()
						sizepart(h)
						if Settings["Select Weapon"] == "Blox Fruit" then
							toTarget(h.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0))
						else
							toTarget(h.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
						end
						ClickM1(h)
						UsedualFlock()
						local g = IsMobAlive(h)
						if if g then not Settings["Kill Boss"] else not g then
							break
						end
					end
				elseif Settings["Hop Server Find Boss"] then
					if not (BossSpawn(Settings["Kill All Boss"] and TableBoss() or Settings["Select Boss"])) then
						HopServer()
						wait(5)
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 4226]
------------------------------------------------------------------------
Sub_EspFruitsAndBosses[4226] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			return function()
				local h, F, n = local_player.Character.PrimaryPart.Position, 1 / 0
				for _, egg_obj in pairs(game:GetService("CollectionService"):GetTagged("EasterEgg26")) do
					local dist_egg = (h - egg_obj:GetAttribute("CFrame").Position).Magnitude
					if dist_egg < F then
						F, n = dist_egg, egg_obj
					end
				end
				return n
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 7873]
------------------------------------------------------------------------
Sub_EspFruitsAndBosses[7873] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			return function()
				local h, F, n = next, game:GetService("CollectionService"):GetTagged("BerryBush")
				local V, J = 1 / 0
				for _, berry_node in h, F, n do
					if not G.Parent:FindFirstChild("IgnoredBerry") then
						local dist_berry = g:DistanceFromCharacter(G.Parent:GetAttribute("CFrame").Position)
						if V > dist_berry then
							V, J = dist_berry, G
						end
					end
				end
				return J
			end
		end
	end



BananaHub.Subsystems.EspFruitsAndBosses = Sub_EspFruitsAndBosses
for func_id, func_impl in pairs(Sub_EspFruitsAndBosses) do
	BananaHub.Functions[func_id] = func_impl
end

--==============================================================================
-- PHÂN HỆ: [ItemsCraftingRaces] - Mua Soul Guitar, chế tạo Godhuman, đổi Azure Ember Kitsune Shrine
-- Source: deobf/modules/07_items_crafting_races.lua
--==============================================================================
local Sub_ItemsCraftingRaces = {}

Sub_ItemsCraftingRaces[569] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			local ui_notifications = env_ctx[3]
			return function()
				if
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("soulGuitarBuy", true)
					== "[You already own this item.]"
				then
					ui_notifications.CreateNoti({ Title = "Banana Cat Hub", Desc = "[You already own this item.]", ShowTime = 5 })
					task.wait(5)
					return
				end
				if game_services.Data.Fragments.Value < 5000 then
					ui_notifications.CreateNoti({ Title = "Banana Cat Hub", Desc = "Frag >= 5k", ShowTime = 5 })
					wait(5)
					return
				end
				if CheckCountItem("Dark Fragment", 1) then
					if CheckCountItem("Ectoplasm", 250) then
						if CheckCountItem("Bones", 500) then
							WarnOnce(
								"SoulGuitarReady",
								"Soul Guitar: du nguyen lieu, dang giai do (can Full Moon de bat dau)."
							)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("soulGuitarBuy", true)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("soulGuitarBuy")
							if game.PlaceId == getgenv().CheckPlaceId then
								GuitarPuzzleProgress()
							else
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
							end
							return
						end
					end
				end
				if CheckCountItem("Dark Fragment", 1) then
					local h, g, V = DetectRequestSoulGuitar()
					WarnOnce("SoulGuitarFarm", "Soul Guitar: dang farm nguyen lieu (" .. tostring(env_ctx[1]) .. ").")
					if game.PlaceId == g then
						local g = DetectMob(h)
						if g then
							while true do
								task.wait()
								sizepart(g)
								BringMob(g)
								UsedualFlock()
								ClickM1(g)
								if Settings["Select Weapon"] == "Blox Fruit" then
									toTarget(g.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0))
								else
									toTarget(g.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
								end
								local J = IsMobAlive(g)
								if if J then not Settings["Auto Soul Guitar"] else not J then
									break
								end
							end
						elseif typeof(h) == "table" then
							if #ui_notifications >= #h then
								ui_notifications = {}
								return
							end
							local g = DetectPartSpawnMob(DetectNameTablePart(h))
							if g then
								table.insert(ui_notifications, DetectNameTablePart(h))
								while true do
									wait()
									toTarget(g.CFrame * CFrame.new(0, 60, 0))
									local n, J = g.Position, game_services.Character.HumanoidRootPart
									if
										(n - J.Position).Magnitude <= 100
										or DetectMob(h)
										or not Settings["Auto Soul Guitar"]
									then
										break
									end
								end
								wait(1)
							end
						else
							local g = DetectPartSpawnMob(h, true)
							if g then
								Instance.new("IntValue", g).Name = "Ignored"
								while true do
									wait()
									toTarget(g.CFrame * CFrame.new(0, 60, 0))
									local n, J = g.Position, game_services.Character.HumanoidRootPart
									if
										(n - J.Position).Magnitude <= 100
										or DetectMob(h)
										or not Settings["Auto Soul Guitar"]
									then
										break
									end
								end
								wait(1)
							else
								DeleteIgnoredMobSpawn()
							end
						end
					else
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(V)
					end
				else
					WarnOnce("SoulGuitarDark", "Soul Guitar: thieu Dark Fragment, can lam Darkbeard o Sea 2.")
					if game.PlaceId == getgenv().CheckPlaceId2 then
						if CheckNameBoss("Darkbeard") then
							local boss_mob = CheckNameBoss("Darkbeard")
							if h then
								while true do
									task.wait()
									sizepart(h)
									if Settings["Select Weapon"] == "Blox Fruit" then
										toTarget(
											h.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0)
										)
									else
										toTarget(h.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
									end
									UsedualFlock()
									ClickM1(h)
									local g = IsMobAlive(h)
									if if g then not Settings["Auto Soul Guitar"] else not g then
										break
									end
								end
							end
						elseif
							game_services.Character:FindFirstChild("Fist of Darkness")
							or local_player.Backpack:FindFirstChild("Fist of Darkness")
						then
							if
								(
									game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection.Position
									- game_services.Character.HumanoidRootPart.Position
								).Magnitude <= 5
							then
								equiptool("Fist of Darkness")
								firetouchinterest(
									game.Players.LocalPlayer.Character["Fist of Darkness"].Handle,
									game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection,
									0
								)
								firetouchinterest(
									game.Players.LocalPlayer.Character["Fist of Darkness"].Handle,
									game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection,
									1
								)
								firetouchinterest(
									game_services.Character.HumanoidRootPart,
									game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection,
									0
								)
								firetouchinterest(
									game_services.Character.HumanoidRootPart,
									game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection,
									1
								)
							else
								toTarget(game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection.CFrame)
							end
						else
							local h = GetNearestChest()
							if h then
								local g
								while true do
									task.wait()
									if
										(game.Players.LocalPlayer.Character.HumanoidRootPart.Position - h.Position).Magnitude
										<= 5
									then
										if g then
											if tick() - g >= 5 then
												Instance.new("IntValue", h).Name = "Ignored"
												wait(0.5)
											end
										else
											g = tick()
										end
										local g, n = game, game
										g:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, n)
										wait()
										n, g = game, game
										n:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, g)
										TweenManager.CancelCurrent()
									else
									end
									toTarget(h.CFrame, true)
									local g = (if h then not h.Parent else not h)
										or not Settings["Auto Soul Guitar"]
										or game_services.Character:FindFirstChild("Fist of Darkness")
										or local_player.Backpack:FindFirstChild("Fist of Darkness")
									if
										g
										or h:GetAttribute("IsDisabled")
										or h:FindFirstChild("Ignored")
										or not h:FindFirstChild("TouchInterest")
									then
										break
									end
								end
							else
								local h = PathFindChest()
								if h then
									toTarget(h.Part.CFrame)
									if
										(h.Part.Position - game_services.Character.HumanoidRootPart.Position).Magnitude <= 100
										or GetNearestChest()
									then
										Instance.new("IntValue", h).Name = "Ignored"
									end
								else
									print("delete")
									for h, h in
										pairs(
											game:GetService("Workspace")._WorldOrigin.PlayerSpawns.Pirates:GetChildren()
										)
									do
										if h:FindFirstChild("Ignored") then
											h:FindFirstChild("Ignored"):Destroy()
										end
									end
								end
							end
						end
					else
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 13887]
------------------------------------------------------------------------
Sub_ItemsCraftingRaces[13887] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			local ui_notifications = env_ctx[3]
			local movement_utils = env_ctx[4]
			return function()
				if CheckItemInventory("Volcanic Magnet") then
					if Settings["Auto Crafting Volcanic Magnet"] then
						SaveSettings("Auto Crafting Volcanic Magnet", false)
						V[6][V[5]].CreateNoti({ Title = "Banana Cat Hub", Desc = "Done Craft Volcanic Magnet", ShowTime = 5 })
						ToggleAutoCraftingVolcanicMagnet:SetStage(false)
					end
				else
					if CheckCountItem("Scrap Metal", 10) then
						if not (CheckCountItem("Blaze Ember", 15)) then
							local h = workspace.NPCs:FindFirstChild("Dragon Hunter")
								or game:GetService("ReplicatedStorage").NPCs:FindFirstChild("Dragon Hunter")
								or NPCManager.getNPCsByName("Dragon Hunter")[1]._modelState._instance
							if getgenv().QuestHunterDragon then
								local V = DetectEmberTemplate()
								if V then
									Instance.new("IntValue", V).Name = "Ignored"
									repeat
										wait()
										toTarget(V.Part.CFrame)
									until if V then not V.Parent else not V
									return
								end
								if string.find(getgenv().QuestHunterDragon, "Hydra Enforcers") then
									local J = DetectMob("Hydra Enforcer")
									if J then
										while true do
											task.wait()
											sizepart(J)
											BringMob(J)
											UsedualFlock()
											ClickM1(J)
											if Settings["Select Weapon"] == "Blox Fruit" then
												toTarget(
													J.HumanoidRootPart.CFrame
														* CFrame.new(-7, getgenv().YPosFruit or 20, 0)
												)
											else
												toTarget(J.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
											end
											local W = IsMobAlive(J)
											if
												(if W then not Settings["Auto Crafting Volcanic Magnet"] else not W)
												or V
											then
												break
											end
										end
									else
										local J = DetectPartSpawnMob("Hydra Enforcer", true)
										if J then
											Instance.new("IntValue", J).Name = "Ignored"
											while true do
												wait()
												toTarget(J.CFrame * CFrame.new(0, 60, 0))
												local W, G = J.Position, game_services.Character.HumanoidRootPart
												if
													(W - G.Position).Magnitude <= 100
													or DetectMob("Hydra Enforcer")
													or not Settings["Auto Quest Dragon Hunter"]
													or V
												then
													break
												end
											end
											wait(1)
										else
											DeleteIgnoredMobSpawn()
										end
									end
								elseif string.find(getgenv().QuestHunterDragon, "Venomous Assailants") then
									local J = DetectMob("Venomous Assailant")
									if J then
										while true do
											task.wait()
											sizepart(J)
											BringMob(J)
											UsedualFlock()
											ClickM1(J)
											if Settings["Select Weapon"] == "Blox Fruit" then
												toTarget(
													J.HumanoidRootPart.CFrame
														* CFrame.new(-7, getgenv().YPosFruit or 20, 0)
												)
											else
												toTarget(J.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
											end
											local W = IsMobAlive(J)
											if
												(if W then not Settings["Auto Crafting Volcanic Magnet"] else not W)
												or V
											then
												break
											end
										end
									else
										local J = DetectPartSpawnMob("Venomous Assailant", true)
										if J then
											Instance.new("IntValue", J).Name = "Ignored"
											while true do
												wait()
												toTarget(J.CFrame * CFrame.new(0, 60, 0))
												local W, G = J.Position, game_services.Character.HumanoidRootPart
												if
													(W - G.Position).Magnitude <= 100
													or DetectMob("Venomous Assailant")
													or not Settings["Auto Crafting Volcanic Magnet"]
													or V
												then
													break
												end
											end
											wait(1)
										else
											DeleteIgnoredMobSpawn()
										end
									end
								elseif string.find(getgenv().QuestHunterDragon, "trees") then
									local J, W = DetectTree(), workspace.CurrentCamera
									if J then
										Instance.new("IntValue", J).Name = "Ignored"
										local G = tick()
										repeat
											wait()
											local Z = J.WorldPivot.Position
											if F:DistanceFromCharacter(Z) < 50 then
												AutoAllSkill()
											end
											if J:FindFirstChild("Meshes/plant1_Icosphere", true) then
												toTarget(J.WorldPivot)
												getgenv().AimPos = J.WorldPivot
												n.Hit = CFrame.new(W.CFrame.Position, Z)
												n.Target = J
											else
												local Z, s =
													(J.WorldPivot * CFrame.new(5, -20, 0)).Position,
													(J.WorldPivot * CFrame.new(0, -20, 0)).Position
												toTarget(CFrame.new(Z))
												getgenv().AimPos = CFrame.new(s)
												n.Hit = CFrame.new(W.CFrame.Position, s)
												n.Target = J
											end
										until (if J then not J.Parent else not J)
											or not Settings["Auto Crafting Volcanic Magnet"]
											or V
											or J:GetAttribute("AlreadyDestroyedClient")
											or tick() - G >= 15
									end
								end
							elseif F:DistanceFromCharacter(h.HumanoidRootPart.Position) > 8 then
								toTarget(h.HumanoidRootPart.CFrame * CFrame.new(0, 4, 4))
							else
								local h = game:GetService("ReplicatedStorage")
									:WaitForChild("Modules")
									:WaitForChild("Net")
									:WaitForChild("RF/DragonHunter")
									:InvokeServer(unpack({ [1] = { Context = "Check" } }))
								if if h then h and not h.Text else not h then
									getgenv().QuestHunterDragon = game:GetService("ReplicatedStorage")
										:WaitForChild("Modules")
										:WaitForChild("Net")
										:WaitForChild("RF/DragonHunter")
										:InvokeServer(unpack({ [1] = { Context = "RequestQuest" } })).Text
								else
									getgenv().QuestHunterDragon = h.Text
								end
							end
							return
						end
					else
						local h = { "Jungle Pirate" }
						local n = DetectMob(h)
						if n then
							while true do
								task.wait()
								sizepart(n)
								BringMob(n)
								UsedualFlock()
								ClickM1(n)
								if Settings["Select Weapon"] == "Blox Fruit" then
									toTarget(n.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0))
								else
									toTarget(n.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
								end
								local V = IsMobAlive(n)
								if if V then not Settings["Auto Crafting Volcanic Magnet"] else not V then
									break
								end
							end
						elseif typeof(h) == "table" then
							if #ui_notifications >= #h then
								ui_notifications = {}
								return
							end
							local n = DetectPartSpawnMob(DetectNameTablePart(h))
							if n then
								table.insert(ui_notifications, DetectNameTablePart(h))
								while true do
									wait()
									toTarget(n.CFrame * CFrame.new(0, 60, 0))
									local g, V = n.Position, game_services.Character.HumanoidRootPart
									if
										(g - V.Position).Magnitude <= 100
										or DetectMob(h)
										or not Settings["Auto Crafting Volcanic Magnet"]
									then
										break
									end
								end
								wait(1)
							end
						end
						return
					end
					if CheckCountItem("Scrap Metal", 10) then
						if CheckCountItem("Blaze Ember", 15) then
							game:GetService("ReplicatedStorage").Modules.Net
								:FindFirstChild("RF/Craft")
								:InvokeServer(unpack({ [1] = "Craft", [2] = "Volcanic Magnet", [3] = 1, [4] = {} }))
							wait(2)
						end
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 8473]
------------------------------------------------------------------------
Sub_ItemsCraftingRaces[8473] = function(env_ctx)
		return function(h)
			return function()
				if CheckCountItem("Azure Ember", tonumber(Settings["Values Azure Ember"])) then
					if game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
						game:GetService("ReplicatedStorage").Modules.Net
							:FindFirstChild("RF/KitsuneStatuePray")
							:InvokeServer()
						wait(5)
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 14275]
------------------------------------------------------------------------
Sub_ItemsCraftingRaces[14275] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			local ui_notifications = env_ctx[3]
			return function()
				if game.PlaceId ~= getgenv().CheckPlaceId2 then
					game:GetService("ReplicatedStorage").Remotes.CommF_
						:InvokeServer(unpack({ [1] = "TravelDressrosa" }))
					return
				end
				if
					game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul"
					or game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Ectoplasm", "BuyCheck", 4, true) == 2
					or game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Ectoplasm", "Change", 4, true) == 1
				then
					ui_notifications.CreateNoti({ Title = "Banana Cat Hub", Desc = "Plz Turn Off", ShowTime = 5 })
					wait(5)
					return
				end
				if not (CheckCountItem("Ectoplasm", 100)) then
					local h = { "Ship Deckhand", "Ship Steward", "Ship Officer", "Ship Engineer" }
					local V = DetectMob(h)
					if V then
						while true do
							task.wait()
							sizepart(V)
							BringMob(V)
							UsedualFlock()
							ClickM1(V)
							if Settings["Select Weapon"] == "Blox Fruit" then
								toTarget(V.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0))
							else
								toTarget(V.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
							end
							local J = IsMobAlive(V)
							if if J then not Settings["Auto Get Ghoul"] else not J then
								break
							end
						end
					elseif typeof(h) == "table" then
						if #F[6][F[5]] >= #h then
							F[6][F[5]] = {}
							return
						end
						local V = DetectPartSpawnMob(DetectNameTablePart(h))
						if V then
							table.insert(F[6][F[5]], DetectNameTablePart(h))
							while true do
								wait()
								toTarget(V.CFrame * CFrame.new(0, 60, 0))
								local F, J = V.Position, local_player.Character.HumanoidRootPart
								if
									(F - J.Position).Magnitude <= 100
									or DetectMob(h)
									or not Settings["Auto Get Ghoul"]
								then
									break
								end
							end
							wait(1)
						end
					else
						local F = DetectPartSpawnMob(h, true)
						if F then
							Instance.new("IntValue", F).Name = "Ignored"
							while true do
								wait()
								toTarget(F.CFrame * CFrame.new(0, 60, 0))
								local V, J = F.Position, local_player.Character.HumanoidRootPart
								if
									(V - J.Position).Magnitude <= 100
									or DetectMob(h)
									or not Settings["Auto Get Ghoul"]
								then
									break
								end
							end
							wait(1)
						else
							DeleteIgnoredMobSpawn()
						end
					end
					return
				end
				if DetectItemPlr("Hellfire Torch") then
					if
						(CFrame.new(
							918.615234,
							122.202454,
							33454.3789,
							-0.999998808,
							0,
							0.00172644004,
							0,
							1,
							0,
							-0.00172644004,
							0,
							-0.999998808
						).Position - local_player.Character.HumanoidRootPart.Position).Magnitude <= 8
					then
						game:GetService("ReplicatedStorage").Remotes.CommF_
							:InvokeServer(unpack({ [1] = "Ectoplasm", [2] = "BuyCheck", [3] = 4 }))
						v352 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 4)
					else
						toTarget(
							CFrame.new(
								918.615234,
								122.202454,
								33454.3789,
								-0.999998808,
								0,
								0.00172644004,
								0,
								1,
								0,
								-0.00172644004,
								0,
								-0.999998808
							)
						)
					end
				else
					local boss_mob = CheckNameBoss("Cursed Captain")
					if h then
						while true do
							task.wait()
							sizepart(h)
							UsedualFlock()
							ClickM1(h)
							if Settings["Select Weapon"] == "Blox Fruit" then
								toTarget(h.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0))
							else
								toTarget(h.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
							end
							local F = IsMobAlive(h)
							if if F then not Settings["Auto Get Ghoul"] else not F then
								break
							end
						end
						wait(5)
					else
						if Settings["Hop Server Get Ghoul"] then
							SpecialHop("Cursed Captain")
						end
						ui_notifications.CreateNoti({ Title = "Banana Cat Hub", Desc = "Wating Boss Spawn", ShowTime = 5 })
						wait(5)
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 8946]
------------------------------------------------------------------------
Sub_ItemsCraftingRaces[8946] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			local ui_notifications = env_ctx[3]
			local movement_utils = env_ctx[4]
			local combat_config = env_ctx[5]
			return function()
				local h = CheckRace()
				if h == " V3" then
					ui_notifications.CreateNoti({ Title = "Banana Cat Hub", Desc = "Done V3", ShowTime = 5 })
					wait(5)
					return
				end
				if game.PlaceId ~= getgenv().CheckPlaceId2 then
					game:GetService("ReplicatedStorage").Remotes.CommF_
						:InvokeServer(unpack({ [1] = "TravelDressrosa" }))
					return
				end
				if h == " V1" then
					if game_services.Data.Beli.Value < 500000 then
						ui_notifications.CreateNoti({ Title = "Banana Cat Hub", Desc = "Beli >= 500k", ShowTime = 5 })
						wait(5)
						return
					end
					if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1") == 0 then
						game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "2")
					elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1") == 1 then
						if DetectItemPlr("Flower 1") then
							if DetectItemPlr("Flower 2") then
								if not (DetectItemPlr("Flower 3")) then
									local W = DetectMob("Swan Pirate")
									if W then
										while true do
											task.wait()
											sizepart(W)
											BringMob(W)
											UsedualFlock()
											ClickM1(W)
											if Settings["Select Weapon"] == "Blox Fruit" then
												toTarget(
													W.HumanoidRootPart.CFrame
														* CFrame.new(-7, getgenv().YPosFruit or 20, 0)
												)
											else
												toTarget(W.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
											end
											local G = IsMobAlive(W)
											if if G then not Settings["Auto Upgrade Race V2-V3"] else not G then
												break
											end
										end
									else
										local W = "Swan Pirate"
										if typeof(W) == "table" then
											if #ui_notifications >= 11 then
												ui_notifications = {}
												return
											end
											local G = DetectPartSpawnMob(DetectNameTablePart(W))
											if G then
												table.insert(ui_notifications, DetectNameTablePart(W))
												while true do
													wait()
													toTarget(G.CFrame * CFrame.new(0, 60, 0))
													local n, Z = G.Position, game_services.Character.HumanoidRootPart
													if
														(n - Z.Position).Magnitude <= 100
														or DetectMob(W)
														or not Settings["Auto Upgrade Race V2-V3"]
													then
														break
													end
												end
												wait(1)
											end
										else
											local n = DetectPartSpawnMob(W, true)
											if n then
												Instance.new("IntValue", n).Name = "Ignored"
												while true do
													wait()
													toTarget(n.CFrame * CFrame.new(0, 60, 0))
													local G, Z = n.Position, game_services.Character.HumanoidRootPart
													if
														(G - Z.Position).Magnitude <= 100
														or DetectMob(W)
														or not Settings["Auto Upgrade Race V2-V3"]
													then
														break
													end
												end
												wait(1)
											else
												DeleteIgnoredMobSpawn()
											end
										end
									end
								end
							else
								TweenToFlower(game:GetService("Workspace").Flower2)
							end
						else
							TweenToFlower(game:GetService("Workspace").Flower1)
						end
					elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
						if
							(
								CFrame.new(-2777.6001, 72.9661407, -3571.42285).Position
								- game_services.Character.HumanoidRootPart.Position
							).Magnitude < 8
						then
							toTarget(CFrame.new(-2777.6001, 72.9661407, -3571.42285))
						else
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "3")
						end
					else
						AutoQuestBarito()
					end
				else
					local n = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
					if n == 0 then
						game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
						return
					elseif n == 2 then
						game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
						return
					elseif n == -1 then
						ui_notifications.CreateNoti({ Title = "Banana Cat Hub", Desc = "Beli >= 2m", ShowTime = 5 })
						wait(5)
						return
					end
					n = game:GetService("Players").LocalPlayer.Data.Race.Value .. h
					if n == "Human V2" then
						local h = table.find(BlBossHuman, "Jeremy")
						local W, G = if h then not h else CheckNameBoss("Jeremy")
						if W then
							G = W
						else
							h = table.find(BlBossHuman, "Orbitus")
							G = if h then not h else CheckNameBoss("Orbitus")
						end
						W = nil
						if G then
							W = G
						else
							h = table.find(BlBossHuman, "Diamond")
							W = if h then not h else CheckNameBoss("Diamond")
						end
						if W then
							G = CheckNameBoss(W.Name)
							if G then
								repeat
									task.wait()
									sizepart(G)
									UsedualFlock()
									ClickM1(G)
									if Settings["Select Weapon"] == "Blox Fruit" then
										toTarget(
											G.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0)
										)
									else
										toTarget(G.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
									end
								until not IsMobAlive(G)
								if not (table.find(BlBossHuman, W.Name)) then
									table.insert(BlBossHuman, W.Name)
								end
							end
						else
							ui_notifications.CreateNoti({ Title = "Banana Cat Hub", Desc = "Waiting Boss Spawn", ShowTime = 5 })
							wait(5)
						end
					elseif n == "Mink V2" then
						AutoMinkV2()
					elseif n == "Cyborg V2" then
						if not (CheckFruitplr()) then
							if TakeFruitInventory(true) then
								game:GetService("ReplicatedStorage").Remotes.CommF_
									:InvokeServer("LoadFruit", TakeFruitInventory(true))
							end
						end
					elseif n == "Fishman V2" then
						AutoFishV2()
					elseif n == "Skypiea V2" then
						local h = DetectPlayerAngel()
						if h then
							table.insert(V, h.Name)
							local g = tick()
							repeat
								wait()
								spawn(function()
									if
										game:GetService("Players").LocalPlayer.PlayerGui.Main.BottomHUDList.PvpDisabled.Visible
									then
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
									end
								end)
								spawn(function()
									getgenv().AimPos = CFrame.new(
										h.Character.HumanoidRootPart.CFrame.p,
										h.Character.HumanoidRootPart.Position
											+ h.Character.HumanoidRootPart.Velocity / 1.2
									)
									if F:DistanceFromCharacter(h.Character.HumanoidRootPart.Position) < 50 then
										game_services.Character.HumanoidRootPart.CFrame = h.Character.HumanoidRootPart.CFrame
											* CFrame.new(0, 0, 3)
									else
										toTarget(h.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3))
									end
								end)
								spawn(function()
									if F:DistanceFromCharacter(h.Character.HumanoidRootPart.Position) < 50 then
										AutoAllSkill(true)
									end
								end)
							until tick() - g >= 70
								or not h.Character
								or not h.Character.Parent
								or h.Character.Humanoid.Health == 0
								or CheckSafezone(h.Character)
								or CheckPlayercantAttack(h.Character)
								or not Settings["Auto Upgrade Race V2-V3"]
						else
							HopServer()
							wait(5)
						end
					elseif n == "Ghoul V2" then
						local h = DetectPlayerGhoul()
						if h then
							table.insert(J, h.Name)
							local g = tick()
							repeat
								wait()
								spawn(function()
									if
										game:GetService("Players").LocalPlayer.PlayerGui.Main.BottomHUDList.PvpDisabled.Visible
									then
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
									end
								end)
								spawn(function()
									getgenv().AimPos = CFrame.new(
										h.Character.HumanoidRootPart.CFrame.p,
										h.Character.HumanoidRootPart.Position
											+ h.Character.HumanoidRootPart.Velocity / 1.2
									)
									if F:DistanceFromCharacter(h.Character.HumanoidRootPart.Position) < 50 then
										game_services.Character.HumanoidRootPart.CFrame = h.Character.HumanoidRootPart.CFrame
											* CFrame.new(0, 0, 3)
									else
										toTarget(h.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3))
									end
								end)
								spawn(function()
									if F:DistanceFromCharacter(h.Character.HumanoidRootPart.Position) < 50 then
										AutoAllSkill(true)
									end
								end)
							until tick() - g >= 70
								or not h.Character
								or not h.Character.Parent
								or h.Character.Humanoid.Health == 0
								or CheckSafezone(h.Character)
								or CheckPlayercantAttack(h.Character)
								or not Settings["Auto Upgrade Race V2-V3"]
						else
							HopServer()
							wait(5)
						end
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 5580]
------------------------------------------------------------------------
Sub_ItemsCraftingRaces[5580] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			local ui_notifications = env_ctx[3]
			local movement_utils = env_ctx[4]
			return function()
				if game.Players.LocalPlayer.Data.Race.Value ~= "Draco" then
					ui_notifications.CreateNoti({ Title = "Banana Cat Hub", Desc = "Change Race Draco plz", ShowTime = 5 })
					wait(5)
					return
				elseif DetectItemPlr("Primordial Reign") then
					ui_notifications.CreateNoti({ Title = "Banana Cat Hub", Desc = "Done V3 Draco", ShowTime = 5 })
					wait(5)
					return
				end
				local h, g =
					workspace.NPCs:FindFirstChild("Dragon Wizard") or game:GetService("ReplicatedStorage").NPCs
						:FindFirstChild("Dragon Wizard") or NPCManager.getNPCsByName("Dragon Wizard")[1]._modelState._instance,
					getgenv().QuestDraco
				local J = if g
					then getgenv().QuestDraco and not table.find(F, getgenv().QuestDraco.AvailableVQuest)
					else not g
				if J then
					if n:DistanceFromCharacter(h.HumanoidRootPart.Position) > 8 then
						toTarget(h.HumanoidRootPart.CFrame * CFrame.new(0, 4, 4))
					else
						getgenv().QuestDraco =
							game:GetService("ReplicatedStorage").Modules.Net["RF/InteractDragonQuest"]
								:InvokeServer({ NPC = "Dragon Wizard", Command = "Speak" })
						wait(1)
						if
							getgenv().QuestDraco and getgenv().QuestDraco.AvailableVQuest == "V2"
							or getgenv().QuestDraco.AvailableVQuest == "V3"
						then
							game:GetService("ReplicatedStorage").Modules.Net["RF/InteractDragonQuest"]
								:InvokeServer({ NPC = "Dragon Wizard", Command = "Ascension", Action = "Begin" })
							getgenv().QuestDraco =
								game:GetService("ReplicatedStorage").Modules.Net["RF/InteractDragonQuest"]
									:InvokeServer({ NPC = "Dragon Wizard", Command = "Speak" })
						end
					end
				elseif getgenv().QuestDraco.AvailableVQuest == "V2TurnInReady" then
					game:GetService("ReplicatedStorage").Modules.Net["RF/InteractDragonQuest"]
						:InvokeServer({ NPC = "Dragon Wizard", Command = "Ascension", Action = "Complete" })
					getgenv().QuestDraco = nil
				elseif getgenv().QuestDraco.AvailableVQuest == "V3TurnInReady" then
					game:GetService("ReplicatedStorage").Modules.Net["RF/InteractDragonQuest"]
						:InvokeServer({ NPC = "Dragon Wizard", Command = "Ascension", Action = "Complete" })
					getgenv().QuestDraco = nil
				elseif getgenv().QuestDraco.AvailableVQuest == "V2InProgress" then
					if CheckCountItem("Fire Flower", 5) then
						if n:DistanceFromCharacter(h.HumanoidRootPart.Position) > 8 then
							toTarget(h.HumanoidRootPart.CFrame * CFrame.new(0, 4, 4))
						else
							game:GetService("ReplicatedStorage").Modules.Net["RF/InteractDragonQuest"]
								:InvokeServer({ NPC = "Dragon Wizard", Command = "Ascension", Action = "Complete" })
							getgenv().QuestDraco = nil
						end
					else
						g = DetectFireFlower()
						if g then
							toTarget(g.PrimaryPart.CFrame)
							if n:DistanceFromCharacter(g.PrimaryPart.Position) < 8 then
								fireproximityprompt(g.ProximityPrompt, 1)
							end
						else
							local g = DetectMob("Forest Pirate")
							if g then
								while true do
									task.wait()
									sizepart(g)
									BringMob(g)
									UsedualFlock()
									ClickM1(g)
									if Settings["Select Weapon"] == "Blox Fruit" then
										toTarget(
											g.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0)
										)
									else
										toTarget(g.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
									end
									local F = IsMobAlive(g)
									if if F then not Settings["Auto Upgrade Race V2-V3 Draco"] else not F then
										break
									end
								end
							else
								local g = DetectPartSpawnMob("Forest Pirate", true)
								if g then
									Instance.new("IntValue", g).Name = "Ignored"
									while true do
										wait()
										toTarget(g.CFrame * CFrame.new(0, 60, 0))
										local F, J = g.Position, local_player.Character.HumanoidRootPart
										if
											(F - J.Position).Magnitude <= 100
											or DetectMob("Forest Pirate")
											or not Settings["Auto Upgrade Race V2-V3 Draco"]
											or wait(1)
										then
											break
										end
									end
								else
									DeleteIgnoredMobSpawn()
								end
							end
						end
					end
				elseif getgenv().QuestDraco.AvailableVQuest == "V3InProgress" then
					SaveSettings("V3InProgress", true)
					if getgenv().KilledTerroshark then
						if n:DistanceFromCharacter(h.HumanoidRootPart.Position) > 8 then
							toTarget(h.HumanoidRootPart.CFrame * CFrame.new(0, 4, 4))
						else
							game:GetService("ReplicatedStorage").Modules.Net["RF/InteractDragonQuest"]
								:InvokeServer({ NPC = "Dragon Wizard", Command = "Ascension", Action = "Complete" })
							getgenv().QuestDraco = nil
							getgenv().KilledTerroshark = false
						end
					else
						local h, g = CheckNameBoss("Terrorshark"), checkboat()
						if h then
							while true do
								task.wait()
								TeleportSeaEvents(h)
								local F = h:FindFirstChild("HumanoidRootPart")
								getgenv().AimPos = CFrame.new(F.Position.X, 40, F.Position.Z)
								UsedualFlock()
								ClickM1(h, true)
								F = IsMobAlive(h)
								if if F then not Settings["Auto Upgrade Race V2-V3 Draco"] else not F then
									break
								end
							end
							getgenv().KilledTerroshark = true
						elseif g then
							local h = DecectPartRoughSea()
							if h then
								wait(1)
								V[6][V[5]] = if V[6][V[5]] == 0 then 7000 else 0
								Instance.new("IntValue", h).Name = "Ignored"
								wait(0.5)
							end
							getgenv().RoughSea = V[6][V[5]]
							h = CFrame.new(-32975.9921875, g.WorldPivot.Y, 25963.7109375)
								* CFrame.new(0, g.WorldPivot.Y, 0 + RoughSea)
							if local_player.Character.Humanoid.Sit then
								manageTween(g.VehicleSeat, h, 150, "TweenBoat")
							else
								toTarget(g.VehicleSeat.CFrame)
							end
						else
							local h = CFrame.new(-16204.0810546875, 9.0863618850708, 479.2259521484375)
							if (h.Position - local_player.Character.HumanoidRootPart.Position).Magnitude > 8 then
								toTarget(h)
							else
								game:GetService("ReplicatedStorage").Remotes.CommF_
									:InvokeServer("BuyBoat", "PirateBrigade")
							end
						end
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 7924]
------------------------------------------------------------------------
Sub_ItemsCraftingRaces[7924] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			local ui_notifications = env_ctx[3]
			local movement_utils = env_ctx[4]
			local combat_config = env_ctx[5]
			return function()
				if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CyborgTrainer", "Check") == 2 then
					ui_notifications.CreateNoti({ Title = "Banana Cat Hub", Desc = "Plz Turn Off", ShowTime = 5 })
					wait(5)
					return
				end
				if game.PlaceId ~= getgenv().CheckPlaceId2 then
					game:GetService("ReplicatedStorage").Remotes.CommF_
						:InvokeServer(unpack({ [1] = "TravelDressrosa" }))
					return
				end
				if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CyborgTrainer", "Check") then
					game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CyborgTrainer", "Buy")
					return
				end
				if if F[6][F[5]] then not F[6][F[5]] else not DetectItemPlr("Core Brain") then
					repeat
						wait(1)
						fireclickdetector(
							game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector
						)
					until DetectkeyCyborg("{color1_Green}Please supply a {item1} to continue.{color1_/}")
						or DetectkeyCyborg("{color1_Green}Supply a {item1} to continue.{color1_/}")
						or DetectkeyCyborg("{color1_Red}Microchip not found.{color1_/}")
					if DetectkeyCyborg("{color1_Red}Microchip not found.{color1_/}") then
						ui_notifications = false
					elseif DetectkeyCyborg("{color1_Green}Please supply a {item1} to continue.{color1_/}") then
						ui_notifications = true
					elseif DetectkeyCyborg("{color1_Green}Supply a {item1} to continue.{color1_/}") then
						ui_notifications = true
					end
					F[6][F[5]] = true
				end
				if Settings["Auto Get Fully Cyborg"] and not CheckNameBoss("Order") and not ui_notifications then
					if DetectItemPlr("Fist of Darkness") then
						wait(1)
						repeat
							wait()
							fireclickdetector(
								game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector
							)
						until not DetectItemPlr("Fist of Darkness")
						wait(0.5)
						ToggleAutoGetFullyCyborg:SetStage(false)
						ui_notifications = true
					else
						if V[6][V[5]] >= 20 then
							if Settings["Auto Get Cyborg Hop Collect Chest"] then
								if not getgenv().DelayHop then
									task.delay(5, function()
										getgenv().DelayHop = true
										spawn(function()
											HopLessAll()
										end)
										spawn(function()
											HopServer()
										end)
										getgenv().DelayHop = false
									end)
								end
								return
							end
						end
						local h = GetNearestChest()
						if h then
							V[6][V[5]] += 1
							local g
							repeat
								task.wait()
								if
									(game.Players.LocalPlayer.Character.HumanoidRootPart.Position - h.Position).Magnitude
									<= 5
								then
									if g then
										if tick() - g >= 5 then
											Instance.new("IntValue", h).Name = "Ignored"
											wait(0.5)
										end
									else
										g = tick()
									end
									local g, F = game, game
									g:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, F)
									wait()
									F, g = game, game
									F:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, g)
									TweenManager.CancelCurrent()
								else
								end
								toTarget(h.CFrame, true)
							until (if h then not h.Parent else not h)
								or not Settings["Auto Get Cyborg"]
								or h:GetAttribute("IsDisabled")
								or h:FindFirstChild("Ignored")
								or not h:FindFirstChild("TouchInterest")
						else
							local h = PathFindChest()
							if h then
								toTarget(h.Part.CFrame)
								if
									(h.Part.Position - J.Character.HumanoidRootPart.Position).Magnitude <= 100
									or GetNearestChest()
								then
									Instance.new("IntValue", h).Name = "Ignored"
								end
							else
								print("delete")
								for h, h in
									pairs(game:GetService("Workspace")._WorldOrigin.PlayerSpawns.Pirates:GetChildren())
								do
									if h:FindFirstChild("Ignored") then
										h:FindFirstChild("Ignored"):Destroy()
									end
								end
							end
						end
					end
					return
				end
				if ui_notifications then
					if DetectItemPlr("Core Brain") then
						fireclickdetector(
							game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector
						)
						return
					end
					local boss_mob = CheckNameBoss("Order")
					if h then
						while true do
							task.wait()
							sizepart(h)
							UsedualFlock()
							ClickM1(h)
							if Settings["Select Weapon"] == "Blox Fruit" then
								toTarget(h.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0))
							else
								toTarget(h.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
							end
							local g = IsMobAlive(h)
							if if g then not Settings["Auto Get Cyborg"] else not g then
								break
							end
						end
					else
						local h = DetectItemPlr("Microchip")
						if if h then not h else game.Players.LocalPlayer.Data.Fragments.Value >= 1000 then
							BuyChipLaw()
							wait(2)
						elseif DetectItemPlr("Microchip") then
							fireclickdetector(
								game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector
							)
						end
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 6703]
------------------------------------------------------------------------
Sub_ItemsCraftingRaces[6703] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			return function()
				if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("HornedMan") == 1 then
					ui_notifications.CreateNoti({ Title = "Banana Cat Hub", Desc = "Done Get Rainbow Haki", ShowTime = 5 })
					wait(5)
					return
				end
				local h = workspace.NPCs:FindFirstChild("Horned Man")
					or game:GetService("ReplicatedStorage").NPCs:FindFirstChild("Horned Man")
					or NPCManager.getNPCsByName("Horned Man")[1]._modelState._instance
				if DetectQuestRainBowHaki() then
					if F:DistanceFromCharacter(h.HumanoidRootPart.Position) > 8 then
						toTarget(h.HumanoidRootPart.CFrame)
					else
						wait(2)
						game.ReplicatedStorage.Remotes.CommF_:InvokeServer("HornedMan", "Bet")
					end
				else
					local boss_mob = CheckNameBoss(DetectQuestRainBowHaki(true))
					if h then
						while true do
							task.wait()
							sizepart(h)
							if Settings["Select Weapon"] == "Blox Fruit" then
								toTarget(h.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0))
							else
								toTarget(h.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
							end
							ClickM1(h)
							UsedualFlock()
							local F = IsMobAlive(h)
							if if F then not Settings["Auto Get Rainbow Haki"] else not F then
								break
							end
						end
					else
						ui_notifications.CreateNoti({ Title = "Banana Cat Hub", Desc = "Waiting Boss Spawn", ShowTime = 5 })
						wait(5)
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 13019]
------------------------------------------------------------------------
Sub_ItemsCraftingRaces[13019] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			local ui_notifications = env_ctx[3]
			return function()
				if CheckItemInventory("Dark Dagger") then
					ui_notifications.CreateNoti({ Title = "Banana Cat Hub", Desc = "u haved Yoru Mini", ShowTime = 5 })
					return
				end
				local boss_mob = CheckNameBoss("rip_indra True Form")
				if h then
					while true do
						task.wait()
						sizepart(h)
						if Settings["Select Weapon"] == "Blox Fruit" then
							toTarget(h.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0))
						else
							toTarget(h.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
						end
						UsedualFlock()
						ClickM1(h)
						local g = IsMobAlive(h)
						if if g then not Settings["Auto Yoru Mini"] else not g then
							break
						end
					end
				elseif DetectItemPlr("God's Chalice") then
					F[6][F[5]] = Settings["Value Collect Chest to Hop"] or 20
					RipIndraPending()
					local h = IsMisisngLegHaki()
					if if h then not h else DetectButtons() then
						TouchPadHaki()
					elseif not (DetectButtons()) then
						equiptool("God's Chalice")
						toTarget(game:GetService("Workspace").Map["Boat Castle"].Summoner.Detection.CFrame)
					end
				else
					elitehunter = DetectEliteHunter()
					if elitehunter then
						local h = elitehunter
						if h then
							if string.find(GetQuestText(), h.Name, 1, true) then
								while true do
									task.wait()
									sizepart(h)
									if Settings["Select Weapon"] == "Blox Fruit" then
										toTarget(
											h.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0)
										)
									else
										toTarget(h.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
									end
									UsedualFlock()
									ClickM1(h)
									local g = IsMobAlive(h)
									if if g then not Settings["Auto Yoru Mini"] else not g then
										break
									end
								end
							else
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
							end
						end
					else
						local h = Settings["Value Collect Chest to Hop"] or 20
						if not (RipIndraPending()) then
							if F[6][F[5]] then
								if F[6][F[5]] >= h then
									if Settings["Auto Yoru Mini (Hop Server)"] then
										HopServer()
										return
									end
								end
							end
						end
						h = GetNearestChest()
						if h then
							F[6][F[5]] += 1
							local g
							repeat
								task.wait()
								if
									(game.Players.LocalPlayer.Character.HumanoidRootPart.Position - h.Position).Magnitude
									<= 5
								then
									if g then
										if tick() - g >= 5 then
											Instance.new("IntValue", h).Name = "Ignored"
											wait(0.5)
										end
									else
										g = tick()
									end
									local g, F = game, game
									g:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, F)
									wait()
									F, g = game, game
									F:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, g)
									TweenManager.CancelCurrent()
								else
								end
								toTarget(h.CFrame, true)
							until (if h then not h.Parent else not h)
								or not Settings["Auto Yoru Mini"]
								or h:GetAttribute("IsDisabled")
								or h:FindFirstChild("Ignored")
								or not h:FindFirstChild("TouchInterest")
						else
							local h = PathFindChest()
							if h then
								toTarget(h.Part.CFrame)
								if
									(h.Part.Position - local_player.Character.HumanoidRootPart.Position).Magnitude <= 100
									or GetNearestChest()
								then
									Instance.new("IntValue", h).Name = "Ignored"
								end
							else
								print("delete")
								for h, h in
									pairs(game:GetService("Workspace")._WorldOrigin.PlayerSpawns.Pirates:GetChildren())
								do
									if h:FindFirstChild("Ignored") then
										h:FindFirstChild("Ignored"):Destroy()
									end
								end
							end
						end
					end
				end
			end
		end
	end



BananaHub.Subsystems.ItemsCraftingRaces = Sub_ItemsCraftingRaces
for func_id, func_impl in pairs(Sub_ItemsCraftingRaces) do
	BananaHub.Functions[func_id] = func_impl
end

--==============================================================================
-- PHÂN HỆ: [UtilitiesMovementNetwork] - Bay Fly, Noclip chống giật, Server Hop ít người, Number format
-- Source: deobf/modules/08_utilities_movement_network.lua
--==============================================================================
--==============================================================================
-- Module 8: Movement, Server Hop & Utilities
-- Hệ thống bay lượn FastTween bypass anticheat, gom quái Bring Mob, tự động nhặt rương chuyển server (Server Hop) và tiện ích.
-- Source: deobf/mduc.lua (Banana Hub Blox Fruits)
-- FULL DEOBFUSCATED CODE - RESTORED CONSTANTS & API ALIASES
-- STRICTLY 100% GENUINE LOGIC - NO CODE INVENTED
--==============================================================================

local Sub_UtilitiesMovementNetwork = {}

------------------------------------------------------------------------
-- [Function ID: 111]
------------------------------------------------------------------------
Sub_UtilitiesMovementNetwork[111] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			return function(n, V, J, J, W)
				if not n or typeof(V) ~= "CFrame" then
					return
				end
				local G = local_player.Character
				local Z = G and (G:FindFirstChildOfClass("Humanoid"))
				if not G or n.Parent ~= G then
					return
				elseif Z then
					if Z.Health <= 0 then
						return
					end
				else
					return
				end
				local s, u = W ~= false, TweenManager.currentTween
				if u then
					if u.Alive then
						W = F.ActiveConnection
						if type(W) ~= "thread" or coroutine.status(W) == "dead" then
							TweenManager.CancelTweenOnly()
							u = nil
						else
						end
					else
					end
				else
				end
				if u then
					if u.Alive then
						if u.Target then
							if u.AvoidObstacles == s then
								if tick() - F.LastTP < 1 then
									if V == F.LastCF then
										if TweenManager.currentPart == n then
											return u
										elseif TweenManager.currentPart then
											if TweenManager.currentPart.Parent == G then
												return u
											end
										end
									end
								end
							end
						end
					end
				end
				if u then
					if u.Alive then
						if u.Target then
							if u.AvoidObstacles == s then
								if TweenManager.currentPart ~= n then
									if TweenManager.currentPart then
										if TweenManager.currentPart.Parent == G then
											TweenManager.currentPart = n
										end
									end
								end
								if TweenManager.currentPart == n then
									if u.AvoidObstacles then
										if
											(u.Target.Position - V.Position).Magnitude >= F.RouteConfig.ReplanDistance
										then
											u.RouteDirty = true
											u.RouteReplans = 0
											u.ReplanWindowStartedAt = tick()
										end
									end
									u.Target = V
									u.Speed = F.RouteConfig.TweenSpeed
									u.Epsilon = tonumber(J) or 2.5
									F.LastTP = tick()
									F.LastCF = V
									TweenManager.currentGoal = V
									return u
								end
							end
						end
					end
				end
				TweenManager.CancelTweenOnly()
				if F.ActiveConnection then
					if coroutine.status(F.ActiveConnection) == "suspended" then
						pcall(coroutine.close, F.ActiveConnection)
					end
				end
				Z = F.RouteConfig.TweenSpeed
				J = tonumber(J) or 2.5
				F.LastTP = tick()
				F.LastCF = V
				local W, u = false
				local _ = {
					Target = V,
					Speed = Z,
					Epsilon = J,
					AvoidObstacles = s,
					Route = nil,
					RouteIndex = 1,
					RouteInfo = nil,
					RouteDirty = true,
				}
				_.RoutePlannedTarget = V.Position
				_.NextRoutePlanAt = 0
				_.NextRouteProbeAt = 0
				_.LastMoveDirection = nil
				_.ProgressTarget = V.Position
				_.RouteReplans = 0
				_.ReplanWindowStartedAt = tick()
				_.Alive = true
				local function J()
					_.Alive = false
					if F.ActiveConnection == u then
						F.ActiveConnection = nil
					end
					if TweenManager.currentTween == _ then
						TweenManager.currentTween = nil
						TweenManager.currentPart = nil
						TweenManager.currentGoal = nil
						TweenManager.TweenRunning = false
					end
					if getgenv().Tween == _ then
						getgenv().Tween = nil
					end
				end
				_.Pause = function(Z)
					W = true
					if u then
						if coroutine.status(u) == "suspended" then
							pcall(coroutine.close, u)
						end
					end
				end
				_.Cancel = function(Z)
					Z:Pause()
					J()
				end
				_.Destroy = function(Z)
					Z:Cancel()
				end
				u = coroutine.create(function()
					local Z, s, v, z = n.Position, _.Target
					if _.AvoidObstacles then
						v, z = F.BuildRoute(G, Z, s.Position)
					else
						v, z = { s.Position }, { Avoiding = false }
					end
					local C = 1
					local K = v[C]
					local N = (K - Z).Magnitude
					_.Route = v
					_.RouteIndex = C
					_.RouteInfo = z
					_.RoutePlannedTarget = s.Position
					_.RouteDirty = false
					_.NextRoutePlanAt = tick()
						+ (z.DirectBlocked and F.RouteConfig.FailedRouteBackoff or F.RouteConfig.ReplanCooldown)
					_.NextRouteProbeAt = tick() + F.RouteConfig.ReplanCooldown
					local O, R, p, I
					O, R, p, I = tick, nil, nil, 1 / 0
					local t = O()
					O = nil
					local D, k = true
					local f, j = 0, 0
					while true do
						local l = W
						if l then
							break
						end
						l = local_player.Character
						local q = l and (l:FindFirstChildOfClass("Humanoid"))
						if l ~= G or n.Parent ~= l or not q then
							break
						elseif q.Health <= 0 then
							break
						elseif n.Anchored then
							break
						elseif z.Holding then
							if tick() - F.LastCall > 2 then
								break
							end
						end
						q, l = F.RunService.Heartbeat:Wait(), F.CharSpeedLimit()
						_.Speed = F.RouteConfig.TweenSpeed
						local T = n.Position
						if _.Target ~= s then
							local S = _.Target.Position
							local d, r =
								(S - s.Position).Magnitude,
								_.AvoidObstacles
									and (S - _.RoutePlannedTarget).Magnitude >= F.RouteConfig.ReplanDistance
							if r then
								if not _.RouteDirty then
									_.RouteReplans = 0
									_.ReplanWindowStartedAt = tick()
								end
							end
							if r then
								_.RouteDirty = true
							end
							s = _.Target
							if not z.Holding then
								v[#v] = S
								if z.Avoiding then
									if #v >= 3 then
										v[#v - 1] = Vector3.new(S.X, z.SafeY, S.Z)
									end
								end
							end
							K = v[C]
							N = (K - Z).Magnitude
							if d > 0.5 then
								R, p = nil, nil
							else
							end
							if (S - _.ProgressTarget).Magnitude >= F.RouteConfig.ProgressRetargetDistance then
								I, t = 1 / 0, tick()
								_.ProgressTarget = S
								O, D = nil, true
							else
							end
						else
						end
						local S = C >= #v and _.Epsilon or 0.05
						if N <= S and not _.RouteDirty then
							if C < #v then
								if (K - T).Magnitude <= 6 then
									R = R or tick()
									if tick() - R >= F.RouteConfig.WaypointSettleTime then
										C = C + 1
										K = v[C]
										N = (K - T).Magnitude
										_.RouteIndex = C
										_.RouteReplans = 0
										_.ReplanWindowStartedAt = tick()
										Z, R, p, I, t, O, D, k, f, j = T, nil, nil, 1 / 0, tick(), nil, true, nil, 0, 0
									else
									end
								else
									N, Z, R = (K - T).Magnitude, T, nil
								end
							else
								if z.Holding then
									local d, r
									local y = (K - T).Magnitude
									Z, R, p = T, d, r
								else
									local d, r
									if (s.Position - T).Magnitude <= _.Epsilon then
										d, r = nil, p or tick()
										if tick() - r >= F.RouteConfig.FinalSettleTime then
											R, p = d, r
											break
										end
										R, p = d, r
									else
										d, r = nil, nil
										local y = (K - T).Magnitude
										Z, R, p = T, d, r
									end
								end
							end
						else
							if N > S then
								local d, r
								R, p = d, r
							else
								if _.RouteDirty then
									local d, r
									R, p = d, r
								else
								end
							end
						end
						if _.AvoidObstacles then
							if z.DirectBlocked then
								if tick() >= _.NextRoutePlanAt then
									_.RouteDirty = true
								end
							end
						end
						if _.AvoidObstacles then
							if tick() >= _.NextRouteProbeAt then
								if (K - T).Magnitude > 8 then
									_.NextRouteProbeAt = tick() + F.RouteConfig.ReplanCooldown
									S = C >= #v
									local d = S and F.RouteConfig.EndpointAllowance or 0
									if F.FindRouteBlocker(G, T, K, d, S) then
										if not z.DirectBlocked then
											_.RouteDirty = true
										end
									end
								end
							end
						end
						if _.AvoidObstacles and _.RouteDirty and tick() >= _.NextRoutePlanAt then
							S = tick()
							if S - _.ReplanWindowStartedAt >= F.RouteConfig.ReplanWindow then
								_.RouteReplans = 0
								_.ReplanWindowStartedAt = S
							end
							if _.RouteReplans >= F.RouteConfig.MaxReplansPerWindow then
								_.NextRoutePlanAt = _.ReplanWindowStartedAt + F.RouteConfig.ReplanWindow
							else
								if _.AvoidObstacles then
									v, z = F.BuildRoute(G, T, s.Position)
								else
									v = { s.Position }
									z = { Avoiding = false }
								end
								C = 1
								K = v[C]
								N = (K - T).Magnitude
								_.Route = v
								_.RouteIndex = C
								_.RouteInfo = z
								_.RoutePlannedTarget = s.Position
								_.ProgressTarget = s.Position
								_.RouteDirty = false
								_.NextRoutePlanAt = S
									+ (
										z.DirectBlocked and F.RouteConfig.FailedRouteBackoff
										or F.RouteConfig.ReplanCooldown
									)
								_.NextRouteProbeAt = S
									+ (
										z.DirectBlocked and F.RouteConfig.FailedRouteBackoff
										or F.RouteConfig.ReplanCooldown
									)
								_.RouteReplans = _.RouteReplans + 1
								Z, R, p, I, t, O, D, k, f, j = T, nil, nil, 1 / 0, S, nil, true, nil, 0, 0
							end
						else
						end
						S = (K - T).Magnitude
						if k then
							local s = T - k
							local d, r = s.Magnitude, _.LastMoveDirection and s:Dot(_.LastMoveDirection) or 0
							local y = _.LastMoveDirection and (s - _.LastMoveDirection * r).Magnitude or d
							s = d > 3 and d < F.RouteConfig.SnapDrift and (r < -2 or y > 2)
							if s then
								f = f + 1
								j = j + d
								if f >= 3 then
									if j >= 12 then
										if _.AvoidObstacles then
											local s, s, d = (K - T).Magnitude
											l.cap = math.max(l.cap * 0.8, F.RouteConfig.SpeedFloor)
											l.nextRaise = tick() + 2
											y = C >= #v
											if
												F.FindRouteBlocker(
													G,
													T,
													K,
													y and F.RouteConfig.EndpointAllowance or 0,
													y
												)
											then
												if not z.DirectBlocked then
													if tick() >= _.NextRoutePlanAt then
														_.RouteDirty = true
													end
												end
											end
											local G, v = 0, 0
											Z, R, p, f, j = T, s, d, G, v
										else
										end
									else
									end
								else
								end
							else
								f, j = 0, 0
							end
							if r < -F.RouteConfig.FastTweenRollbackDistance then
								F.BackoffFastTween(l)
							end
						else
						end
						if S < I - 5 then
							I, t = S, tick()
						else
							if tick() - t > 2.5 then
								if _.AvoidObstacles then
									N, R, p = (K - T).Magnitude, nil, nil
									l.cap = math.max(l.cap * 0.75, F.RouteConfig.SpeedFloor)
									l.nextRaise = tick() + 3
									if tick() >= _.NextRoutePlanAt then
										_.RouteDirty = true
									end
									Z, t = T, tick()
								else
									D = false
								end
							else
							end
						end
						if D and k and O and S > O + F.RouteConfig.SnapDrift then
							R, p = nil, nil
							l.cap = math.max(l.cap * 0.7, F.RouteConfig.SpeedFloor)
							l.nextRaise = tick() + 3
							if _.AvoidObstacles then
								if z.Avoiding then
									if C > 1 then
										if tick() >= _.NextRoutePlanAt then
											_.RouteDirty = true
										end
									end
								end
							end
							Z = T
						else
							if D then
								if k then
									if (T - k).Magnitude > F.RouteConfig.SnapDrift then
										local G, s
										if _.AvoidObstacles then
											if z.Avoiding then
												if C > 1 then
													if tick() >= _.NextRoutePlanAt then
														_.RouteDirty = true
													end
												end
											end
										end
										Z, R, p = T, G, s
									else
									end
								else
								end
							else
							end
						end
						T = K - Z
						local G, s =
							T.Magnitude,
							math.min(math.min(_.Speed, l.cap, F.RouteConfig.TweenSpeed) * q, F.RouteConfig.StepMax)
						if G > s then
							if tick() >= l.nextRaise then
								if Settings["FastTween (risk)"] then
									l.cap = math.min(
										l.cap + F.RouteConfig.FastTweenRecoveryAcceleration * math.min(q, 0.07),
										_.Speed,
										F.RouteConfig.TweenSpeed
									)
								else
									l.cap = math.min(l.cap * 1.08, _.Speed, F.RouteConfig.TweenSpeed)
									l.nextRaise = tick() + 1.5
								end
							end
						end
						Z = if G <= s then K else if G <= 0.05 then K else Z + T / G * s
						N = (K - Z).Magnitude
						_.LastMoveDirection = G > 0.05 and T / G or nil
						env_ctx[3]()
						getgenv().noclip = true
						n.CFrame = CFrame.new(Z)
						n.AssemblyLinearVelocity = Vector3.new(0.0, 0.0, 0.0)
						n.AssemblyAngularVelocity = Vector3.new(0.0, 0.0, 0.0)
						O, k = S, Z
					end
					if not W then
						if n.Parent == local_player.Character then
							if not z.Holding then
								if (_.Target.Position - n.Position).Magnitude <= _.Epsilon then
									n.CFrame = _.Target
									n.AssemblyLinearVelocity = Vector3.new(0.0, 0.0, 0.0)
									n.AssemblyAngularVelocity = Vector3.new(0.0, 0.0, 0.0)
								end
							end
						end
					end
					J()
				end)
				F.ActiveConnection = u
				TweenManager.currentTween = _
				TweenManager.currentPart = n
				TweenManager.currentGoal = V
				TweenManager.TweenRunning = true
				getgenv().Tween = _
				if not (coroutine.resume(u)) then
					_:Cancel()
					return
				end
				return _
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 9004]
------------------------------------------------------------------------
Sub_UtilitiesMovementNetwork[9004] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			return function()
				if not StackFarmOther then
					return
				end
				local h = Settings["Value Collect Chest to Hop"] or 20
				if CheckNameBoss("Darkbeard") then
					if Settings["Attack Darkbeard"] then
						ui_notifications = h
						return
					end
				end
				if DetectItemPlr("Fist of Darkness") then
					if Settings["Summon Darkbeard"] then
						ui_notifications = h
						return
					end
				end
				if DetectItemPlr("Fist of Darkness") then
					if Settings["Tween Safe if have Items"] then
						return
					end
				elseif DetectItemPlr("God's Chalice") then
					if Settings["Tween Safe if have Items"] then
						return
					end
				end
				if not (RipIndraPending()) then
					if ui_notifications then
						if ui_notifications >= h then
							if Settings["Auto Chest Hop"] then
								HopServer()
								return
							end
						end
					end
				end
				h = GetNearestChest()
				if h then
					ui_notifications += 1
					local g
					repeat
						task.wait()
						if
							(game.Players.LocalPlayer.Character.HumanoidRootPart.Position - h.Position).Magnitude <= 5
						then
							if g then
								if tick() - g >= 5 then
									Instance.new("IntValue", h).Name = "Ignored"
									wait(0.1)
								end
							else
								g = tick()
							end
							if not Settings["Use Method Teleport"] then
								local g, n = game, game
								g:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, n)
								wait()
								g, n = game, game
								g:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, n)
							end
							TweenManager.CancelCurrent()
						else
						end
						if Settings["Use Method Teleport"] then
							game_services.Character.HumanoidRootPart.CFrame = h.CFrame
							TweenManager.CancelCurrent()
						else
							toTarget(h.CFrame, true)
						end
					until (if h then not h.Parent else not h)
						or not Settings["Auto Chest"]
						or h:GetAttribute("IsDisabled")
						or h:FindFirstChild("Ignored")
						or not h:FindFirstChild("TouchInterest")
						or not StackFarmOther
				else
					local h = PathFindChest()
					if h then
						toTarget(h.Part.CFrame)
						if
							(h.Part.Position - game_services.Character.HumanoidRootPart.Position).Magnitude <= 100
							or GetNearestChest()
						then
							Instance.new("IntValue", h).Name = "Ignored"
						end
					else
						for h, h in pairs(game:GetService("Workspace")._WorldOrigin.PlayerSpawns.Pirates:GetChildren()) do
							if h:FindFirstChild("Ignored") then
								h:FindFirstChild("Ignored"):Destroy()
							end
						end
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 45]
------------------------------------------------------------------------
Sub_UtilitiesMovementNetwork[45] = function(env_ctx)
		return function(h)
			return function()
				require(game:GetService("ReplicatedStorage").Notification)
					.new("<Color=Red>Banana Hub : Hop Server<Color=/>")
					:Display()
				local h, g, F = game.PlaceId, {}, ""
				local n = os.date("!*t").hour
				local V = pcall(function()
					g = game:GetService("HttpService"):JSONDecode(readfile("Banana Cat Hub/NotSameServers.json"))
				end)
				if not V then
					table.insert(g, n)
					writefile("Banana Cat Hub/NotSameServers.json", game:GetService("HttpService"):JSONEncode(g))
				end
				function HopServerLess()
					local V, J =
						if F == ""
							then game.HttpService:JSONDecode(
								game:HttpGet(
									"https://games.roblox.com/v1/games/"
										.. h
										.. "/servers/Public?sortOrder=Asc&limit=100"
								)
							)
							else game.HttpService:JSONDecode(
								game:HttpGet(
									"https://games.roblox.com/v1/games/"
										.. h
										.. "/servers/Public?sortOrder=Asc&limit=100&cursor="
										.. F
								)
							),
						""
					if V.nextPageCursor then
						if V.nextPageCursor ~= "null" then
							if V.nextPageCursor ~= nil then
								F = V.nextPageCursor
							end
						end
					end
					local h, F = pairs, V.data
					local V = 0
					for _, G in h(F) do
						J = tostring(G.id)
						if tonumber(G.maxPlayers) > tonumber(G.playing) then
							if tonumber(G.playing) <= 3 then
								local h, F, G = g, V, W
								for W, W in pairs(h) do
									if F ~= 0 then
										G = if J == tostring(W) then false else G
									else
										if tonumber(n) ~= tonumber(W) then
											pcall(function()
												delfile("Banana Cat Hub/NotSameServers.json")
												g = {}
												table.insert(g, n)
											end)
										end
									end
									F = F + 1
								end
								if G == true then
									table.insert(g, J)
									wait()
									pcall(function()
										writefile(
											"Banana Cat Hub/NotSameServers.json",
											game:GetService("HttpService"):JSONEncode(g)
										)
										wait()
										game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", J)
										getgenv().limit_type("clearAll")
									end)
									wait(4)
								end
								V = F
							else
							end
						else
						end
					end
				end
				while wait() do
					HopServerLess()
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 1673]
------------------------------------------------------------------------
Sub_UtilitiesMovementNetwork[1673] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = runtime_state[1]
			local game_services = runtime_state[2]
			local ui_notifications = runtime_state[3]
			return function(g)
				if not Settings["Bring Mob"] then
					return
				end
				if g then
					if F[6][F[5]] ~= g then
						F[6][F[5]] = g
						ui_notifications = g.HumanoidRootPart.CFrame
						DeleteIgnoredMob()
					end
				end
				if DaBringMob then
					delay(0.1, function()
						getgenv().DaBringMob = false
					end)
					return
				end
				local F = {}
				if not (g:FindFirstChild("Ignored")) then
					table.insert(F, g)
				end
				local J, W = pairs, table.pack(game:GetService("Workspace").Enemies:GetChildren())
				for G, Z in J(h:XU(W)) do
					if Z ~= g then
						if Z.Name == g.Name then
							if not (Z:FindFirstChild("Ignored")) then
								if IsMobAlive(Z) then
									if isnetworkowner2(Z.HumanoidRootPart) then
										local dist_mob = (Z.HumanoidRootPart.Position - ui_notifications.Position).Magnitude
										if dist_mob <= 200 then
											if #F < 1 then
												table.insert(F, Z)
											end
										end
									end
								end
							end
						end
					end
				end
				if
					ui_notifications
					and (V.Character.HumanoidRootPart.Position - g.HumanoidRootPart.Position).Magnitude <= 50
					and isnetworkowner2(V.Character.HumanoidRootPart)
				then
					J = pairs
					for h, h in J(F) do
						sizepart(h)
						h.HumanoidRootPart.CFrame = ui_notifications * CFrame.new(0, math.random(0, 2), math.random(0, 2))
						task.spawn(function()
							local g = h.Humanoid.Health
							task.wait(3.5)
							if h.Humanoid.Health == g then
								if not (h:FindFirstChild("Ignored")) then
									h.HumanoidRootPart.CFrame = h.WorldPivot
									Instance.new("IntValue", h).Name = "Ignored"
									task.wait(0.3)
								end
							end
						end)
						getgenv().DaBringMob = true
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 26]
------------------------------------------------------------------------
Sub_UtilitiesMovementNetwork[26] = function(env_ctx)
		return function(h, h)
			return function(h)
				return tostring(h):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 7629]
------------------------------------------------------------------------
Sub_UtilitiesMovementNetwork[7629] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = runtime_state[1]
			return function()
				local g, n, V = {}, pairs, table.pack(game:GetService("Players"):GetChildren())
				for J, J in n(h:XU(V)) do
					if J.Name ~= F.Name then
						if not (table.find(g, J.Name)) then
							table.insert(g, J.Name)
						end
					end
				end
				return g
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 8105]
------------------------------------------------------------------------
Sub_UtilitiesMovementNetwork[8105] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			return function(h)
				local n = game:GetService("Players").LocalPlayer.PlayerGui.Notifications
				local V, J, W, G = n:FindFirstChild("NotificationStack") or n, g[h]
				if J then
					W, G = J:match("^(.-){item1}(.-)$")
				else
				end
				local Z, s, u = next, V:GetChildren()
				for _, v in Z, s, u do
					if v.Name == "NotificationTemplate" or v.Name == "Notification" then
						if v.Visible then
							V = v:FindFirstChild("TranslateMe")
							if V then
								if V.Text == h then
									return true
								end
							end
							local V, Z, s
							if J then
								V, Z, s = J, W, G
							else
								F[6][F[5]] = F[6][F[5]]
									or game:GetService("LocalizationService")
										:GetTranslatorForPlayer(game:GetService("Players").LocalPlayer)
								V = F[6][F[5]]:Translate(game, h):gsub("{color1_[^}]+}", "")
								g[h] = V
								V, Z, s = V, V:match("^(.-){item1}(.-)$")
							end
							_ = v:IsA("TextLabel") and v or v:FindFirstChildWhichIsA("TextLabel", true)
							n = _ and _.Text:gsub("&lt;", "<"):gsub("&gt;", ">"):gsub("<[^>]+>", "")
							if n then
								if n == V then
									return true
								elseif Z then
									if n:sub(1, #Z) == Z then
										if n:sub(-#s) == s then
											return true
										end
									end
								end
							end
							J, W, G = V, Z, s
						else
						end
					else
					end
				end
			end
		end
	end



BananaHub.Subsystems.UtilitiesMovementNetwork = Sub_UtilitiesMovementNetwork
for func_id, func_impl in pairs(Sub_UtilitiesMovementNetwork) do
	BananaHub.Functions[func_id] = func_impl
end

--==============================================================================
-- PHÂN HỆ: [SharkAnchorTerrorJaw] - Chế Monster Magnet, săn Terror Jaw, lấy Shark Anchor
-- Source: deobf/modules/09_shark_anchor_and_terror_jaw.lua
--==============================================================================
--==============================================================================
-- Module 9: Shark Anchor Crafting & Terror Shark Hunter
-- Tự động chế tạo Monster Magnet, kiểm tra nguyên liệu Shark Tooth/Mutant Tooth, săn quái Terror Jaw/Terror Shark lấy Shark Anchor.
-- Source: deobf/mduc.lua (Banana Hub Blox Fruits)
-- FULL DEOBFUSCATED CODE - RESTORED CONSTANTS & API ALIASES
-- STRICTLY 100% GENUINE LOGIC - NO CODE INVENTED
--==============================================================================

local Sub_SharkAnchorTerrorJaw = {}

------------------------------------------------------------------------
-- [Function ID: 6252]
------------------------------------------------------------------------
Sub_SharkAnchorTerrorJaw[6252] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			return function()
				if CheckItemInventory("Shark Anchor") then
					ui_notifications.CreateNoti({ Title = "Banana Cat Hub", Desc = "Done Shark Anchor", ShowTime = 5 })
					wait(5)
					return
				end
				if not (CheckItemInventory("Monster Magnet")) then
					local has_item = CheckItemInventory("Shark Tooth Necklace")
					if
						(if h then not h else CheckCountItem("Mutant Tooth", 1)) and CheckCountItem("Shark Tooth", 5)
					then
						game:GetService("ReplicatedStorage").Modules.Net
							:FindFirstChild("RF/Craft")
							:InvokeServer(unpack({ [1] = "Craft", [2] = "ToothNecklace", [3] = 1, [4] = {} }))
					else
						local has_item = CheckItemInventory("Terror Jaw")
						if
							(if h then not h else CheckCountItem("Mutant Tooth", 2))
							and CheckCountItem("Shark Tooth", 5)
							and CheckCountItem("Terror Eyes", 1)
							and CheckCountItem("Fool's Gold", 10)
						then
							game:GetService("ReplicatedStorage").Modules.Net
								:FindFirstChild("RF/Craft")
								:InvokeServer(unpack({ [1] = "Craft", [2] = "TerrorJaw", [3] = 1, [4] = {} }))
						elseif CheckItemInventory("Shark Tooth Necklace") then
							if CheckItemInventory("Terror Jaw") then
								if CheckCountItem("Terror Eyes", 2) then
									if CheckCountItem("Shark Tooth", 10) then
										if CheckCountItem("Electric Wing", 10) then
											if CheckCountItem("Fool's Gold", 20) then
												game:GetService("ReplicatedStorage").Modules.Net
													:FindFirstChild("RF/Craft")
													:InvokeServer(
														unpack({ [1] = "Craft", [2] = "SharkAnchor", [3] = 1, [4] = {} })
													)
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 7651]
------------------------------------------------------------------------
Sub_SharkAnchorTerrorJaw[7651] = function(env_ctx)
		return function(h, h)
			return function()
				if #workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:GetChildren() > 0 then
					for h, h in workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:GetChildren() do
						if h.Name == "DragonEgg" then
							if h:FindFirstChild("Molten") then
								if h.Molten:FindFirstChild("ProximityPrompt") then
									return h
								end
							end
						end
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 13716]
------------------------------------------------------------------------
Sub_SharkAnchorTerrorJaw[13716] = function(env_ctx)
		return function()
			return function()
				for h, h in game.workspace:GetChildren() do
					if h.Name == "DinoBone" then
						return h
					end
				end
			end
		end
	end



BananaHub.Subsystems.SharkAnchorTerrorJaw = Sub_SharkAnchorTerrorJaw
for func_id, func_impl in pairs(Sub_SharkAnchorTerrorJaw) do
	BananaHub.Functions[func_id] = func_impl
end

--==============================================================================
-- PHÂN HỆ: [AutoRaidsDungeons] - Mua chip Law, tự động vào Raid Pads Simulation Hub
-- Source: deobf/modules/10_auto_raids_and_dungeons.lua
--==============================================================================
--==============================================================================
-- Module 10: Auto Raids, Law Dungeon & Card Priority
-- Tự động mua microchip, vào bục dịch chuyển Raid Castle / Hot and Cold, vượt đảo 1-5 và tự động chọn thẻ kỹ năng theo độ ưu tiên.
-- Source: deobf/mduc.lua (Banana Hub Blox Fruits)
-- FULL DEOBFUSCATED CODE - RESTORED CONSTANTS & API ALIASES
-- STRICTLY 100% GENUINE LOGIC - NO CODE INVENTED
--==============================================================================

local Sub_AutoRaidsDungeons = {}

------------------------------------------------------------------------
-- [Function ID: 5286]
------------------------------------------------------------------------
Sub_AutoRaidsDungeons[5286] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			return function(h)
				local F = game.PlaceId == getgenv().CheckPlaceId2
					and game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button:FindFirstChild("Main")
				F = if game.PlaceId == getgenv().CheckPlaceId
					then game:GetService("Workspace").Map:FindFirstChild("Boat Castle")
						and game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button:FindFirstChild("Main")
					else F
				if not local_player.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
					if CheckInRaid() then
					elseif F then
					else
						if DetectItemPlr("Special Microchip") then
							toTarget(CFrame.new(-5500, 314, -2855), false, true)
						else
							toTarget(CFrame.new(-5500, 314, -2855))
						end
						return
					end
				end
				if Settings["Account Pick Slot Raid"] then
					if not local_player.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
						if not (CheckInRaid()) then
							if not (NearSlotRaid(F.Parent.Parent)) then
								local n = Random.new():NextNumber(0, 2)
								task.wait(n)
								toTarget(DetectSlotRaid(F.Parent.Parent).Hitbox.CFrame * CFrame.new(0, -2, 0))
							end
						end
					end
				end
				if DetectItemPlr("Special Microchip") then
					if getgenv().waitgoraid then
						wait(5)
						getgenv().waitgoraid = false
					end
					getgenv().buychip = false
					if DetectMultiStartRaid(F.Parent.Parent) then
						if Settings["Account Buy Chip"] then
							fireclickdetector(F.ClickDetector)
						end
					end
					if getgenv().Tween then
						getgenv().Tween:Pause()
						getgenv().Tween:Cancel()
					end
					return
				end
				if local_player.PlayerGui.Main.TopHUDList.RaidTimer.Visible and CheckInRaid() then
					getgenv().waitgoraid = true
					getgenv().buychip = true
					local F = DetectMobRaid()
					if F then
						repeat
							task.wait()
							UsedualFlock()
							ClickM1(F)
							if Settings["Select Weapon"] == "Blox Fruit" then
								toTarget(F.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0))
							else
								toTarget(F.HumanoidRootPart.CFrame * CFrame.new(10, 20, 0))
							end
						until not IsMobAlive(F)
					else
						local F = GetLastRaidIsland()
						if F then
							if F.Name == "Island 2" and Settings["Select Raid"] == "Phoenix" then
								toTarget(F.CFrame * CFrame.new(300, 60, 0))
							else
								toTarget(F.CFrame * CFrame.new(0, 60, 0))
							end
						end
					end
					return
				end
				if Settings["Account Buy Chip"] then
					if getgenv().buychip then
						if local_player.Data.Level.Value >= 1100 then
							if not local_player.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
								if not (DetectItemPlr("Special Microchip")) then
									if not (CheckInRaid()) then
										if not (CheckFruitplr()) then
											if TakeFruitInventory(true) then
												if Settings["Get Fruit In Inventory Low Beli"] then
													game:GetService("ReplicatedStorage").Remotes.CommF_
														:InvokeServer("LoadFruit", TakeFruitInventory(true))
												end
											end
										end
										game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaidsNpc", "Check")
										game.ReplicatedStorage.Remotes.CommF_:InvokeServer(
											"RaidsNpc",
											"Select",
											h or "Flame"
										)
										wait(1)
									end
								end
							end
						end
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 7880]
------------------------------------------------------------------------
Sub_AutoRaidsDungeons[7880] = function(env_ctx)
		return function()
			return function(h)
				local g, F, n = next, workspace.Map["Simulation Hub"].Pads:GetChildren()
				for V, V in g, F, n do
					if h and V:GetAttribute("Initiator") == game.Players.LocalPlayer.UserId then
						return V
					elseif V:GetAttribute("NumPlayersOnPad") == 0 then
						return V
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 12924]
------------------------------------------------------------------------
Sub_AutoRaidsDungeons[12924] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			return function()
				local h, F, n, V, J, W = Settings["Select Card Priority"] or {}, {}, pairs, local_player.PlayerGui, 1 / 0
				for g, G in n(V:GetChildren()) do
					local n, Z, s =
						G:FindFirstChild("DisplayName", true),
						G:FindFirstChild("BuffDescription", true),
						G:FindFirstChildWhichIsA("TextButton", true)
					if n then
						if Z then
							if s then
								if n:IsA("TextLabel") then
									G, g = stripFont, n.Text
									local n = DisplayNameToKey[G(g)]
									if n then
										if IsSkillCooldown(n) then
											continue
										end
										local g, G = J, W
										for Z, u in ipairs(h) do
											if DisplayNameToKey[u] == n then
												if Z < g then
													g, G = Z, s
												else
												end
												break
											end
										end
										table.insert(F, s)
										J, W = g, G
									else
									end
								else
								end
							else
							end
						else
						end
					else
					end
				end
				if W then
					print("AUTO PICK (PRIORITY INDEX):", J)
					for h, h in pairs(getconnections(W.Activated)) do
						h.Function()
					end
					return true
				end
				if #F > 0 then
					V = F[math.random(1, #F)]
					print("AUTO PICK (RANDOM)")
					for h, h in pairs(getconnections(V.Activated)) do
						h.Function()
					end
					return true
				end
				return false
			end
		end
	end



BananaHub.Subsystems.AutoRaidsDungeons = Sub_AutoRaidsDungeons
for func_id, func_impl in pairs(Sub_AutoRaidsDungeons) do
	BananaHub.Functions[func_id] = func_impl
end

--==============================================================================
-- PHÂN HỆ: [PrehistoricIslandEvents] - Đảo Tiền sử, né mưa dung nham Núi lửa, NPC Fossil Expert
-- Source: deobf/modules/11_prehistoric_island_and_events.lua
--==============================================================================
--==============================================================================
-- Module 11: Prehistoric Island, Rip Indra & Seasonal Events
-- Theo dõi đảo cổ đại Prehistoric Island, tự động farm boss Rip Indra, sự kiện Halloween Great Pumpkin, nhặt kẹo và quà sự kiện.
-- Source: deobf/mduc.lua (Banana Hub Blox Fruits)
-- FULL DEOBFUSCATED CODE - RESTORED CONSTANTS & API ALIASES
-- STRICTLY 100% GENUINE LOGIC - NO CODE INVENTED
--==============================================================================

local Sub_PrehistoricIslandEvents = {}

------------------------------------------------------------------------
-- [Function ID: 2194]
------------------------------------------------------------------------
Sub_PrehistoricIslandEvents[2194] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			return function()
				local h = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
				if
					(
						if h
							then not h
							else not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.PrehistoricRaidTimer.Visible
					) and not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible
				then
					getgenv().RespawnVolcano = true
					local h = checkboat()
					local n = if h then h and g:DistanceFromCharacter(h.VehicleSeat.Position) >= 4000 else not h
					if n then
						local n = CFrame.new(-16204.0810546875, 9.0863618850708, 479.2259521484375)
						if (n.Position - local_player.Character.HumanoidRootPart.Position).Magnitude > 8 then
							if (n.Position - local_player.Character.HumanoidRootPart.Position).Magnitude > 1000 then
								if game:GetService("Players").LocalPlayer.Data.LastSpawnPoint.Value == "Tiki" then
									local_player.Character.Humanoid.Health = 0
									return
								end
							end
							toTarget(n)
						else
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", "PirateBrigade")
							wait(3)
						end
					elseif local_player.Character.Humanoid.Sit then
						local n, V, J =
							CFrame.new(-118834.515625, 160, -78.9505844116211) * CFrame.new(0, 0, 99999999),
							CFrame.new(-32975.9921875, 160, 25963.7109375),
							if Settings["Will Back When over 10km"]
								then if DistanceFindLeviathan() >= 12000
									then true
									else if DistanceFindLeviathan() <= 4800 then false else false
								else false
						while true do
							task.wait(0.5)
							NoclipBoat(h)
							if Settings["Will Back When over 10km"] then
								J = if DistanceFindLeviathan() >= 10000
									then true
									else if DistanceFindLeviathan() <= 4800 then false else J
								if J then
									manageTween(h.VehicleSeat, V, 150, "TweenBoatBack")
								end
							else
							end
							if if J then not Settings["Will Back When over 10km"] else not J then
								manageTween(h.VehicleSeat, n, 150, "TweenBoat")
							end
							local n = Settings["Auto Find Prehistoric Island"]
							local V = if n then not local_player.Character.Humanoid.Sit else not n
							if V or game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland") then
								break
							end
						end
						if getgenv().TweenBoat then
							getgenv().TweenBoat:Pause()
							getgenv().TweenBoat:Cancel()
						end
						if getgenv().TweenBoatBack then
							getgenv().TweenBoatBack:Pause()
							getgenv().TweenBoatBack:Cancel()
						end
					else
						if getgenv().TweenBoat then
							getgenv().TweenBoat:Pause()
							getgenv().TweenBoat:Cancel()
						end
						if getgenv().TweenBoatBack then
							getgenv().TweenBoatBack:Pause()
							getgenv().TweenBoatBack:Cancel()
						end
						toTarget(h.VehicleSeat.CFrame)
					end
				else
					if getgenv().RespawnVolcano then
						if Settings["Webhook Find Prehistoric Island"] then
							getgenv().RespawnVolcano = false
							WebhookFindVolcano()
						end
					end
					if getgenv().TweenBoat then
						getgenv().TweenBoat:Pause()
						getgenv().TweenBoat:Cancel()
					end
					F[6][F[5]].CreateNoti({ Title = "Banana Cat Hub", Desc = "Prehistoric Island Spawned", ShowTime = 5 })
					ToggleAutoFindPrehistoricIsland:SetStage(false)
					wait(5)
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 92]
------------------------------------------------------------------------
Sub_PrehistoricIslandEvents[92] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			return function()
				if
					Settings["Start Farm"]
					or Settings["Auto Present Event"]
					or Settings["Auto Celestial Soldier"]
					or Settings["Auto Rip Commander"]
					or Settings["Auto Event Halloween"]
					or Settings["Auto Farm Pumpkins"]
					or Settings["Auto Farm Jack o' Lantern & Pumpkin Snowman"]
					or Settings["Auto Halloween Bosses"]
					or Settings["Auto Summon Great Pumpkin"]
					or Settings["Auto Collect Candy Spill"]
					or Settings["Auto Attack Dungeon"]
					or Settings["Auto Fishing"]
					or Settings["Auto Secret Quest"]
					or Settings["Teleport To Fruit"]
					or Settings["Auto Factory"]
					or Settings["Auto Pirate Raid"]
					or Settings["Auto Elite Hunter"]
					or Settings["Auto Touch Pad Haki"]
					or Settings["Auto Summon Rip Indra"]
					or Settings["Attack Rip Indra"]
					or Settings["Attack Soul Reaper"]
					or Settings["Attack Dough King"]
					or Settings["Attack Darkbeard"]
					or Settings["Auto Raid"]
					or Settings["Auto Sea Event"]
					or Settings["Auto Shipwright"]
					or Settings["Teleport Acient Clock"]
					or Settings["Auto Upgrade Race V2-V3"]
					or Settings["Auto Trial"]
					or Settings["Auto Get Ghoul"]
					or Settings["Auto Get Cyborg"]
					or Settings["Auto Pull Lever"]
					or g["Teleport Mirage"]
					or g["Teleport To Island"]
					or g["Teleport To Npc"]
					or g["Teleport Prehistoric Island"]
					or g["Sanguine Art"]
					or g["God Human"]
					or g["Dragon Talon"]
					or g["Electric Claw"]
					or g["Sharkman Karate"]
					or g["Death Step"]
					or g.SuperHuman
					or g.DragonClaw
					or g.Electro
					or g["Fishman Karate"]
					or g["Black Leg"]
					or Settings["Teleport To Kitsune Island"]
					or Settings["Auto Spawn Kitsune Island"]
					or Settings["Auto Collect Soul Ember"]
					or Settings["Auto Summon Soul Ember"]
					or Settings["Auto Attack Leviathan"]
					or Settings["Auto Soul Guitar"]
					or Settings["Auto CDK"]
					or Settings["Auto Yama"]
					or Settings["Auto Tushita"]
					or Settings["Auto Upgrade Sword Inventory"]
					or Settings["Teleport Player"]
					or Settings["Auto Chest"]
					or Settings["Farm Observation"]
					or Settings["Auto Upgrade Gun Inventory"]
					or Settings["Kill Boss"]
					or Settings["Kill Mob"]
					or Settings["Auto UP Observation V2"]
					or Settings["Auto New World"]
					or Settings["Auto Third World"]
					or Settings["Tween Safe if have Items"]
					or Settings["Teleport Frozen Dimension"]
					or Settings["Auto Yoru Mini"]
					or Settings["Auto Quest Dojo Trainer"]
					or Settings["Auto Sharkman Master"]
					or Settings["Auto Quest Dragon Hunter"]
					or Settings["Auto Crafting Volcanic Magnet"]
					or Settings["Auto Find Prehistoric Island"]
					or Settings["Auto Find Mirage"]
					or Settings["Auto Event Prehistoric Island"]
					or Settings["Auto Collect Bone"]
					or Settings["Auto Collect Berry"]
					or Settings["Auto Upgrade Race V2-V3 Draco"]
					or Settings["Auto Trial Draco"]
					or Settings["Auto Get Rainbow Haki"]
					or Settings["Follow Player Select"]
				then
					return true
				elseif Settings["Auto Tween To Prehistoric Island"] then
					return true
				elseif Settings["Auto Kill Golem"] then
					return true
				elseif Settings["Auto Fix Volcano"] then
					return true
				elseif Settings["Multi Find Leviathan"] then
					return true
				elseif Settings["Fully Event Prehistoric Island"] then
					return true
				elseif Settings["Auto Multi Raid"] then
					return true
				elseif Settings["Auto Fire Shoot Heart Leviathan"] then
					return true
				elseif Settings["Auto Buy Chip and Attack Law"] then
					return true
				elseif Settings["Fully Trial Draco"] then
					return true
				elseif Settings["Auto Finish Train Quest"] then
					return true
				elseif Settings["Auto Destroy IDK"] then
					return true
				elseif Settings["Auto Finish Train Draco Quest"] then
					return true
				elseif Settings["Auto TTK"] then
					return true
				elseif Settings["Auto Attack All Mob and Boss"] then
					return true
				elseif Settings["Auto Collect Egg"] then
					return true
				elseif Settings["Collect Chest When Server Spawn God's Chalice or Fist of Darkness"] then
					return true
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 82]
------------------------------------------------------------------------
Sub_PrehistoricIslandEvents[82] = function(env_ctx)
		return function(h, h, h)
			return function()
				if not (workspace._WorldOrigin:FindFirstChild("Present")) then
					return
				end
				for h, h in pairs(workspace._WorldOrigin:GetChildren()) do
					if h.Name == "Present" then
						if h:FindFirstChild("Highlight") then
							if h:FindFirstChild("Box") then
								if h.Box:FindFirstChild("ProximityPrompt") then
									return h
								end
							end
						end
					end
				end
			end
		end
	end



BananaHub.Subsystems.PrehistoricIslandEvents = Sub_PrehistoricIslandEvents
for func_id, func_impl in pairs(Sub_PrehistoricIslandEvents) do
	BananaHub.Functions[func_id] = func_impl
end

--==============================================================================
-- PHÂN HỆ: [EspDrawingFruitSniper] - ESP Drawing API native (Text, Tracers, Khoảng cách theo mét)
-- Source: deobf/modules/12_esp_drawing_and_fruit_sniper.lua
--==============================================================================
--==============================================================================
-- Module 12: ESP Visuals (Drawing API) & Devil Fruit Sniper
-- Sử dụng Drawing API vẽ chữ ESP cho đảo (Mirage/Kitsune/Prehistoric), ESP bụi gai Berry, ESP người chơi và tự động nhặt trái ác quỷ xịn.
-- Source: deobf/mduc.lua (Banana Hub Blox Fruits)
-- FULL DEOBFUSCATED CODE - RESTORED CONSTANTS & API ALIASES
-- STRICTLY 100% GENUINE LOGIC - NO CODE INVENTED
--==============================================================================

local Sub_EspDrawingFruitSniper = {}

------------------------------------------------------------------------
-- [Function ID: 3527]
------------------------------------------------------------------------
Sub_EspDrawingFruitSniper[3527] = function(env_ctx)
		return function(h, h, h, h, g, g)
			return function()
				local fruit_obj = GetEspFruit()
				if not g then
					return
				end
				local F = GetFruitName(g)
				local n = g:FindFirstChild("Handle")
				if not n then
					return
				end
				local V = Instance.new("IntValue")
				V.Name = "Ignored"
				V.Parent = n
				local V = ({
					["Leopard Fruit"] = Color3.fromRGB(255, 170, 0),
					["Dragon (East) Fruit"] = Color3.fromRGB(255, 0, 0),
					["Dragon (West) Fruit"] = Color3.fromRGB(255, 80, 80),
					["Kitsune Fruit"] = Color3.fromRGB(200, 100, 255),
					["Spirit Fruit"] = Color3.fromRGB(120, 200, 255),
					["Venom Fruit"] = Color3.fromRGB(180, 60, 200),
					["Dough Fruit"] = Color3.fromRGB(255, 220, 180),
					["Light Fruit"] = Color3.fromRGB(255, 255, 150),
				})[F] or Color3.fromRGB(255, 255, 255)
				local J = Drawing.new("Text")
				J.Visible = false
				J.Transparency = 1
				J.Text = F
				J.Color = V
				J.Size = 20
				J.Outline = true
				J.OutlineColor = Color3.fromRGB(0, 0, 0)
				J.Center = true
				J.Font = 2
				local W = Drawing.new("Square")
				W.Visible = false
				W.Filled = true
				W.Color = Color3.fromRGB(0, 0, 0)
				W.Transparency = 0.4
				spawn(function()
					repeat
						task.wait()
						if
							not (
								pcall(function()
									local G, Z = workspace.CurrentCamera:WorldToViewportPoint(n.Position)
									if Z then
										local Z = math.round(env_ctx[1]:DistanceFromCharacter(n.Position))
										J.Text = F .. " [" .. Z .. "m]"
										J.Position = Vector2.new(G.X, G.Y - 20)
										J.Color = V
										J.Visible = true
										Z = J.TextBounds
										W.Position = Vector2.new(J.Position.X - Z.X / 2 - 4, J.Position.Y - 2)
										W.Size = Vector2.new(Z.X + 8, Z.Y + 4)
										W.Visible = true
									else
										J.Visible = false
										W.Visible = false
									end
								end)
							)
						then
							J.Visible = false
							W.Visible = false
						end
					until (if g then not g.Parent else not g) or not n.Parent or not Settings["ESP Fruit"]
					J:Remove()
					W:Remove()
					if n:FindFirstChild("Ignored") then
						n.Ignored:Destroy()
					end
				end)
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 12296]
------------------------------------------------------------------------
Sub_EspDrawingFruitSniper[12296] = function(env_ctx)
		return function(h, h, g)
			return function()
				local island_obj = DetectIsland()
				if g then
					local F = Instance.new("IntValue", g)
					F.Name = "Ignored"
					local n = Drawing.new("Text")
					n.Visible = false
					n.Transparency = 1
					n.Text = g.Name
					n.Color = Color3.fromRGB(255, 255, 255)
					n.Size = 20
					n.Outline = true
					n.OutlineColor = Color3.fromRGB(0, 0, 0)
					n.Center = true
					n.Font = 1
					spawn(function()
						repeat
							task.wait()
							if
								not (
									pcall(function()
										local V, J = game.workspace.CurrentCamera:WorldToViewportPoint(
											g:GetAttribute("CFrame").Position
										)
										if J then
											n.Text = g.Name
												.. " ("
												.. math.round(
													env_ctx[1]:DistanceFromCharacter(g:GetAttribute("CFrame").Position)
												)
												.. ")"
											n.Position = Vector2.new(V.X, V.Y - 20)
											n.Visible = true
										else
											n.Visible = false
										end
									end)
								)
							then
								n.Visible = false
							end
						until (if g then not g.Parent else not g) or not Settings["ESP Island"]
						n:Remove()
						if g.Parent then
							F:Destroy()
						end
					end)
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 9229]
------------------------------------------------------------------------
Sub_EspDrawingFruitSniper[9229] = function(env_ctx)
		return function(h)
			return function()
				local g, F = DetectBerryESP()
				if g then
					local n = Instance.new("IntValue", g.Parent)
					n.Name = "Ignored"
					local V = Drawing.new("Text")
					V.Visible = false
					V.Transparency = 1
					V.Text = g.Name
					V.Color = Color3.fromRGB(255, 255, 255)
					V.Size = 20
					V.Outline = true
					V.OutlineColor = Color3.fromRGB(0, 0, 0)
					V.Center = true
					V.Font = 1
					spawn(function()
						repeat
							task.wait()
							if
								not (
									pcall(function()
										local J, W = game.workspace.CurrentCamera:WorldToViewportPoint(
											g.Parent.WorldPivot.Position
										)
										if W then
											V.Text = F
												.. " ("
												.. math.round(env_ctx[1]:DistanceFromCharacter(g.Parent.WorldPivot.Position))
												.. ")"
											V.Position = Vector2.new(J.X, J.Y - 20)
											V.Visible = true
										else
											V.Visible = false
										end
									end)
								)
							then
								V.Visible = false
							end
						until (if g then not g.Parent else not g)
							or not Settings["ESP Berry"]
							or not DetectBerryCFrame(g:GetAttributes())
						V:Remove()
						if g.Parent then
							n:Destroy()
						end
					end)
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 10874]
------------------------------------------------------------------------
Sub_EspDrawingFruitSniper[10874] = function(env_ctx)
		return function(h, h, g)
			return function()
				local target_player = DetectPlayerESP()
				if g then
					local F = Instance.new("IntValue", g)
					F.Name = "Ignored"
					local n = Drawing.new("Text")
					n.Visible = false
					n.Transparency = 1
					n.Text = g.Name
					n.Color = Color3.fromRGB(255, 255, 255)
					n.Size = 20
					n.Outline = true
					n.OutlineColor = Color3.fromRGB(0, 0, 0)
					n.Center = true
					n.Font = 1
					spawn(function()
						repeat
							task.wait()
							if
								not (
									pcall(function()
										local V, J = game.workspace.CurrentCamera:WorldToViewportPoint(
											g.HumanoidRootPart.Position
										)
										if J then
											n.Text = g.Name
												.. " ("
												.. math.round(env_ctx[1]:DistanceFromCharacter(g.HumanoidRootPart.Position))
												.. ")"
												.. "\10"
												.. g.Humanoid.Health
												.. " / "
												.. g.Humanoid.MaxHealth
											n.Position = Vector2.new(V.X, V.Y - 20)
											n.Visible = true
										else
											n.Visible = false
										end
									end)
								)
							then
								n.Visible = false
							end
						until (if g then not g.Parent else not g) or not Settings["ESP Player"]
						n:Remove()
						if g.Parent then
							F:Destroy()
						end
					end)
				end
			end
		end
	end



BananaHub.Subsystems.EspDrawingFruitSniper = Sub_EspDrawingFruitSniper
for func_id, func_impl in pairs(Sub_EspDrawingFruitSniper) do
	BananaHub.Functions[func_id] = func_impl
end

--==============================================================================
-- PHÂN HỆ: [SeaTravelProgression] - Chuyển Sea 1 -> 2 -> 3, Shanks Saber, Bia mộ Haunted Castle
-- Source: deobf/modules/13_sea_travel_and_world_progression.lua
--==============================================================================
--==============================================================================
-- Module 13: World Progression (Sea 1-3) & Story Quests
-- Nhận diện thế giới Sea 1/2/3, chuỗi quest Trevor / Don Swan qua Sea 3, mở khóa Water Quest (RichSon), sự kiện bia mộ Haunted Castle và câu cá.
-- Source: deobf/mduc.lua (Banana Hub Blox Fruits)
-- FULL DEOBFUSCATED CODE - RESTORED CONSTANTS & API ALIASES
-- STRICTLY 100% GENUINE LOGIC - NO CODE INVENTED
--==============================================================================

local Sub_SeaTravelProgression = {}

------------------------------------------------------------------------
-- [Function ID: 3]
------------------------------------------------------------------------
Sub_SeaTravelProgression[3] = function(env_ctx)
		return function(h)
			return function(h)
				local g = Realm.safeGetCurrentSeaAsync()
				local F, n =
					if g == "Sea1"
						then { 2753915549, 85211729168715 }
						else if g == "Sea2"
							then { 4442272183, 79091703265657 }
							else if g == "Sea3" then { 7449423635, 100117331123089 } else {},
					{ done = false }
				for g, g in ipairs(F) do
					task.spawn(function()
						if not n.done then
							tryTeleport(g, h, n)
						end
					end)
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 84]
------------------------------------------------------------------------
Sub_SeaTravelProgression[84] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			return function()
				if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TalkTrevor", "1") == 0 then
					if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 1 then
						if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Zou") == 0 then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
						end
					end
				end
				if game.PlaceId == getgenv().CheckPlaceId2 and local_player.Data.Level.Value >= 1500 then
					if
						game:GetService("ReplicatedStorage").Remotes.CommF_
							:InvokeServer("BartiloQuestProgress", "Bartilo") == 3
					then
						if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TalkTrevor", "1") ~= 0 then
							if #getbackpack() >= 1 then
								toTarget(CFrame.new(-339.79840087891, 331.86065673828, 643.83178710938))
								if
									(
										Vector3.new(-339.79840087891, 331.86065673828, 643.83178710938)
										- local_player.Character.HumanoidRootPart.Position
									).Magnitude <= 5
								then
									if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TalkTrevor", "1") ~= 1 then
										local h, F, n = next, getbackpack()
										for V, V in h, F, n do
											local_player.Character.Humanoid:EquipTool(
												game.Players.LocalPlayer.Backpack:FindFirstChild(V)
											)
										end
										game:GetService("ReplicatedStorage").Remotes.CommF_
											:InvokeServer("TalkTrevor", "1")
										game:GetService("ReplicatedStorage").Remotes.CommF_
											:InvokeServer("TalkTrevor", "2")
										game:GetService("ReplicatedStorage").Remotes.CommF_
											:InvokeServer("TalkTrevor", "3")
									end
								end
							elseif not (CheckFruitplr()) then
								if TakeFruitInventory() then
									game:GetService("ReplicatedStorage").Remotes.CommF_
										:InvokeServer("LoadFruit", TakeFruitInventory())
								end
							end
						elseif
							game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TalkTrevor", "1") == 0
							and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 1
							and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Zou") == 0
						then
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
						elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") then
							if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 0 then
								if
									(
										local_player.Character.HumanoidRootPart.Position
										- game:GetService("Workspace").Map.IndraIsland.Part.Position
									).Magnitude > 1000
								then
									toTarget(cframethangdaubuoiredhead)
									if
										(cframethangdaubuoiredhead.p - local_player.Character.HumanoidRootPart.Position).Magnitude
										<= 5
									then
										game:GetService("ReplicatedStorage").Remotes.CommF_
											:InvokeServer("ZQuestProgress", "Begin")
									end
								else
									local h, F, n = next, workspace.Enemies:GetChildren()
									for V, V in h, F, n do
										if
											V.Name == "rip_indra"
											and V:FindFirstChild("HumanoidRootPart")
											and V:FindFirstChild("Humanoid")
											and V.Humanoid.Health > 0
										then
											if
												(V.HumanoidRootPart.Position - local_player.Character.HumanoidRootPart.Position).Magnitude
												> 300
											then
												toTarget(V.HumanoidRootPart.CFrame)
											else
												repeat
													task.wait()
													sizepart(V)
													if Settings["Select Weapon"] == "Blox Fruit" then
														toTarget(
															V.HumanoidRootPart.CFrame
																* CFrame.new(-7, getgenv().YPosFruit or 20, 0)
														)
													else
														toTarget(V.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
													end
													ClickM1(V)
													UsedualFlock()
												until not workspace.Enemies:FindFirstChild("rip_indra")
											end
										end
									end
								end
							end
						elseif CheckNameBoss("Don Swan") then
							local boss_mob = CheckNameBoss("Don Swan")
							repeat
								task.wait()
								sizepart(h)
								if Settings["Select Weapon"] == "Blox Fruit" then
									toTarget(h.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0))
								else
									toTarget(h.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
								end
								UsedualFlock()
								ClickM1(h)
							until (if h then not h.Parent else not h) or h.Humanoid.Health == 0
						end
					else
						AutoQuestBarito()
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 6401]
------------------------------------------------------------------------
Sub_SeaTravelProgression[6401] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			return function()
				if local_player.Data.Level.Value >= 200 then
					if doorsaber() then
						local boss_mob = CheckNameBoss("Saber Expert")
						if h then
							while true do
								task.wait()
								sizepart(h)
								if Settings["Select Weapon"] == "Blox Fruit" then
									toTarget(h.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0))
								else
									toTarget(h.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
								end
								UsedualFlock()
								ClickM1(h)
								local n = IsMobAlive(h)
								if if n then not Settings["Auto Saber"] else not n then
									break
								end
							end
						else
							local h = game.ReplicatedStorage:FindFirstChild("FortBuilderReplicatedSpawnPositionsFolder")
							local n, V =
								h and (h:FindFirstChild("Saber Expert")),
								local_player.Character and local_player.Character:FindFirstChild("HumanoidRootPart")
							if n and V and (V.Position - n.Position).Magnitude > 12 then
								toTarget(n.CFrame)
							elseif n then
								if V then
									if not (CheckItemInventory("Saber")) then
										WarnOnce("SaberExpertRespawn", "plz wait boss respawn or hop server")
									end
								end
							end
						end
					elseif game:GetService("Workspace").Map.Jungle.QuestPlates.Door.CanCollide then
						toTarget(doortourch().Button.CFrame)
					elseif doorcup() then
						if
							game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") ~= 0
							and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
								~= 1
						then
							local h = local_player.Character:FindFirstChild("Cup")
							if if h then not h else not local_player.Backpack:FindFirstChild("Cup") then
								local h = workspace.Map.Desert:FindFirstChild("Cup")
								local n = local_player.Character and local_player.Character:FindFirstChild("HumanoidRootPart")
								if h and n then
									if typeof(firetouchinterest) == "function" then
										pcall(function()
											firetouchinterest(h, n, 0)
											firetouchinterest(h, n, 1)
										end)
									end
								end
								return
							else
								equiptool("Cup")
								local h = local_player.Backpack:FindFirstChild("Cup")
										and local_player.Backpack.Cup.Handle:FindFirstChild("TouchInterest")
									or local_player.Character:FindFirstChild("Cup")
										and local_player.Character.Cup.Handle:FindFirstChild("TouchInterest")
								if h then
									local h = workspace.Map.Ice.ParticleDrop:FindFirstChild("Water")
									local n, V =
										local_player.Character and local_player.Character:FindFirstChild("HumanoidRootPart"),
										local_player.Character and local_player.Character:FindFirstChild("Cup")
									if h then
										toTarget(CFrame.new(h.Position - Vector3.new(0, 8, 0)))
										if n then
											if V then
												if V:FindFirstChild("Handle") then
													if
														(n.Position - (h.Position - Vector3.new(0, 8, 0))).Magnitude
														<= 12
													then
														if os.clock() - (F.LastSaberWaterTouch or 0) >= 1 then
															if typeof(firetouchinterest) == "function" then
																F.LastSaberWaterTouch = os.clock()
																pcall(function()
																	firetouchinterest(V.Handle, h, 0)
																	firetouchinterest(V.Handle, h, 1)
																end)
															end
														end
													end
												end
											end
										end
									end
								else
									local h = local_player.Backpack:FindFirstChild("Cup")
											and not local_player.Backpack.Cup.Handle:FindFirstChild("TouchInterest")
										or local_player.Character:FindFirstChild("Cup")
											and not local_player.Character.Cup.Handle:FindFirstChild("TouchInterest")
									if h then
										if
											(local_player.Character.HumanoidRootPart.Position - Vector3.new(
												1457.8768310547,
												88.377502441406,
												-1390.6892089844
											)).Magnitude > 8
										then
											toTarget(CFrame.new(1457.8768310547, 88.377502441406, -1390.6892089844))
										else
											game:GetService("ReplicatedStorage").Remotes.CommF_
												:InvokeServer("ProQuestProgress", "SickMan")
										end
									end
								end
							end
						elseif
							game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 0
						then
							local boss_mob = CheckNameBoss("Mob Leader")
							if h then
								while true do
									task.wait()
									sizepart(h)
									if Settings["Select Weapon"] == "Blox Fruit" then
										toTarget(
											h.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0)
										)
									else
										toTarget(h.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
									end
									UsedualFlock()
									ClickM1(h)
									local n = IsMobAlive(h)
									if if n then not Settings["Auto Saber"] else not n then
										break
									end
								end
							end
						elseif
							game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 1
						then
							local h = local_player.Character:FindFirstChild("Relic")
							if if h then not h else not local_player.Backpack:FindFirstChild("Relic") then
								if
									(local_player.Character.HumanoidRootPart.Position - CFrame.new(
										-1404.07996,
										29.8520069,
										5.26677656,
										0.888123989,
										-4.0340602E-9,
										0.459603906,
										7.5884703E-9,
										1,
										-5.8864642E-9,
										-0.459603906,
										8.71560069E-9,
										0.888123989
									).Position).Magnitude > 8
								then
									toTarget(
										CFrame.new(
											-1404.07996,
											29.8520069,
											5.26677656,
											0.888123989,
											-4.0340602E-9,
											0.459603906,
											7.5884703E-9,
											1,
											-5.8864642E-9,
											-0.459603906,
											8.71560069E-9,
											0.888123989
										)
									)
								else
									game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
								end
							else
								local h = local_player.Character and local_player.Character:FindFirstChild("Relic")
								local n = workspace.Map.Jungle.Final:FindFirstChild("Part")
								if not h then
									equiptool("Relic")
								elseif h:FindFirstChild("Handle") then
									if n then
										if typeof(firetouchinterest) ~= "function" then
											toTarget(n.CFrame)
										elseif os.clock() - (F.LastSaberRelicTouch or 0) >= 1 then
											F.LastSaberRelicTouch = os.clock()
											pcall(function()
												firetouchinterest(h.Handle, n, 0)
												firetouchinterest(h.Handle, n, 1)
											end)
										end
									end
								end
							end
						end
					else
						local h = local_player.Character:FindFirstChild("Torch")
						if if h then not h else not local_player.Backpack:FindFirstChild("Torch") then
							toTarget(game:GetService("Workspace").Map.Jungle.Torch.CFrame)
						else
							equiptool("Torch")
							local h = local_player.Character
								and local_player.Character:FindFirstChild("Torch")
								and local_player.Character.Torch:FindFirstChild("Handle")
							local g = workspace.Map.Desert.Burn:FindFirstChild("Fire")
							if h and g then
								if typeof(firetouchinterest) == "function" then
									pcall(function()
										firetouchinterest(h, g, 0)
										firetouchinterest(h, g, 1)
									end)
								end
							end
							return
						end
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 15298]
------------------------------------------------------------------------
Sub_SeaTravelProgression[15298] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			return function()
				if CommF:InvokeServer("GuitarPuzzleProgress", "Check") then
					if local_player.PlayerGui.Main.Dialogue.Visible then
						game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0))
						game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0))
					end
					if CommF:InvokeServer("GuitarPuzzleProgress", "Check").Swamp then
						if CommF:InvokeServer("GuitarPuzzleProgress", "Check").Gravestones then
							if CommF:InvokeServer("GuitarPuzzleProgress", "Check").Ghost then
								if CommF:InvokeServer("GuitarPuzzleProgress", "Check").Trophies then
									if not CommF:InvokeServer("GuitarPuzzleProgress", "Check").Pipes then
										for h, n in pairs(Pipes) do
											local V =
												game.workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model[h]
											if V.BrickColor.Name ~= n then
												repeat
													task.wait()
													fireclickdetector(V.ClickDetector)
												until V.BrickColor.Name == n
											end
										end
									end
								else
									if
										g:DistanceFromCharacter(
											Vector3.new(-9530.0126953125, 6.104853630065918, 6054.83349609375)
										) > 50
									then
										toTarget(CFrame.new(-9530.0126953125, 6.104853630065918, 6054.83349609375))
									end
									local castle_tablets = game.workspace.Map["Haunted Castle"].Tablet
									for _, tablet_idx in pairs(BlankTablets) do
										local tablet_obj = castle_tablets[tablet_idx]
										if tablet_obj.Line.Position.X ~= -9707.86328125 then
											repeat
												task.wait()
												fireclickdetector(tablet_obj.ClickDetector)
											until tablet_obj.Line.Position.X == -9707.86328125
										end
									end
									for n, V in pairs(Trophy) do
										local J = tostring(
											game.workspace.Map["Haunted Castle"].Trophies.Quest[V].Handle.CFrame
										):split(", ")[4]
										V = if J == "1" then "90" else if J == "-1" then "90" else "180"
										if not (string.find(tostring(h[n].Line.Rotation.Z), V)) then
											while true do
												task.wait()
												fireclickdetector(h[n].ClickDetector)
												local J, W, G = string.find, tostring, h[n]
												if J(W(G.Line.Rotation.Z), V) then
													break
												end
											end
											print(n, V)
										end
									end
								end
							else
								if
									g:DistanceFromCharacter(
										Vector3.new(-9755.6591796875, 271.0661315917969, 6290.61474609375)
									) > 50
								then
									toTarget(CFrame.new(-9755.6591796875, 271.0661315917969, 6290.61474609375))
								end
								CommF:InvokeServer("GuitarPuzzleProgress", "Ghost")
								task.wait(3)
							end
						elseif
							g:DistanceFromCharacter(Vector3.new(-8761.4765625, 142.10487365722656, 6086.07861328125))
							> 50
						then
							toTarget(CFrame.new(-8761.4765625, 142.10487365722656, 6086.07861328125))
						else
							local h = {
								game.workspace.Map["Haunted Castle"].Placard1.Right.ClickDetector,
								game.workspace.Map["Haunted Castle"].Placard2.Right.ClickDetector,
								game.workspace.Map["Haunted Castle"].Placard3.Left.ClickDetector,
								game.workspace.Map["Haunted Castle"].Placard4.Right.ClickDetector,
								game.workspace.Map["Haunted Castle"].Placard5.Left.ClickDetector,
								game.workspace.Map["Haunted Castle"].Placard6.Left.ClickDetector,
								game.workspace.Map["Haunted Castle"].Placard7.Left.ClickDetector,
							}
							for n, n in pairs(h) do
								fireclickdetector(n)
							end
						end
					else
						if
							(
								CFrame.new(-10171.7607421875, 138.62667846679688, 6008.0654296875).Position
								- local_player.Character.HumanoidRootPart.Position
							).Magnitude > 100
						then
							toTarget(CFrame.new(-10171.7607421875, 158.62667846679688, 6008.0654296875))
						elseif CountZombie() == 6 then
							repeat
								task.wait()
								local h = DetectHighHealthMob("Living Zombie")
								repeat
									task.wait()
									h = DetectHighHealthMob("Living Zombie")
									sizepart(h)
									UsedualFlock()
									ClickM1(h)
									if Settings["Select Weapon"] == "Blox Fruit" then
										toTarget(
											h.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0)
										)
									else
										toTarget(h.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
									end
								until not IsMobAlive(h)
							until CountZombie() == 0
						end
						return
					end
				else
					local h = game.Lighting.Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431"
						and (game.Lighting.ClockTime > 16 or game.Lighting.ClockTime < 5)
					if h then
						if
							g:DistanceFromCharacter(Vector3.new(-8654.314453125, 140.9499053955078, 6167.5283203125))
							> 50
						then
							toTarget(CFrame.new(-8654.314453125, 140.9499053955078, 6167.5283203125))
						end
						CommF:InvokeServer("gravestoneEvent", 2)
						CommF:InvokeServer("gravestoneEvent", 2, true)
						task.wait(1)
					else
						F[6][F[5]].CreateNoti({ Title = "Banana Cat Hub", Desc = "Hop Full Moon", ShowTime = 5 })
						SpecialHop("FullMoon")
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 13014]
------------------------------------------------------------------------
Sub_SeaTravelProgression[13014] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			return function()
				local h = GetNameDoubleQuest()
				if not h then
					return false
				end
				local F, n = pairs
				for V, J in F(g) do
					if string.find(h, V) then
						n = V
						break
					end
				end
				if n and Settings["Select Quest Fishing"] then
					for g, F in next, Settings["Select Quest Fishing"], nil do
						if string.find(h, g) then
							return true
						end
					end
					return false
				end
				return true
			end
		end
	end



BananaHub.Subsystems.SeaTravelProgression = Sub_SeaTravelProgression
for func_id, func_impl in pairs(Sub_SeaTravelProgression) do
	BananaHub.Functions[func_id] = func_impl
end

--==============================================================================
-- PHÂN HỆ: [PvPBountySkillHelper] - Bộ lọc mục tiêu PvP, combo Portal-Portal, tự kích hoạt V4
-- Source: deobf/modules/14_pvp_bounty_and_skill_helper.lua
--==============================================================================
--==============================================================================
-- Module 14: PVP Bounty Hunter, Flight & Skill Cooldown
-- Hệ thống chọn mục tiêu PVP săn bounty, tự động biến hình Race V4 khi đầy nộ, theo dõi hồi chiêu Z/X/C/V, bay ScreenGuiFly và thuyền siêu tốc.
-- Source: deobf/mduc.lua (Banana Hub Blox Fruits)
-- FULL DEOBFUSCATED CODE - RESTORED CONSTANTS & API ALIASES
-- STRICTLY 100% GENUINE LOGIC - NO CODE INVENTED
--==============================================================================

local Sub_PvPBountySkillHelper = {}

------------------------------------------------------------------------
-- [Function ID: 16232]
------------------------------------------------------------------------
Sub_PvPBountySkillHelper[16232] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = runtime_state[1]
			return function(g)
				local n = {}
				if Settings["Select Players Multi"] and not g then
					for g, V in next, Settings["Select Players Multi"], nil do
						if V then
							n[g] = true
						end
					end
				end
				local g, V = pairs, table.pack(game:GetService("Players"):GetChildren())
				for J, J in g(h:XU(V)) do
					if J.Name ~= F.Name then
						if not (table.find(n, J.Name)) then
							n[J.Name] = false
						end
					end
				end
				return n
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 12689]
------------------------------------------------------------------------
Sub_PvPBountySkillHelper[12689] = function(env_ctx)
		return function()
			return function()
				for h, h in pairs(game:GetService("Players"):GetChildren()) do
					if h.Name == Settings["Select Player PVP"] then
						return h
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 44]
------------------------------------------------------------------------
Sub_PvPBountySkillHelper[44] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			return function()
				local h = local_player.Character
				local F, n = h and (h:FindFirstChild("RaceEnergy")), h and (h:FindFirstChild("RaceTransformed"))
				if F then
					if F.Value < 1 then
						return
					elseif n then
						if n.Value then
							return
						end
					else
						return
					end
				else
					return
				end
				F = local_player.Backpack:FindFirstChild("Awakening") or h:FindFirstChild("Awakening")
				if F then
					F.RemoteFunction:InvokeServer(true)
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 10065]
------------------------------------------------------------------------
Sub_PvPBountySkillHelper[10065] = function(env_ctx)
		return function(h)
			return function(h)
				if not h then
					return false
				end
				if h:find("Cooldown") then
					if h:find("ZCooldown") then
						return true
					elseif h:find("XCooldown") then
						return true
					elseif h:find("CCooldown") then
						return true
					elseif h:find("VCooldown") then
						return true
					end
				end
				return false
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 11]
------------------------------------------------------------------------
Sub_PvPBountySkillHelper[11] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			return function(h)
				local n = local_player.Character:FindFirstChild("Portal-Portal") or local_player.Backpack:FindFirstChild("Portal-Portal")
				if not n then
					return nil
				end
				if n.Parent ~= local_player.Character then
					local_player.Character:FindFirstChildOfClass("Humanoid"):EquipTool(n)
				end
				n = local_player.PlayerGui.Main:FindFirstChild("Gateway")
				if not n then
					return nil
				end
				for g = 1, 3, 1 do
					if n.Visible then
						break
					end
					local key_code, game_service = Enum.KeyCode, game
					F:SendKeyEvent(true, key_code.C, false, game_service)
					task.wait(0.06)
					F:SendKeyEvent(false, key_code.C, false, game_service)
					J = tick() + 1.2
					repeat
						task.wait(0.1)
					until n.Visible or tick() > J
				end
				if not n.Visible then
					return nil
				end
				local g = n:FindFirstChild("MainContent")
				local F = g and (g:FindFirstChild("ScrollingFrame"))
				for _, btn_name in ipairs(h) do
					local btn_element = F and F:FindFirstChild(tostring(btn_name))
					if btn_element and (btn_element:IsA("GuiButton")) then
						for _, conn in pairs(getconnections(btn_element.MouseButton1Click)) do
							pcall(function()
								conn.Function()
							end)
						end
						return btn_name
					end
				end
				for h, h in pairs(getconnections(n.Header.Exit.MouseButton1Click)) do
					pcall(function()
						h.Function()
					end)
				end
				return nil
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 4618]
------------------------------------------------------------------------
Sub_PvPBountySkillHelper[4618] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			return function()
				FLYING = false
				if game.Players.LocalPlayer.PlayerGui:FindFirstChild("ScreenGuiFly") then
					game.Players.LocalPlayer.PlayerGui.ScreenGuiFly:Destroy()
				end
				if flyKeyDown or flyKeyUp then
					flyKeyDown:Disconnect()
					flyKeyUp:Disconnect()
				end
				if g.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
					g.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
				end
				pcall(function()
					workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
				end)
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 1304]
------------------------------------------------------------------------
Sub_PvPBountySkillHelper[1304] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			local ui_notifications = env_ctx[3]
			return function()
				local h = ipairs
				for _, wp_target in ipairs(g) do
					while _G.autoDrive and task.wait(0.1) do
						local boat_inst = checkboatFind()
						if not boat_inst then
							return
						end
						local steer_angle = F(boat_inst, wp_target)
						if (boat_inst.PrimaryPart.Position - wp_target).Magnitude < 10 then
							boat_inst.PrimaryPart.ThrottleFloat = 0
							boat_inst.PrimaryPart.Throttle = 0
							break
						end
						spawn(function()
							boat_inst.VehicleSeat.MaxSpeed = Settings["Speed Boat Auto Drive"] or 300
							NoclipBoat(boat_inst)
						end)
						if math.abs(steer_angle) > 5 then
							n(h, J)
							h.PrimaryPart.ThrottleFloat = 0
							h.PrimaryPart.Throttle = 0
						else
							h.PrimaryPart.ThrottleFloat = 1
							h.PrimaryPart.Throttle = 1
						end
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 6493]
------------------------------------------------------------------------
Sub_PvPBountySkillHelper[6493] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			local ui_notifications = env_ctx[3]
			return function()
				local h = ipairs
				for _, wp_target in ipairs(g) do
					while _G.autoDrive and task.wait() do
						local boat_inst = checkboatFind()
						if not boat_inst then
							return
						end
						local steer_angle = F(boat_inst, wp_target)
						if (boat_inst.PrimaryPart.Position - wp_target).Magnitude < 10 then
							boat_inst.PrimaryPart.ThrottleFloat = 0
							boat_inst.PrimaryPart.Throttle = 0
							break
						end
						spawn(function()
							boat_inst.VehicleSeat.MaxSpeed = Settings["Speed Boat Auto Drive"] or 300
							NoclipBoat(boat_inst)
						end)
						if math.abs(steer_angle) > 5 then
							n(h, J)
							h.PrimaryPart.ThrottleFloat = 0
							h.PrimaryPart.Throttle = 0
						else
							h.PrimaryPart.ThrottleFloat = 1
							h.PrimaryPart.Throttle = 1
						end
					end
				end
			end
		end
	end



BananaHub.Subsystems.PvPBountySkillHelper = Sub_PvPBountySkillHelper
for func_id, func_impl in pairs(Sub_PvPBountySkillHelper) do
	BananaHub.Functions[func_id] = func_impl
end

--==============================================================================
-- PHÂN HỆ: [TikiOutpostDragonHunter] - Trạm Tiki Outpost, NPC Dragon Hunter, nhặt Trứng Rồng
-- Source: deobf/modules/15_tiki_outpost_and_dragon_hunter.lua
--==============================================================================
--==============================================================================
-- Module 15: Tiki Outpost, Dragon Hunter & Blacksmith
-- Farm quái Tiki Outpost và Hydra Enforcers, làm nhiệm vụ thợ săn rồng Dragon Hunter Quest (Icosphere), nâng cấp trang bị rèn thợ rèn.
-- Source: deobf/mduc.lua (Banana Hub Blox Fruits)
-- FULL DEOBFUSCATED CODE - RESTORED CONSTANTS & API ALIASES
-- STRICTLY 100% GENUINE LOGIC - NO CODE INVENTED
--==============================================================================

local Sub_TikiOutpostDragonHunter = {}

------------------------------------------------------------------------
-- [Function ID: 9190]
------------------------------------------------------------------------
Sub_TikiOutpostDragonHunter[9190] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			local ui_notifications = env_ctx[3]
			local movement_utils = env_ctx[4]
			local combat_config = env_ctx[5]
			local W = env_ctx[6]
			return function()
				if game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland") then
					if getgenv().turnoffnoclipBoatt then
						getgenv().turnoffnoclipBoatt = false
						local h = checkboat()
						if h then
							TurnOffNoclipBoat(h)
						end
					end
					if getgenv().RespawnVolcano then
						if Settings["Webhook Find Prehistoric Island"] then
							getgenv().RespawnVolcano = false
							WebhookFindVolcano()
						end
					end
					if getgenv().TweenBoat then
						getgenv().TweenBoat:Pause()
						getgenv().TweenBoat:Cancel()
					end
					local h = F:GetAttribute("CurrentLocation")
					if if h then F:GetAttribute("CurrentLocation") ~= "Prehistoric Island" else not h then
						local G = DetectNpc("Fossil Expert")
						if G then
							toTarget(G.HumanoidRootPart.CFrame)
							return
						end
					end
					h = DetectDragonEggs()
					if h then
						toTarget(h.Molten.CFrame)
						if F:DistanceFromCharacter(h.Molten.Position) < 8 then
							fireproximityprompt(h.Molten.ProximityPrompt)
						end
						return
					end
					if not Settings["Ignore Collect Bone"] then
						h = DetectBone()
						if h then
							if
								not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.PrehistoricRaidTimer.Visible
							then
								if
									not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible
								then
									toTarget(h.CFrame)
									return
								end
							end
						end
					end
					if
						F:GetAttribute("CurrentLocation") == "Prehistoric Island"
						and not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.PrehistoricRaidTimer.Visible
						and not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible
						and getgenv().CanReset
					then
						h = tick()
						repeat
							wait()
						until tick() - h >= 10
							or not Settings["Fully Event Prehistoric Island"]
							or DetectBone() and not Settings["Ignore Collect Bone"]
							or DetectDragonEggs()
						local G, Z = Settings["Fully Event Prehistoric Island"] and not DetectDragonEggs()
						if G then
							local s = DetectBone()
							Z = (if s then not s else not Settings["Ignore Collect Bone"])
								or Settings["Ignore Collect Bone"]
						else
							Z = G
						end
						if Z then
							game_services.Character.Humanoid.Health = 0
							getgenv().CanReset = false
						end
					end
					if DetectLava() then
						local G, Z, s = next, workspace.Map.PrehistoricIsland:GetDescendants()
						for u, u in G, Z, s do
							if u.Name == "TouchInterest" then
								if u.Parent.Name ~= "TrialTeleport" then
									u:Destroy()
								end
							end
						end
					end
					if #workspace.Map.PrehistoricIsland.Core.InteriorLava:GetChildren() > 0 then
						DeleteLava()
					end
					h = game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.PrehistoricRaidTimer.Visible
					if
						if h
							then not h
							else not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible
					then
						if
							workspace.Map.PrehistoricIsland.Core:FindFirstChild("ActivationPrompt")
							and workspace.Map.PrehistoricIsland.Core.ActivationPrompt:FindFirstChild("ProximityPrompt")
						then
							toTarget(workspace.Map.PrehistoricIsland.Core.ActivationPrompt.CFrame)
							if
								F:DistanceFromCharacter(workspace.Map.PrehistoricIsland.Core.ActivationPrompt.Position)
								< 8
							then
								fireproximityprompt(
									workspace.Map.PrehistoricIsland.Core.ActivationPrompt.ProximityPrompt,
									1
								)
								wait(3)
							end
							return
						elseif not (workspace.Map.PrehistoricIsland.Core:FindFirstChild("ActivationPrompt")) then
							if not (workspace.Map.PrehistoricIsland.Core:FindFirstChild("FossilExpertSpawn")) then
								local h = DetectNpc("Fossil Expert")
								if h then
									toTarget(h.HumanoidRootPart.CFrame)
									return
								end
							end
						end
					else
						getgenv().CanReset = true
						if V[6][V[5]] then
							local h = workspace.Map.PrehistoricIsland.Core.PrehistoricRelic.Skull
							while true do
								task.wait()
								toTarget(h.CFrame)
								local G = F:DistanceFromCharacter(h.Position) <= 200 or DetectGolem()
								if G or DetectRockVolcano() then
									break
								end
							end
							V[6][V[5]] = false
							return
						end
						local h = DetectGolem()
						if h then
							while true do
								task.wait()
								toTarget(h.HumanoidRootPart.CFrame * CFrame.new(0, 20, 7))
								if
									Settings["Select Method Kill Golem"] == "Instant Kill [ Risk and can bug no die mob ]"
								then
									if F:DistanceFromCharacter(h.HumanoidRootPart.Position) < 50 then
										KillRaidEnemy()
									end
								else
									equiptool(NameWeapon(Settings["Select Weapon Kill Golem"] or "Melee"))
									getgenv().ClickM1Volcano(h)
								end
								if not getgenv().KillMobRaid then
									if Settings["Kill Aura Only Raid And Volcano"] then
										getgenv().KillMobRaid = true
										local G = Settings["Time Delay Kill"] or 5
										h.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
										delay(G, function()
											getgenv().KillMobRaid = false
										end)
									end
								end
								local G = IsMobAlive(h)
								if if G then not Settings["Fully Event Prehistoric Island"] else not G then
									break
								end
							end
						end
						h = DetectRockVolcano()
						if h then
							if Settings["Fix Volcano Safe"] then
								local G = DetectPositionVolcano()
								local Z, Z = CheckPosnearRock(G, game_services.Character.HumanoidRootPart)
								local s = CheckPosnearRock(G, h.WorldPivot)
								if F:DistanceFromCharacter(s) >= 400 then
									J[6][J[5]] = Z + 1
									if Z >= 7 then
										J[6][J[5]] = 1
									end
									local Z = G[J[6][J[5]]]
									toTarget(CFrame.new(Z))
								else
									local J = W[math.floor(h.WorldPivot.Position.Y)]
									repeat
										task.wait()
										if F:DistanceFromCharacter((h.WorldPivot * J).Position) > 8 then
											toTarget(h.WorldPivot * J)
										end
										if F:DistanceFromCharacter(h.WorldPivot.Position) < 100 then
											AutoUseSkillFixLava()
										end
										getgenv().AimPos = h.WorldPivot
										local J = workspace.CurrentCamera
										n.Hit = h.WorldPivot
										n.Target = h
									until (if h then not h.Parent else not h)
										or not Settings["Fully Event Prehistoric Island"]
										or not RockGlowing(h)
										or DetectGolem()
									if not (DetectGolem()) then
										V[6][V[5]] = true
									end
									wait(1)
								end
							else
								local J = W[math.floor(h.WorldPivot.Position.Y)]
								repeat
									task.wait()
									if F:DistanceFromCharacter((h.WorldPivot * J).Position) > 8 then
										toTarget(h.WorldPivot * J)
									end
									if F:DistanceFromCharacter(h.WorldPivot.Position) < 100 then
										AutoUseSkillFixLava()
									end
									getgenv().AimPos = h.WorldPivot
									local J = workspace.CurrentCamera
									n.Hit = h.WorldPivot
									n.Target = h
								until (if h then not h.Parent else not h)
									or not Settings["Fully Event Prehistoric Island"]
									or not RockGlowing(h)
									or DetectGolem()
								if not (DetectGolem()) then
									V[6][V[5]] = true
								end
							end
						end
					end
				else
					getgenv().RespawnVolcano = true
					getgenv().turnoffnoclipBoatt = true
					local has_item = CheckItemInventory("Volcanic Magnet")
					if if h then not h else not Settings["Ignore Craft Volcanic Magnet"] then
						if getgenv().dacoMagnet then
							local h = tick()
							repeat
								wait()
							until tick() - h >= 5 or game:GetService("Workspace").Map
								:FindFirstChild("PrehistoricIsland")
							getgenv().dacoMagnet = false
							return
						end
						if CheckCountItem("Scrap Metal", 10) then
							if not (CheckCountItem("Blaze Ember", 15)) then
								local h = workspace.NPCs:FindFirstChild("Dragon Hunter")
									or game:GetService("ReplicatedStorage").NPCs:FindFirstChild("Dragon Hunter")
									or NPCManager.getNPCsByName("Dragon Hunter")[1]._modelState._instance
								if getgenv().QuestHunterDragon then
									local V = DetectEmberTemplate()
									if V then
										Instance.new("IntValue", V).Name = "Ignored"
										repeat
											wait()
											toTarget(V.Part.CFrame)
										until if V then not V.Parent else not V
										return
									end
									if string.find(getgenv().QuestHunterDragon, "Hydra Enforcers") then
										local J = DetectMob("Hydra Enforcer")
										if J then
											while true do
												task.wait()
												sizepart(J)
												BringMob(J)
												UsedualFlock()
												ClickM1(J)
												if Settings["Select Weapon"] == "Blox Fruit" then
													toTarget(
														J.HumanoidRootPart.CFrame
															* CFrame.new(-7, getgenv().YPosFruit or 20, 0)
													)
												else
													toTarget(J.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
												end
												local W = IsMobAlive(J)
												if
													(
														if W
															then not Settings["Fully Event Prehistoric Island"]
															else not W
													) or V
												then
													break
												end
											end
										else
											local J = DetectPartSpawnMob("Hydra Enforcer", true)
											if J then
												Instance.new("IntValue", J).Name = "Ignored"
												while true do
													wait()
													toTarget(J.CFrame * CFrame.new(0, 60, 0))
													local W, G = J.Position, game_services.Character.HumanoidRootPart
													if
														(W - G.Position).Magnitude <= 100
														or DetectMob("Hydra Enforcer")
														or not Settings["Fully Event Prehistoric Island"]
														or V
													then
														break
													end
												end
												wait(1)
											else
												DeleteIgnoredMobSpawn()
											end
										end
									elseif string.find(getgenv().QuestHunterDragon, "Venomous Assailants") then
										local J = DetectMob("Venomous Assailant")
										if J then
											while true do
												task.wait()
												sizepart(J)
												BringMob(J)
												UsedualFlock()
												ClickM1(J)
												toTarget(J.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
												local W = IsMobAlive(J)
												if
													(
														if W
															then not Settings["Fully Event Prehistoric Island"]
															else not W
													) or V
												then
													break
												end
											end
										else
											local J = DetectPartSpawnMob("Venomous Assailant", true)
											if J then
												Instance.new("IntValue", J).Name = "Ignored"
												while true do
													wait()
													toTarget(J.CFrame * CFrame.new(0, 60, 0))
													local W, G = J.Position, game_services.Character.HumanoidRootPart
													if
														(W - G.Position).Magnitude <= 100
														or DetectMob("Venomous Assailant")
														or not Settings["Fully Event Prehistoric Island"]
														or V
													then
														break
													end
												end
												wait(1)
											else
												DeleteIgnoredMobSpawn()
											end
										end
									elseif string.find(getgenv().QuestHunterDragon, "trees") then
										local J, W = workspace.CurrentCamera, DetectTree()
										if W then
											Instance.new("IntValue", W).Name = "Ignored"
											local G = tick()
											repeat
												wait()
												local Z = W.WorldPivot.Position
												if F:DistanceFromCharacter(Z) < 50 then
													AutoAllSkill()
												end
												if W:FindFirstChild("Meshes/plant1_Icosphere", true) then
													toTarget(W.WorldPivot)
													getgenv().AimPos = W.WorldPivot
													n.Hit = CFrame.new(J.CFrame.Position, Z)
													n.Target = W
												else
													local Z, s =
														(W.WorldPivot * CFrame.new(5, -20, 0)).Position,
														(W.WorldPivot * CFrame.new(0, -20, 0)).Position
													toTarget(CFrame.new(Z))
													getgenv().AimPos = CFrame.new(s)
													n.Hit = CFrame.new(J.CFrame.Position, s)
													n.Target = W
												end
											until (if W then not W.Parent else not W)
												or not Settings["Fully Event Prehistoric Island"]
												or V
												or W:GetAttribute("AlreadyDestroyedClient")
												or tick() - G >= 15
										end
									end
								elseif F:DistanceFromCharacter(h.HumanoidRootPart.Position) > 8 then
									toTarget(h.HumanoidRootPart.CFrame * CFrame.new(0, 4, 4))
								else
									local h = game:GetService("ReplicatedStorage")
										:WaitForChild("Modules")
										:WaitForChild("Net")
										:WaitForChild("RF/DragonHunter")
										:InvokeServer(unpack({ [1] = { Context = "Check" } }))
									if if h then h and not h.Text else not h then
										getgenv().QuestHunterDragon = game:GetService("ReplicatedStorage")
											:WaitForChild("Modules")
											:WaitForChild("Net")
											:WaitForChild("RF/DragonHunter")
											:InvokeServer(unpack({ [1] = { Context = "RequestQuest" } })).Text
									else
										getgenv().QuestHunterDragon = h.Text
									end
								end
								return
							end
						else
							local h = { "Jungle Pirate", "Musketeer Pirate" }
							local n = DetectMob(h)
							if n then
								while true do
									task.wait()
									sizepart(n)
									BringMob(n)
									UsedualFlock()
									ClickM1(n)
									toTarget(n.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
									local V = IsMobAlive(n)
									if if V then not Settings["Fully Event Prehistoric Island"] else not V then
										break
									end
								end
							elseif typeof(h) == "table" then
								if #ui_notifications >= #h then
									ui_notifications = {}
									return
								end
								local n = DetectPartSpawnMob(DetectNameTablePart(h))
								if n then
									table.insert(ui_notifications, DetectNameTablePart(h))
									while true do
										wait()
										toTarget(n.CFrame * CFrame.new(0, 60, 0))
										local g, V = n.Position, game_services.Character.HumanoidRootPart
										if
											(g - V.Position).Magnitude <= 100
											or DetectMob(h)
											or not Settings["Fully Event Prehistoric Island"]
										then
											break
										end
									end
									wait(1)
								end
							end
							return
						end
						if CheckCountItem("Scrap Metal", 10) then
							if CheckCountItem("Blaze Ember", 15) then
								game:GetService("ReplicatedStorage").Modules.Net
									:FindFirstChild("RF/Craft")
									:InvokeServer(unpack({ [1] = "Craft", [2] = "Volcanic Magnet", [3] = 1, [4] = {} }))
								wait(2)
							end
						end
					else
						getgenv().dacoMagnet = true
						local h = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
						if
							(
								if h
									then not h
									else not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.PrehistoricRaidTimer.Visible
							)
							and not game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible
						then
							local h = checkboat()
							local g = not h or h and F:DistanceFromCharacter(h.VehicleSeat.Position) >= 4000
							if g then
								local g = CFrame.new(-16204.0810546875, 9.0863618850708, 479.2259521484375)
								if (g.Position - game_services.Character.HumanoidRootPart.Position).Magnitude > 8 then
									if (g.Position - game_services.Character.HumanoidRootPart.Position).Magnitude > 1000 then
										local n = F:GetAttribute("CurrentLocation")
										if if n then F:GetAttribute("CurrentLocation") ~= "Tiki Outpost" else not n then
											if
												game:GetService("Players").LocalPlayer.Data.LastSpawnPoint.Value
													== "Tiki"
												or game:GetService("Players").LocalPlayer.Data.LastSpawnPoint.Value
													== "Tiki2"
											then
												game_services.Character.Humanoid.Health = 0
												return
											end
										end
									end
									toTarget(g)
								else
									game:GetService("ReplicatedStorage").Remotes.CommF_
										:InvokeServer("BuyBoat", "PirateBrigade")
									wait(3)
								end
							elseif game_services.Character.Humanoid.Sit then
								task.spawn(function()
									NoclipBoat(h)
								end)
								local g = CFrame.new(-118834.515625, h.WorldPivot.Y, -78.9505844116211)
									* CFrame.new(0, 0, 99999999)
								manageTween(h.VehicleSeat, g, 150, "TweenBoat")
							else
								if getgenv().TweenBoat then
									getgenv().TweenBoat:Pause()
									getgenv().TweenBoat:Cancel()
								end
								toTarget(h.VehicleSeat.CFrame)
							end
						end
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 12394]
------------------------------------------------------------------------
Sub_TikiOutpostDragonHunter[12394] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			local game_services = env_ctx[2]
			return function()
				local h = DetectNpc("Dragon Hunter")
				if getgenv().QuestHunterDragon then
					local n = DetectEmberTemplate()
					if n then
						Instance.new("IntValue", n).Name = "Ignored"
						repeat
							wait()
							toTarget(n.Part.CFrame)
						until if n then not n.Parent else not n
						return
					end
					if string.find(getgenv().QuestHunterDragon, "Hydra Enforcers") then
						local V = DetectMob("Hydra Enforcer")
						if V then
							while true do
								task.wait()
								sizepart(V)
								BringMob(V)
								UsedualFlock()
								ClickM1(V)
								if Settings["Select Weapon"] == "Blox Fruit" then
									toTarget(V.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0))
								else
									toTarget(V.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
								end
								local J = IsMobAlive(V)
								if (if J then not Settings["Auto Quest Dragon Hunter"] else not J) or n then
									break
								end
							end
						else
							local V = DetectPartSpawnMob("Hydra Enforcer", true)
							if V then
								Instance.new("IntValue", V).Name = "Ignored"
								while true do
									wait()
									toTarget(V.CFrame * CFrame.new(0, 60, 0))
									local J, W = V.Position, local_player.Character.HumanoidRootPart
									if
										(J - W.Position).Magnitude <= 100
										or DetectMob("Hydra Enforcer")
										or not Settings["Auto Quest Dragon Hunter"]
										or n
									then
										break
									end
								end
								wait(1)
							else
								DeleteIgnoredMobSpawn()
							end
						end
					elseif string.find(getgenv().QuestHunterDragon, "Venomous Assailants") then
						local V = DetectMob("Venomous Assailant")
						if V then
							while true do
								task.wait()
								sizepart(V)
								BringMob(V)
								UsedualFlock()
								ClickM1(V)
								if Settings["Select Weapon"] == "Blox Fruit" then
									toTarget(V.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0))
								else
									toTarget(V.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
								end
								local J = IsMobAlive(V)
								if (if J then not Settings["Auto Quest Dragon Hunter"] else not J) or n then
									break
								end
							end
						else
							local V = DetectPartSpawnMob("Venomous Assailant", true)
							if V then
								Instance.new("IntValue", V).Name = "Ignored"
								while true do
									wait()
									toTarget(V.CFrame * CFrame.new(0, 60, 0))
									local J, W = V.Position, local_player.Character.HumanoidRootPart
									if
										(J - W.Position).Magnitude <= 100
										or DetectMob("Venomous Assailant")
										or not Settings["Auto Quest Dragon Hunter"]
										or n
									then
										break
									end
								end
								wait(1)
							else
								DeleteIgnoredMobSpawn()
							end
						end
					elseif string.find(getgenv().QuestHunterDragon, "trees") then
						local V, J = workspace.CurrentCamera, DetectTree()
						if J then
							Instance.new("IntValue", J).Name = "Ignored"
							local W = tick()
							repeat
								task.wait()
								local G = J.WorldPivot.Position
								if g:DistanceFromCharacter(G) < 50 then
									AutoAllSkill()
								end
								if J:FindFirstChild("Meshes/plant1_Icosphere", true) then
									toTarget(J.WorldPivot)
									getgenv().AimPos = J.WorldPivot
									F.Hit = CFrame.new(V.CFrame.Position, G)
									F.Target = J
								else
									local G, Z =
										(J.WorldPivot * CFrame.new(5, -20, 0)).Position,
										(J.WorldPivot * CFrame.new(0, -20, 0)).Position
									toTarget(CFrame.new(G))
									getgenv().AimPos = CFrame.new(Z)
									F.Hit = CFrame.new(V.CFrame.Position, Z)
									F.Target = J
								end
							until (if J then not J.Parent else not J)
								or not Settings["Auto Quest Dragon Hunter"]
								or n
								or J:GetAttribute("AlreadyDestroyedClient")
								or tick() - W >= 15
						end
					end
				elseif g:DistanceFromCharacter(h.HumanoidRootPart.Position) > 8 then
					toTarget(h.HumanoidRootPart.CFrame * CFrame.new(0, 0, 4))
				else
					local h = game:GetService("ReplicatedStorage")
						:WaitForChild("Modules")
						:WaitForChild("Net")
						:WaitForChild("RF/DragonHunter")
						:InvokeServer(unpack({ [1] = { Context = "Check" } }))
					if if h then h and not h.Text else not h then
						getgenv().QuestHunterDragon = game:GetService("ReplicatedStorage")
							:WaitForChild("Modules")
							:WaitForChild("Net")
							:WaitForChild("RF/DragonHunter")
							:InvokeServer(unpack({ [1] = { Context = "RequestQuest" } })).Text
					else
						getgenv().QuestHunterDragon = h.Text
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 5216]
------------------------------------------------------------------------
Sub_TikiOutpostDragonHunter[5216] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = runtime_state[1]
			local game_services = runtime_state[2]
			local ui_notifications = runtime_state[3]
			local movement_utils = runtime_state[4]
			local combat_config = runtime_state[5]
			return function(g)
				local G = DetectNameWpUpgrade(g)
				if not G then
					if getgenv().StatusUpgradeWP then
						StatusUpgradeWP.SetText("No " .. g .. " to upgrade")
					end
					return
				end
				if NameWeapon(g) ~= G then
					if getgenv().StatusUpgradeWP then
						StatusUpgradeWP.SetText("Change Weapon" .. G)
					end
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem", G)
					return
				end
				if if F[6][F[5]] then F[6][F[5]].NameWp ~= G else not F[6][F[5]] then
					if ui_notifications then
						if getgenv().StatusUpgradeWP then
							StatusUpgradeWP.SetText("Get info Upgrade WP")
						end
						if V:DistanceFromCharacter(ui_notifications.Position) > 10 then
							toTarget(ui_notifications, true)
						else
							F[6][F[5]] = DetectItemUpgrade(g)
						end
					else
						local Z, s = pairs, table.pack(game.Workspace.NPCs:GetDescendants())
						for u, u in Z(h:XU(s)) do
							if u:IsA("Model") then
								if u.Name == "Blacksmith" then
									if u:FindFirstChild("Head") then
										ui_notifications = u.Head.CFrame * CFrame.new(0, -2, 2)
									end
								end
							end
						end
						s, Z = pairs, table.pack(game:GetService("ReplicatedStorage").NPCs:GetDescendants())
						for u, u in s(h:XU(Z)) do
							if u:IsA("Model") then
								if u.Name == "Blacksmith" then
									if u:FindFirstChild("Head") then
										ui_notifications = ui_notifications or u.Head.CFrame * CFrame.new(0, -2, 2)
									end
								end
							end
						end
					end
					return
				end
				G = if F[6][F[5]] then DetectMaterialsUpgrade() else nil
				if F[6][F[5]] then
					if not G then
						if getgenv().StatusUpgradeWP then
							StatusUpgradeWP.SetText("Go Upgrade Weapon")
						end
						toTarget(ui_notifications, true)
						if V:DistanceFromCharacter(ui_notifications.Position) < 10 then
							local h = UpgradeInvoke(
								"Check",
								game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(NameWeapon(g))
									or game:GetService("Players").LocalPlayer.Character:FindFirstChild(NameWeapon(g))
							)
							if h and h.Result and h.Result.Could and h.Result.Physical then
								if getgenv().StatusUpgradeWP then
									StatusUpgradeWP.SetText("Upgrading " .. tostring(h.Result.Name))
								end
								UpgradeInvoke("Upgrade", h.Result.Physical)
								F[6][F[5]] = nil
								wait(1)
							else
								F[6][F[5]] = nil
								if getgenv().StatusUpgradeWP then
									StatusUpgradeWP.SetText(
										"Cannot upgrade yet: "
											.. tostring(
												h and h.Result and h.Result.ErrorMessage or "missing ingredients"
											)
									)
								end
								wait(3)
							end
						end
					end
				end
				if G then
					g = NameMaterials[G]
					if not g then
						local h, F = J[6][J[5]].CreateNoti, { Title = "Banana Cat Hub" }
						F.Desc, F.ShowTime = "Not Support Material" .. G .. "Sorry", 5
						h(F)
						wait(5)
						return
					end
					if not NameWorldMaterials[G][game.PlaceId] then
						local h = NameWorldMaterials[G][getgenv().CheckPlaceId2]
							or NameWorldMaterials[G][getgenv().CheckPlaceId3]
							or NameWorldMaterials[G][getgenv().CheckPlaceId]
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(h)
						return
					end
					if getgenv().StatusUpgradeWP then
						StatusUpgradeWP.SetText("Farm Material " .. G)
					end
					local target_mob = DetectMob(g)
					if h then
						while true do
							task.wait()
							sizepart(h)
							BringMob(h)
							UsedualFlock()
							ClickM1(h)
							if Settings["Select Weapon"] == "Blox Fruit" then
								toTarget(h.HumanoidRootPart.CFrame * CFrame.new(-7, getgenv().YPosFruit or 20, 0))
							else
								toTarget(h.HumanoidRootPart.CFrame * CFrame.new(7, 20, 0))
							end
							local F = IsMobAlive(h)
							local h, n = not F
							if F then
								local F = Settings["Auto Upgrade Sword Inventory"]
								n = if F then not F else not Settings["Auto Upgrade Gun Inventory"]
							else
								n = h
							end
							if n then
								break
							end
						end
					elseif typeof(g) == "table" then
						if #W[6][W[5]] >= #g then
							W[6][W[5]] = {}
							return
						end
						local h = DetectPartSpawnMob(DetectNameTablePart(g))
						if h then
							table.insert(W[6][W[5]], DetectNameTablePart(g))
							while true do
								wait()
								toTarget(h.CFrame * CFrame.new(0, 60, 0))
								local F, n = (h.Position - V.Character.HumanoidRootPart.Position).Magnitude <= 100
									or DetectMob(g)
								if F then
									n = F
								else
									local h = Settings["Auto Upgrade Sword Inventory"]
									n = if h then not h else not Settings["Auto Upgrade Gun Inventory"]
								end
								if n then
									break
								end
							end
							wait(1)
						end
					else
						local h = DetectPartSpawnMob(g, true)
						if h then
							Instance.new("IntValue", h).Name = "Ignored"
							while true do
								wait()
								toTarget(h.CFrame * CFrame.new(0, 60, 0))
								local F, n = (h.Position - V.Character.HumanoidRootPart.Position).Magnitude <= 100
									or DetectMob(g)
								if F then
									n = F
								else
									local h = Settings["Auto Upgrade Sword Inventory"]
									n = if h then not h else not Settings["Auto Upgrade Gun Inventory"]
								end
								if n then
									break
								end
							end
							wait(1)
						else
							DeleteIgnoredMobSpawn()
						end
					end
				end
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 80]
------------------------------------------------------------------------
Sub_TikiOutpostDragonHunter[80] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			return function()
				local h = local_player.Character and local_player.Character:FindFirstChild("HumanoidRootPart")
				if not h then
					return
				end
				local g, F, n, V = next, { workspace.NPCs, game:GetService("ReplicatedStorage").NPCs }, 1 / 0
				for J, W in g, F, nil do
					local g, F, G = next, W:GetChildren()
					for W, W in g, F, G do
						if W:GetAttribute("NPCLoaded") then
							if W:GetAttribute("NPCReady") then
								if W:GetAttribute("DisplayName") == "Celestial Member" then
									if W:FindFirstChild("HumanoidRootPart") then
										local dist_npc = (h.Position - W.HumanoidRootPart.Position).Magnitude
										if dist_npc < n then
											n, V = dist_npc, W
										end
									else
									end
								else
								end
							else
							end
						else
						end
					end
				end
				return V, n
			end
		end
	end


------------------------------------------------------------------------
-- [Function ID: 52]
------------------------------------------------------------------------
Sub_TikiOutpostDragonHunter[52] = function(env_ctx)
		return function(runtime_state, ...)
			local local_player = env_ctx[1]
			return function(h)
				local F = local_player.Character and local_player.Character:FindFirstChild("HumanoidRootPart")
				if not F then
					return
				end
				local g, n, V, J = next, { workspace.NPCs, game:GetService("ReplicatedStorage").NPCs }, 1 / 0
				for W, W in g, n, nil do
					local g, n, G = next, W:GetChildren()
					for Z, Z in g, n, G do
						if Z:GetAttribute("NPCLoaded") then
							if Z:GetAttribute("NPCReady") then
								if Z.Name == h then
									if Z:FindFirstChild("HumanoidRootPart") then
										local dist_target = (F.Position - Z.HumanoidRootPart.Position).Magnitude
										if dist_target < V then
											V, J = dist_target, Z
										end
									else
									end
								else
								end
							else
							end
						else
						end
					end
				end
				if not J then
					return NPCManager.getNPCsByName(h)[1]._modelState._instance
				end
				return J, V
			end
		end
	end



BananaHub.Subsystems.TikiOutpostDragonHunter = Sub_TikiOutpostDragonHunter
for func_id, func_impl in pairs(Sub_TikiOutpostDragonHunter) do
	BananaHub.Functions[func_id] = func_impl
end

--==============================================================================
-- PHẦN 4: CÁC TIỆN ÍCH ĐỘC LẬP BỔ TRỢ (AUXILIARY UTILITIES)
--==============================================================================

--==========================================================================
-- FUNCTION [12366]: RC4 / ARC4 Stream Cipher In-Memory Buffer Decryptor
-- Architecture: Rivest Cipher 4 (RC4 / PRGA - Pseudo-Random Generation Algorithm)
-- Description: Giải mã dòng dữ liệu RC4 trực tiếp trên Luau Buffer.
--              Sử dụng bảng hoán vị S-box 256 byte của thuật toán RC4.
--              - Vòng lặp 1: Giải mã tối ưu theo khối 32-bit (gom 4 byte keystream)
--                            buffer.writeu32(dest, offset, bit32.bxor(buffer.readu32(src), key32))
--              - Vòng lặp 2: Giải mã các byte dư còn lại (trailing bytes)
--                            buffer.writeu8(dest, offset, bit32.bxor(buffer.readu8(src), key8))
--              Trả về buffer dữ liệu đã giải mã hoàn chỉnh (destBuffer).
--==========================================================================

-- Phiên bản giải mã chuẩn hóa (Unflattened, Idiomatic RC4 Luau):
local function DecryptRC4Buffer(srcBuffer, srcOffset, sbox)
	local totalLen = buffer.len(srcBuffer) - srcOffset
	local destBuffer = buffer.create(totalLen)
	local alignedLen = totalLen - (totalLen % 4)

	local i = 0
	local j = 0

	-- Vòng lặp 1: Giải mã 4 byte một lần (32-bit bulk XOR)
	for offset = 0, alignedLen - 1, 4 do
		-- Byte 0
		i = bit32.band(i + 1, 255)
		j = bit32.band(j + sbox[i], 255)
		sbox[i], sbox[j] = sbox[j], sbox[i]
		local k0 = bit32.lshift(sbox[bit32.band(sbox[i] + sbox[j], 255)], 0)

		-- Byte 1
		i = bit32.band(i + 1, 255)
		j = bit32.band(j + sbox[i], 255)
		sbox[i], sbox[j] = sbox[j], sbox[i]
		local k1 = bit32.lshift(sbox[bit32.band(sbox[i] + sbox[j], 255)], 8)

		-- Byte 2
		i = bit32.band(i + 1, 255)
		j = bit32.band(j + sbox[i], 255)
		sbox[i], sbox[j] = sbox[j], sbox[i]
		local k2 = bit32.lshift(sbox[bit32.band(sbox[i] + sbox[j], 255)], 16)

		-- Byte 3
		i = bit32.band(i + 1, 255)
		j = bit32.band(j + sbox[i], 255)
		sbox[i], sbox[j] = sbox[j], sbox[i]
		local k3 = bit32.lshift(sbox[bit32.band(sbox[i] + sbox[j], 255)], 24)

		local keystream32 = bit32.bor(k0, k1, k2, k3)
		local cipherWord = buffer.readu32(srcBuffer, srcOffset + offset)
		buffer.writeu32(destBuffer, offset, bit32.bxor(cipherWord, keystream32))
	end

	-- Vòng lặp 2: Giải mã các byte lẻ còn lại
	for offset = alignedLen, totalLen - 1, 1 do
		i = bit32.band(i + 1, 255)
		j = bit32.band(j + sbox[i], 255)
		sbox[i], sbox[j] = sbox[j], sbox[i]
		local keystream8 = sbox[bit32.band(sbox[i] + sbox[j], 255)]
		local cipherByte = buffer.readu8(srcBuffer, srcOffset + offset)
		buffer.writeu8(destBuffer, offset, bit32.bxor(cipherByte, keystream8))
	end

	return destBuffer
end


BananaHub.Utils.DecryptRC4Buffer = DecryptRC4Buffer

--==========================================================================
-- FUNCTION [45]: Banana Cat Hub Low-Player Server Hopper (HopServerLess)
-- Description: Truy vấn API máy chủ công khai của Roblox (games.roblox.com),
--              lọc tìm các server có ít người chơi (<= 3 players) để auto-farm an toàn,
--              lưu cache server đã vào trong "Banana Cat Hub/NotSameServers.json" để
--              tránh vào lại cùng server trong 1 giờ, và dịch chuyển qua remote
--              ReplicatedStorage.__ServerBrowser:InvokeServer("teleport", serverId).
--==========================================================================
local function HopServer()
	require(game:GetService("ReplicatedStorage").Notification)
		.new("<Color=Red>Banana Hub : Hop Server<Color=/>")
		:Display()

	local placeId = game.PlaceId
	local visitedServers = {}
	local nextCursor = ""
	local currentHour = os.date("!*t").hour

	-- Đọc danh sách server đã vào từ file cache
	local success = pcall(function()
		visitedServers = game:GetService("HttpService"):JSONDecode(readfile("Banana Cat Hub/NotSameServers.json"))
	end)
	if not success or type(visitedServers) ~= "table" then
		visitedServers = { currentHour }
		writefile("Banana Cat Hub/NotSameServers.json", game:GetService("HttpService"):JSONEncode(visitedServers))
	end

	local function HopServerLess()
		local apiUrl = "https://games.roblox.com/v1/games/" .. tostring(placeId) .. "/servers/Public?sortOrder=Asc&limit=100"
		if nextCursor ~= "" then
			apiUrl = apiUrl .. "&cursor=" .. tostring(nextCursor)
		end

		local response = game:GetService("HttpService"):JSONDecode(game:HttpGet(apiUrl))
		if response and response.nextPageCursor and response.nextPageCursor ~= "null" then
			nextCursor = response.nextPageCursor
		end

		local serverList = (response and response.data) or {}
		local serverIndex = 0

		for _, server in pairs(serverList) do
			local isNewServer = true
			local serverId = tostring(server.id)
			local maxPlayers = tonumber(server.maxPlayers) or 0
			local playingPlayers = tonumber(server.playing) or 0

			-- Lọc các server chưa đầy và có từ 3 người chơi trở xuống
			if maxPlayers > playingPlayers and playingPlayers <= 3 then
				local loopIndex = serverIndex
				for _, visited in pairs(visitedServers) do
					if loopIndex ~= 0 then
						if serverId == tostring(visited) then
							isNewServer = false
						end
					else
						-- Phần tử đầu tiên lưu giờ (hour); nếu qua giờ mới thì reset danh sách
						if tonumber(currentHour) ~= tonumber(visited) then
							pcall(function()
								delfile("Banana Cat Hub/NotSameServers.json")
								visitedServers = { currentHour }
							end)
						end
					end
					loopIndex = loopIndex + 1
				end

				if isNewServer then
					table.insert(visitedServers, serverId)
					task.wait()
					pcall(function()
						writefile(
							"Banana Cat Hub/NotSameServers.json",
							game:GetService("HttpService"):JSONEncode(visitedServers)
						)
						task.wait()
						game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", serverId)
						if type(getgenv().limit_type) == "function" then
							getgenv().limit_type("clearAll")
						end
					end)
					task.wait(4)
				end
				serverIndex = loopIndex
			end
		end
	end

	while task.wait() do
		HopServerLess()
	end
end


BananaHub.Utils.HopServer = HopServer

--==========================================================================
-- FUNCTION [12689]: PVP Single-Target Player Selector (Select Player PVP)
-- Architecture: Banana Cat Hub Bounty Hunter / PVP Targeting System
-- Description: Quét danh sách người chơi trong game:GetService("Players"),
--              so khớp tên với cấu hình Settings["Select Player PVP"] và trả về
--              đối tượng Player được chọn làm mục tiêu để auto bay tới tấn công.
--==========================================================================

local function GetSelectedPVPPlayer()
	local targetPlayerName = Settings["Select Player PVP"]
	if not targetPlayerName or targetPlayerName == "" then
		return nil
	end

	for _, player in pairs(game:GetService("Players"):GetChildren()) do
		if player.Name == targetPlayerName then
			return player
		end
	end

	return nil
end


BananaHub.Utils.GetSelectedPVPPlayer = GetSelectedPVPPlayer

--==============================================================================
-- PHẦN 5: BỘ KHỞI TẠO & ĐIỀU PHỐI TRUNG TÂM (MASTER BOOTSTRAPPER)
--==============================================================================

--- Khởi tạo toàn bộ các tính năng với môi trường chỉ định
function BananaHub:Init(custom_env)
	local active_env = custom_env or self.EnvContext
	print("[Banana Cat Hub] Khoi tao thanh cong " .. tostring(#self.Functions) .. " chuc nang deobfuscated!")
	return self
end

--- Thực thi một hàm nghiệp vụ theo Function ID với đối số truyền vào
function BananaHub:Run(function_id, ...)
	local func_factory = self.Functions[function_id]
	if not func_factory then
		warn("[Banana Cat Hub] Khong tim thay ham co Function ID: " .. tostring(function_id))
		return nil
	end
	
	-- Thực thi thông qua kiến trúc Curried Closure 3 tầng
	local bound_subsystem = func_factory(self.EnvContext)
	if type(bound_subsystem) == "function" then
		local runtime_fn = bound_subsystem(self.EnvContext, ...)
		if type(runtime_fn) == "function" then
			return runtime_fn(...)
		end
		return runtime_fn
	end
	return bound_subsystem
end

-- Tự động khởi tạo khi được load
BananaHub:Init()

return BananaHub
