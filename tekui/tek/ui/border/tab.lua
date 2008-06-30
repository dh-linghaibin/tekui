
--
--	tek.ui.class.border.tab
--	Written by Timm S. Mueller <tmueller at schulze-mueller.de>
--	See copyright notice in COPYRIGHT
--

local ui = require "tek.ui"
local unpack = unpack

module("tek.ui.border.tab", tek.ui.class.border)
_VERSION = "TabBorder 1.0"

-------------------------------------------------------------------------------
--	Constants & Class data:
-------------------------------------------------------------------------------

local DEF_BORDER = { 2, 2, 2, 2 }

-------------------------------------------------------------------------------
-- Class implementation:
-------------------------------------------------------------------------------

local Tab = _M

function Tab:getBorder(element, border)
	return unpack(border or element.Display.Theme.BorderTabBorder or
		DEF_BORDER)
end

function Tab:draw(element, border, r1, r2, r3, r4)
	local b1, b2, b3, b4 = self:getBorder(element, border)
	local d = element.Drawable
	local p1, p2
	if element.Selected then
		p1, p2 = d.Pens[ui.PEN_HALFSHINE], d.Pens[ui.PEN_HALFSHADOW]
	else
		p1, p2 = d.Pens[ui.PEN_HALFSHADOW], d.Pens[ui.PEN_HALFSHINE]
	end
	d:fillRect(r1 - b1, r2 - b2, r3 + b3, r2 - 1, p1)
	d:fillRect(r3 + 1, r2, r3 + b3, r4 + b4, p2)
	d:fillRect(r1 - b1, r4 + 1, r3 + b3, r4 + b4, d.Pens[ui.PEN_GROUPBACK])
	d:fillRect(r1 - b1, r2, r1 - 1, r4, p1)
end
