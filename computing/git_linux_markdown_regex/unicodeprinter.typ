#set text(blue)

#let dec2hex(num) = {
	let digits = "0123456789abcdef"
	let hex = ""
	let rem = 0
	while true {
		rem = calc.rem(num, 16)
		hex = digits.at(rem) + hex
		num = calc.quo(num, 16)
		if num < 16 {
			hex = digits.at(num) + hex
			break}}
	return hex}

#let row_idx(start, end) = {
	let rowIdx = ()
	while start < end {
		rowIdx.push(dec2hex(start).slice(0,-1))
		start = start + 16}
	return rowIdx}

#let unicode_printer_no_axis(start, end) = {
	grid(columns: 16, gutter: 12pt, 
		..range(start, end).map(str.from-unicode))}

#let unicode_printer(start, end) = {
	let header = "0123456789abcdef".split("").slice(0,-1)
	
	let item = ()
	let rowIdx = 0
	let middle = start

	// special case: first line
	let itemEmpty = ()
	while dec2hex(middle).at(-1) != "0" {
		itemEmpty.push("")
		middle = middle -1}

	let leader = row_idx(middle, end)
	item.push(leader.at(rowIdx))
	
	if itemEmpty.len() > 0 {item.push(itemEmpty)}

	middle = middle + 16
	item.push(range(start, middle).map(str.from-unicode))
	// first row done

	while middle < end {
		rowIdx = rowIdx + 1
		start = middle
		middle = middle + 16

		item.push(leader.at(rowIdx))

		if middle >= end {middle = end}  // special case: last line
		item.push(range(start, middle).map(str.from-unicode))}

	grid(columns: 17, gutter: 12pt, 
		grid.header(..header),
		..item.flatten())}

#line(length:100%)
#unicode_printer(9728, 10064)  // 2600~274f
//invalid unicode (55296, 57344)  // (0xd800, 0xdfff)
#line(length:100%)
#unicode_printer(61398, 62177)  // efd6~f2e0
#line(length:100%)
#unicode_printer(127744, 129202)  // 1f300~1f8b1
#line(length:100%)
#unicode_printer(129280, 129785)  // 1f900~1faf8
