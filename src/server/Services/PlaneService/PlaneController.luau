--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlaneModule = require(ReplicatedStorage.Shared.Classes.PlaneClass.PlaneModule)
local PacketManager = require(ReplicatedStorage.Shared.Util.PacketManager)

local PlaneController = {}
export type PlaneModel = {
	RightFlag: Part & {
		RightFlap: Part,
	},
	LeftFlag: Part & {
		LeftFlap: Part,
	},
}

function PlaneController.Init()
	PacketManager.PlaneUpPacket.OnServerEvent:Connect(function(Player: Player, Model: PlaneModel)
		local RightFlag = Model.RightFlag
		local LeftFlag = Model.LeftFlag
		local RightFlap = RightFlag.RightFlap
		local LeftFlap = LeftFlag.LeftFlap

		RightFlap.Orientation =
			Vector3.new(RightFlag.Orientation.X, RightFlag.Orientation.Y, RightFlag.Orientation.Z + 40)
		LeftFlap.Orientation = Vector3.new(LeftFlag.Orientation.X, LeftFlag.Orientation.Y, LeftFlag.Orientation.Z + 40)
	end)

	PacketManager.PlaneDownPacket.OnServerEvent:Connect(function(Player: Player, Model: PlaneModel)
		local RightFlag = Model.RightFlag
		local LeftFlag = Model.LeftFlag
		local RightFlap = RightFlag.RightFlap
		local LeftFlap = LeftFlag.LeftFlap

		RightFlap.Orientation =
			Vector3.new(RightFlag.Orientation.X, RightFlag.Orientation.Y, RightFlag.Orientation.Z - 40)
		LeftFlap.Orientation = Vector3.new(LeftFlag.Orientation.X, LeftFlag.Orientation.Y, LeftFlag.Orientation.Z - 40)
	end)

	PacketManager.PlaneStadyPacket.OnServerEvent:Connect(function(Player: Player, Model: PlaneModel)
		local RightFlag = Model.RightFlag
		local LeftFlag = Model.LeftFlag
		local RightFlap = RightFlag.RightFlap
		local LeftFlap = LeftFlag.LeftFlap

		RightFlap.Orientation = Vector3.new(RightFlag.Orientation.X, RightFlag.Orientation.Y, RightFlag.Orientation.Z)
		LeftFlap.Orientation = Vector3.new(LeftFlag.Orientation.X, LeftFlag.Orientation.Y, LeftFlag.Orientation.Z)
	end)
end

function PlaneController.Sync()
	local Plane = PlaneModule.New()
	Plane.Model.Parent = workspace
end

return PlaneController
