This is an experiment to see how well symbols can be used for the documentating of functions.

In `src/Main.purs` you will find `showing`: which is an example of a documented version of `show`.

There are two example `main` functions.  The first with `showing 42` demonstrates that the documented function can behave just like `show`.  The second demonstrates the `describe` functionality.  Using `describe` we cause a compiler error which prints out the documentation for the function.  This can also be invoked in psci:

```
> describe showing
Error found:
in module $PSCI
at  line 1, column 1 - line 1, column 10

  A custom type error occurred while solving type class constraints:


  `showing` is documented version of show

  An example usage is:

    > showing 42
    = "42"

    > describe showing 42
    should print this documentation

```
