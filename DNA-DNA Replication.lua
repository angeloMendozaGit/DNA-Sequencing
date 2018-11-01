local AcceptedBases = {"A","T","C","G"}
local ConvertedBases = {"T","A","G","C"}
script.Input.Value = ""

	function CheckBase(Letter)
		Accepted = false
			for i,v in pairs (AcceptedBases) do
					if v == string.upper(Letter) then
						Accepted = true
					end
			end
			return Accepted
	end

	function CheckBS(String) -- BS --> Base Sequence
		local Bases = 	{}
		local ValidBS = true
				for Base in string.gmatch(String, "%a") do
					table.insert(Bases,Base)
					if not CheckBase(Base) then
						ValidBS = false
					end
				end
		return ValidBS, Bases
	end

	function ReplicateDNA() -- DNA --> Deoxyribonucleic Acid
		local Input = string.upper(script.Input.Value)
		local ValidBS, BaseSequence = CheckBS(Input)
		if not ValidBS then
			print("ERROR: Invalid Base Sequence")
			return 
		end
		local ConvertedBaseSequence = {}
		for i,v in pairs (BaseSequence) do
			if v == "A" then
				table.insert(ConvertedBaseSequence,"T")
			elseif v == "T" then
				table.insert(ConvertedBaseSequence,"A")
			elseif v == "C" then
				table.insert(ConvertedBaseSequence,"G")
			elseif v == "G" then
				table.insert(ConvertedBaseSequence,"C")
			end
			if i % 3 == 0 then
				table.insert(ConvertedBaseSequence," ")
			end
		end
		print(table.concat(ConvertedBaseSequence))
	end
	
script.Input.Changed:connect(ReplicateDNA)
