/**
 * Pony TTY Library
 * Copyright (c) 2018 - Stewart Gebbie. Licensed under the MIT licence.
 * vim: set ts=2 sw=0:
 */

use @isatty[I32](fd: I32) if posix
use @pony_os_errno[I32]()

// see https://en.wikipedia.org/wiki/ANSI_escape_code#Colors 8 colour mode
// ESC[ … 38;2;<r>;<g>;<b> … m Select RGB foreground color
// ESC[ … 48;2;<r>;<g>;<b> … m Select RGB background color

// basic flags

primitive ANSIReset
	fun apply(): String => "\u001B[0m"
primitive ANSIBold
	fun apply(): String => "\u001B[1m"
primitive ANSIUnderline
	fun apply(): String => "\u001B[4m"
primitive ANSIInverse
	fun apply(): String => "\u001B[7m"

primitive ANSIResetColour
	fun apply(): String => "\u001B[39;49m"

primitive ANSIBLACK
	fun apply(): String =>"\u001B[30m"
primitive ANSIRed
	fun apply(): String => "\u001B[31m"
primitive ANSIGreen
	fun apply(): String => "\u001B[32m"
primitive ANSIYellow
	fun apply(): String => "\u001B[33m"
primitive ANSIBlue
	fun apply(): String => "\u001B[34m"
primitive ANSIMagenta
	fun apply(): String => "\u001B[35m"
primitive ANSICyan
	fun apply(): String => "\u001B[36m"
primitive ANSIWhite
	fun apply(): String => "\u001B[37m"

primitive ANSIBrightBlack
	fun apply(): String =>"\u001B[30;1m"
primitive ANSIBrightRed
	fun apply(): String => "\u001B[31;1m"
primitive ANSIBrightGreen
	fun apply(): String => "\u001B[32;1m"
primitive ANSIBrightYellow
	fun apply(): String => "\u001B[33;1m"
primitive ANSIBrightBlue
	fun apply(): String => "\u001B[34;1m"
primitive ANSIBrightMagenta
	fun apply(): String => "\u001B[35;1m"
primitive ANSIBrightCyan
	fun apply(): String => "\u001B[36;1m"
primitive ANSIBrightWhite
	fun apply(): String => "\u001B[37;1m"

primitive ANSIRGBGrey
	fun apply(): String => "\u001B[38;2;95;95;95m"
primitive ANSIRGBOrange
	fun apply(): String => "\u001B[38;2;255;155;30m"
primitive ANSIRGBDarkGreen
	fun apply(): String => "\u001B[38;2;20;155;30m"
primitive ANSI256Grey
	fun apply(): String => "\u001B[38;5;240m"
primitive ANSI256Orange
	fun apply(): String => "\u001B[38;5;166m"
primitive ANSI256DarkGreen
	fun apply(): String => "\u001B[38;5;22m"

primitive TTY
	""" Utilities related to interacting with a TTY. """

	fun isatty(fd: I32 = 1): Bool =>
		"""
		Test if the given file descriptor is connected to a Unix TTY.

		Defaults to testing file descriptor 1 which would normally be `stdout`.
		"""

		ifdef posix then
			let r = @isatty(fd)
			if r == 1 then
				true
			else
				let e = @pony_os_errno()
				false
			end
		else
			false
		end
