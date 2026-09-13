--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local packet = require(ReplicatedStorage.Packages.packet)
local NewPacket = packet("NewPacket", packet.NumberU8)

NewPacket.OnServerEvent:Connect(function() end)
