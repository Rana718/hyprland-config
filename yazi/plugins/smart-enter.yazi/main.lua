--- @sync entry
return {
	entry = function()
		local h = cx.active.current.hovered
		if h and h.cha.is_dir then
			ya.emit("cd", { h.url })
			os.execute("touch /tmp/yazi-enter-pressed")
			ya.emit("quit", { no_confirm = true })
		else
			ya.emit("open", {})
		end
	end,
}
