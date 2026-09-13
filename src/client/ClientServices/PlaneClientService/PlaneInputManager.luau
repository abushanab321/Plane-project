local CollectionService = game:GetService("CollectionService")
local ContextActionService = game:GetService("ContextActionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PacketManager = require(ReplicatedStorage.Shared.Util.PacketManager)

local Actions = {
	PlaneUP = {
		KeyCode = Enum.KeyCode.E,

		[Enum.UserInputState.Begin] = function(inputObject, Plane)
			print("Up")
			PacketManager.PlaneUpPacket:Fire(Plane)
		end,

		[Enum.UserInputState.End] = function(inputObject, Plane)
			PacketManager.PlaneStadyPacket:Fire(Plane)
		end,
	},
	PlaneDown = {
		KeyCode = Enum.KeyCode.Q,

		[Enum.UserInputState.Begin] = function(inputObject, Plane)
			PacketManager.PlaneDownPacket:Fire(Plane)
		end,

		[Enum.UserInputState.End] = function(inputObject, Plane)
			PacketManager.PlaneStadyPacket:Fire(Plane)
		end,
	},
}

local PlaneInputManager = {}
function PlaneInputManager.Init()
	CollectionService:GetInstanceAddedSignal("Planes"):Connect(function(Plane)
		local Seat: VehicleSeat = Plane.VehicleSeat

		local function HandleAction(actionName, inputState, _inputObject)
			local action = Actions[actionName]
			if action and action[inputState] then
				action[inputState](_inputObject, Plane)
			end
		end

		local function BindActions()
			for ActionName, ActionTable in Actions do
				ContextActionService:BindAction(ActionName, HandleAction, false, ActionTable.KeyCode)
			end
		end

		local function UnbindActions()
			for ActionName, _ in Actions do
				ContextActionService:UnbindAction(ActionName)
			end
		end
		Seat:GetPropertyChangedSignal("Occupant"):Connect(function(...)
			if Seat.Occupant ~= nil then
				BindActions()
			else
				UnbindActions()
			end
		end)
	end)
end

return PlaneInputManager
