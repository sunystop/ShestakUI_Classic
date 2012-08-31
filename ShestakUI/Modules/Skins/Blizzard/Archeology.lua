local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	ArchaeologyUI skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	ArchaeologyFrame:StripTextures(true)
	ArchaeologyFrameInset:StripTextures(true)
	ArchaeologyFrame:SetTemplate("Transparent")

	ArchaeologyFrameArtifactPageSolveFrameSolveButton:SkinButton(true)
	ArchaeologyFrameArtifactPageBackButton:SkinButton(true)
	T.SkinDropDownBox(ArchaeologyFrameRaceFilter, 125)

	ArchaeologyFrameRankBar:StripTextures()
	ArchaeologyFrameRankBar:SetStatusBarTexture(C.media.texture)
	ArchaeologyFrameRankBar:CreateBackdrop("Overlay")

	ArchaeologyFrameArtifactPageSolveFrameStatusBar:StripTextures()
	ArchaeologyFrameArtifactPageSolveFrameStatusBar:SetStatusBarTexture(C.media.texture)
	ArchaeologyFrameArtifactPageSolveFrameStatusBar:SetStatusBarColor(0.7, 0.2, 0)
	ArchaeologyFrameArtifactPageSolveFrameStatusBar:CreateBackdrop("Overlay")

	for i = 1, ARCHAEOLOGY_MAX_COMPLETED_SHOWN do
		local artifact = _G["ArchaeologyFrameCompletedPageArtifact"..i]

		if artifact then
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."Border"]:Kill()
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."Bg"]:Kill()
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."Icon"]:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."Icon"].backdrop = CreateFrame("Frame", nil, artifact)
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."Icon"].backdrop:SetTemplate("Default")
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."Icon"].backdrop:Point("TOPLEFT", _G["ArchaeologyFrameCompletedPageArtifact"..i.."Icon"], "TOPLEFT", -2, 2)
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."Icon"].backdrop:Point("BOTTOMRIGHT", _G["ArchaeologyFrameCompletedPageArtifact"..i.."Icon"], "BOTTOMRIGHT", 2, -2)
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."Icon"].backdrop:SetFrameLevel(artifact:GetFrameLevel() - 2)
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."Icon"]:SetDrawLayer("OVERLAY")
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."ArtifactName"]:SetTextColor(1, 0.8, 0)
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."ArtifactName"]:SetShadowOffset(1, -1)
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."ArtifactSubText"]:SetTextColor(0.6, 0.6, 0.6)
			_G["ArchaeologyFrameCompletedPageArtifact"..i.."ArtifactSubText"]:SetShadowOffset(1, -1)
		end
	end

	for i = 1, ARCHAEOLOGY_MAX_RACES do
		local frame = _G["ArchaeologyFrameSummaryPageRace"..i]

		if frame then
			frame.raceName:SetTextColor(1, 1, 1)
			frame.raceName:SetShadowOffset(1, -1)
		end
	end

	for i = 1, ArchaeologyFrameCompletedPage:GetNumRegions() do
		local region = select(i, ArchaeologyFrameCompletedPage:GetRegions())
		if region:GetObjectType() == "FontString" then
			region:SetTextColor(1, 0.8, 0)
			region:SetShadowColor(0, 0, 0)
			region:SetShadowOffset(1, -1)
		end
	end

	for i = 1, ArchaeologyFrameSummaryPage:GetNumRegions() do
		local region = select(i, ArchaeologyFrameSummaryPage:GetRegions())
		if region:GetObjectType() == "FontString" then
			region:SetTextColor(1, 0.8, 0)
			region:SetShadowColor(0, 0, 0)
			region:SetShadowOffset(1, -1)
		end
	end

	ArchaeologyFrameCompletedPage.infoText:SetTextColor(1, 1, 1)
	ArchaeologyFrameHelpPageTitle:SetTextColor(1, 0.8, 0)
	ArchaeologyFrameHelpPageTitle:SetShadowColor(0, 0, 0)
	ArchaeologyFrameHelpPageTitle:SetShadowOffset(1, -1)
	ArchaeologyFrameHelpPageDigTitle:SetTextColor(1, 0.8, 0)
	ArchaeologyFrameHelpPageDigTitle:SetShadowColor(0, 0, 0)
	ArchaeologyFrameHelpPageDigTitle:SetShadowOffset(1, -1)
	ArchaeologyFrameHelpPageHelpScrollHelpText:SetTextColor(1, 1, 1)

	ArchaeologyFrameArtifactPageHistoryTitle:SetTextColor(1, 0.8, 0)
	ArchaeologyFrameArtifactPageIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	ArchaeologyFrameArtifactPageIcon.backdrop = CreateFrame("Frame", nil, ArchaeologyFrameArtifactPage)
	ArchaeologyFrameArtifactPageIcon.backdrop:SetTemplate("Default")
	ArchaeologyFrameArtifactPageIcon.backdrop:Point("TOPLEFT", ArchaeologyFrameArtifactPageIcon, "TOPLEFT", -2, 2)
	ArchaeologyFrameArtifactPageIcon.backdrop:Point("BOTTOMRIGHT", ArchaeologyFrameArtifactPageIcon, "BOTTOMRIGHT", 2, -2)
	ArchaeologyFrameArtifactPageIcon.backdrop:SetFrameLevel(ArchaeologyFrameArtifactPage:GetFrameLevel())
	ArchaeologyFrameArtifactPageIcon:SetParent(ArchaeologyFrameArtifactPageIcon.backdrop)
	ArchaeologyFrameArtifactPageIcon:SetDrawLayer("OVERLAY")

	ArchaeologyFrameArtifactPageHistoryScrollChildText:SetTextColor(1, 1, 1)
	T.SkinCloseButton(ArchaeologyFrameCloseButton)
	T.SkinNextPrevButton(ArchaeologyFrameCompletedPageNextPageButton)
	T.SkinNextPrevButton(ArchaeologyFrameCompletedPagePrevPageButton)

	ArchaeologyFrameInfoButton:Point("TOPLEFT", ArchaeologyFrame, 4, -4)
end

T.SkinFuncs["Blizzard_ArchaeologyUI"] = LoadSkin