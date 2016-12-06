# Wizard

Wizard is a math expression processor that is intended to do fast number
crunching.

All internal calculations are done using the C _double_ data type.

Wizard is NOT a plug in replacement for progams such as _bc_. It's NOT even a
full programming language.  There is no flow control, and the only variable is
**.**, which like in _bc_ represents the last numerical result.

Wizard is written in ANSI-C, using Bison and Flex.

## Building and Installing Wizard

To build Wizard, you will need _gcc_, _flex_, _bison_ and _make_.  It is built
and tested on a Fedora Linux system, but shoud build on any UNIX like system
that has the needed components installed however.

To actually build it, simply:

_make all_

Then copy the wizard binary to someplace in your path.

## Using Wizard

Wizard can be run interactively, in a pipe or with a file handed to it on the
command line or with the shebang ( **#!** ) in scripts.

The language is simple:

```
<number> <op> <number>
<function> <number>
"<string>"

```

White space can be used to separate operations, functions, and numbers, but is
optional.

You can use ()'s any place and they can be nested, but cannot span lines. See
below for more details about using ()'s and precedence.

A number can be just about any format that the C library understands.

Operators are +, -, *, /, ^.

There are currently 2 constants that wizard knows about: _pi_, and _e_.

Functions are as follows:

	sqrt - square root
	cbrt - cube root

	log - log
	exp - natural log

	cos - cosine
	sin - sine
	tan - tangent
	acos - inverse of cos
	asin - inverse of sin
	atan - inverse of tan

	rad - converts degrees to radians
	deg - converts radians to degrees

	rnd - return a random number upto the number specified

The value to trig functions must be in radians. Functions can be nested, so you
can use the rad function to convert degrees to radians, ie: **sin rad 90**.  

**()**'s are optional, even with functions, but pay attention to the order of
precedence.

Order of precedence, for the most part, is normally what you'd expect from
solving arithmetic problems.  BUT, and that's a **BIG BUT**, make no
assumptions.  If you want to be 100% sure use **()**'s.

Some examples of where things might not be what they seem to be and you really want to use **()**:

what you ...

|  entered  | actually got | probably wanted |
|:---------:|:------------:|:---------------:|
| 6/2*(2+1) |  6*(2+1)/2   |   6/(2*(2+1))   |
| sin pi/2  | (sin pi)/2   |    sin(pi/2)    |
| sqrt -1^2 | sqrt (-1^2)  |   sqrt (-1^2)   |

The last one probably being the only one that gave you what you really wanted,
but shows the clarity that using **()** can make and it's can be a big
difference.  

Stings are anything in quotes, **" "**'s. They are literal, can contain any
printable character, but cannot span lines. A null string, **""** will print a
new line.

You can use a **#** for comments like many other languages. They can appear
anywhere on the line, but anything on the line after the **#** is ignored.

_ctrl-d_ or _q_ will exit, if being run interactively.

See _example.w_ for more examples.

When possible, the results in example.w were double checked against the _bc_
program and/or a Casio fx-115ES and Prizm Calculators.

Also included is a file of shell functions, _wizard.sh_ that can be sourced to provdie
access to the wizard commands conviently from the shell, or even a shell script.

An couple of examples:

_rnd 10_

_echo $pi_

_sin $(rnd $pi)_

## License

Wizard is covered under the GNU General Public License v2.

(c) 2015 Derrik Walker v2.0, dwalker@doomd.net
