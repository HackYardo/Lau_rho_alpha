#set text(lime)

#let id = (0,1,2,3,4,5,6,7,8,9,"a","b","c","d","e","f")
#let unicode_printer(start, end) = {
	grid(columns: 16, gutter: 5pt,
		..range(start, end).map(str.from-unicode))}

#unicode_printer(9728, 10064)
//#unicode_printer(55296, 57344)  // invalid unicode: (0xd800, 0xdfff)
#unicode_printer(61398, 62178)
#unicode_printer(127744, 129785)
//#unicode_printer(127744, 127882)
