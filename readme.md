# TTY Utilities

`TTY.isatty(n)` can be used to test if the file descriptor `n` is connected to a
terminal or not.

Obviously this requires knowing the "raw" file descriptor number. However, for
the common use case it is easy to guess that you are considering:

- 0 : stdin
- 1 : stdout
- 2 : stderr

And this is mostly aimed at testing of `stdout` is being piped elsewhere, or is
connected to a terminal that supports colour, or other specialised terminal
operations.

## Mode Constants

The library also contains a range of `ANSI` constants for common colours, or
common modes e.g. bold, underline, reset.
