local Phe = {"UUU","UUC"}
local Leu = {"UUA","UUG","CUU","CUA","CUG","CUC"}
local Ile = {"AUU","AUC","AUA"}
local Met = {"AUG"} -- Initiation Codon
local Val = {"GUA","GUU","GUC","GUG"}
local Ser = {"UCU","UCC","UCA","UCG","AGU","AGC"}	
local Pro = {"CCU","CCC","CCA","CCG"}
local Thr = {"ACU","ACC","ACA","ACG"}
local Ala = {"GCU","GCC","GCA","GCG"}
local Tyr = {"UAU","UAC"}
local Stop = {"UAA","UAG","UGA"} -- Termination Codon
local His = {"CAU","CAC"}
local Gln = {"CAA","CAG"}
local Asn = {"AAU","AAC"}
local Lys = {"AAA","AAG"}
local Asp = {"GAU","GAC"}
local Glu = {"GAA","GAG"}
local Cys = {"UGU","UGC"}
local Trp = {"UGG"}
local Arg = {"CGU","CGC","CGA","CGG","AGA","AGG"}
local Gly = {"GGU","GGC","GGA","GGG"}
local AminoAcids = {Phe,Leu,Ile,Met,Val,Ser,Pro,Thr,Ala,Tyr,Stop,His,Gln,Asn,Lys,Asp,Glu,Cys,Trp,Arg,Gly}
local AminoAcidsNames = {"Phe","Leu","Ile","Met","Val","Ser","Pro","Thr","Ala","Tyr","Stop","His","Gln","Asn","Lys","Asp","Glu","Cys","Trp","Arg","Gly"}

local AcceptedBases = {"A","U","C","G"}

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


	function MatchAminoAcid(Codon)
		for i,v in pairs (AminoAcids) do
			for a,b in pairs (v) do
				if Codon == b then 
					return AminoAcidsNames[i]
				end
			end
		end
	return "ERROR"
	end

	function TranslateRNA()
		local Input = string.upper(script.Input.Value)
		local ValidBS, BaseSequence = CheckBS(Input)
		if not ValidBS then
			print("ERROR: Invalid Base Sequence")
			return 
		end
		local PPC = {} -- PPC --> Polypeptide Chain
		local Characters = #BaseSequence
		local Codons = math.floor(Characters/3)
		for i=1,Codons do
			table.insert(PPC,MatchAminoAcid(string.sub(table.concat(BaseSequence),(i*3) - 2,i*3)))
		end
		print(table.concat(PPC," "))
	end

	script.Input.Changed:connect(TranslateRNA)

	--function TranslateToPPC(CodonSequence) -- PPC --> Polypeptide Chain
