local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packet = require(ReplicatedStorage.Packages.packet)
return {
	PlaneUpPacket = Packet("PlaneUpPacket", Packet.Any),
	PlaneDownPacket = Packet("PlaneDownPacket", Packet.Any),
	PlaneStadyPacket = Packet("PlaneSteadyPacket", Packet.Any),
}
