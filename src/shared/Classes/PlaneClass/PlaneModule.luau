--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local PlaneModule = {}
PlaneModule.__index = PlaneModule

export type Plane = typeof(setmetatable(
	{} :: {
		Model: Model,
		Speed: number,
		Seat: Part,
	},
	PlaneModule
))

function PlaneModule.New()
	local self = setmetatable({}, PlaneModule)
	self.Speed = 0
	self.Model = ReplicatedStorage.Assets.Plane:Clone()
	self.Seat = self.Model.VehicleSeat
	self.Model:AddTag("Planes")
	return self
end
return PlaneModule
