local Bases = {"A","T","C","G"}
local Run = script.Run
local Number = Run.Number
local Output = script.Output
Output.Value = ""

	function Generate()
		Output.Value = ""
		for i=1,Number.Value do
				local Base = Bases[math.random(1,4)]
				Output.Value = Output.Value..Base
		end
		print(Output.Value)
	end
	
	Run.Changed:connect(Generate)
