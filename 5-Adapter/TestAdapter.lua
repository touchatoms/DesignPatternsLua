require(".functions")

local Motor = class("Motor")

function Motor:ctor(motorName)
    self.name = motorName
end

function Motor:drive()
    print(self.name .. ": drive")
end

local ElectricMotor = class("ElectricMotor")

function ElectricMotor:ctor()
    self.name = "电动机"
end

function ElectricMotor:driveElectric()
    print("    " .. self.name .. ": 工作中")
end

local GasMotor = class("GasMotor")

function GasMotor:ctor()
    self.name = "燃油机"
end

function GasMotor:driveGas()
    print("    " .. self.name .. ": 工作中")
end

--- 电动机适配器
local ElectricAdapter = class("ElectricAdapter", Motor)

function ElectricAdapter:ctor()
    ElectricAdapter.super.ctor(self, "电动机适配器")
    self.electricMotor = ElectricMotor.new()
end

function ElectricAdapter:drive()
    ElectricAdapter.super.drive(self)
    self.electricMotor:driveElectric()
end

--- 燃油机适配器
local GasAdapter = class("GasAdapter", Motor)

function GasAdapter:ctor()
    GasAdapter.super.ctor(self, "电动机适配器")
    self.gasMotor = GasMotor.new()
end

function GasAdapter:drive()
    GasAdapter.super.drive(self)
    self.gasMotor:driveGas()
end

local electricAdaper = ElectricAdapter.new()
local gasAdaper = GasAdapter.new()

electricAdaper:drive()
gasAdaper:drive()