#set text(maroon)

#let unicode_printer(start, end) = {
	grid(columns: 16, gutter: 5pt,
		..range(start, end).map(str.from-unicode))}

#unicode_printer(9728, 10064)
//#unicode_printer(55296, 57344)  // invalid unicode: (0xd800, 0xdfff)
#unicode_printer(61398, 62178)
#unicode_printer(127744, 129785)
