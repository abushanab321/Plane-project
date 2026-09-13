--!strict
local PlaneController = require(script.Services.PlaneService.PlaneController)
task.wait(2)
PlaneController.Init()
PlaneController.Sync()
