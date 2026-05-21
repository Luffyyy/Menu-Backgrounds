Hooks:PostHook(HUDStageEndScreen, "show", "MenuBGsInit", function(self)
	local is_success = game_state_machine:current_state().is_success and game_state_machine:current_state():is_success()
	if not is_success and MenuBackgrounds.Options:GetValue("Menus/failscreen") then
		self._backdrop:set_background("failscreen")
	elseif MenuBackgrounds.Options:GetValue("Menus/endscreen") then
		self._backdrop:set_background("endscreen")
	end
end)

Hooks:PostHook(HUDStageEndCrimeSpreeScreen, "show", "MenuSpreeBGsInit", function(self)
	local is_success = game_state_machine:current_state().is_success and game_state_machine:current_state():is_success()
	if not is_success and MenuBackgrounds.Options:GetValue("Menus/failscreen") then
		self._backdrop:set_background("failscreen")
	elseif MenuBackgrounds.Options:GetValue("Menus/endscreen") then
		self._backdrop:set_background("endscreen")
	end
end)

function HUDStageEndScreen:spawn_animation() self:_wait_for_video() end

function HUDStageEndScreen:_wait_for_video()
	if not MenuBackgrounds.Options:GetValue("Menus/endscreen") or not MenuBackgrounds.Options:GetValue("Menus/failscreen") then
		return
	end
	local video = self._background_layer_full:child("money_video")
	video:parent():remove(video)
end
