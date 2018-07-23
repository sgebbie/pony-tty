/**
 * Pony TTY Library
 * Copyright (c) 2018 - Stewart Gebbie. Licensed under the MIT licence.
 * vim: set ts=2 sw=0:
 */
use "ponytest"
use "itertools"

actor Main is TestList
	new create(env: Env) =>
			PonyTest(env, this)

	new make() =>
		None

	fun tag tests(test: PonyTest) =>
		test(_TestIsATty)

class iso _TestIsATty is UnitTest
	"""Tests basic isatty, assumming that unit tests have been run from a terminal. """

	new iso create() => None

	fun name(): String => "tty:isatty"

	fun tear_down(h: TestHelper) => None

	fun ref apply(h: TestHelper) =>
		// This test is more for demostrative purposes, since it is difficult to know for sure that
		// the unit test was in fact run against a terminal.
		h.assert_true(TTY.isatty())

		h.env.out.print(
			  ANSIBlue() + "H"
			+ ANSIRed() + "e"
			+ ANSIYellow() + "l"
			+ ANSIBlue() + "l"
			+ ANSIGreen() + "o"
			+ ANSIResetColour() + " "
			+ ANSIBold()
			+ ANSIRGBOrange() + "W"
			+ ANSI256Grey() + "o"
			+ ANSIRGBDarkGreen() + ANSIInverse() + "r"
			+ ANSIReset() + ANSI256Grey() + ANSIUnderline() + "l"
			+ ANSIReset() + ANSIRGBOrange() + "d"
			+ ANSIReset() + "!"
		)
