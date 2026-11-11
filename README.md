# Compiler Design — Lex and Yacc Exercises

A collection of small compiler-design lab exercises using Lex/Flex scanners and Yacc/Bison grammars. The repository contains token recognisers and parsers for arithmetic expressions, identifiers/numbers, nested `for` loops, function-like syntax, and related grammar exercises.

> **Project status:** Lab exercise collection. The repository contains individual scanner/parser examples and generated C artifacts; it is not one unified compiler or a complete C-language compiler.

## Exercises in the repository

- `for.l` + `for.y` — lexer and grammar for a restricted `for`-loop syntax; the grammar counts nested loop structures and reports an error for nesting beyond the supported grammar depth.
- `num.l` — recognises and counts positive / negative integers, decimals, and fraction-like numeric tokens.
- `exp.l` + `exp.y` — expression lexer/parser exercise.
- `function.l` + `function.y` — function-related token and grammar exercise.
- `gram.l`, `parser.y`, `target.l`, `target.y`, `three.l`, `three.y` — additional scanner / grammar exercises.
- `input.c`, `for.c`, and `for.txt` — sample input files.
- `lex.yy.c`, `y.tab.c`, `y.tab.h`, and `a.out` — generated build artifacts that are checked into the repository.

## Technology

- Lex / Flex for lexical analysis.
- Yacc / Bison for grammar parsing.
- GCC (or another compatible C compiler) to compile generated C source.
- C for generated scanner/parser code and sample inputs.

## Requirements

Install the following tools and make sure they are available in your terminal PATH:

- `flex` (or compatible `lex`)
- `bison` (or compatible `yacc`)
- `gcc`

On Debian / Ubuntu-based systems:

```bash
sudo apt update
sudo apt install flex bison build-essential
```

## Build and run the nested for-loop exercise

From the repository root:

```bash
yacc -d for.y
lex for.l
gcc y.tab.c lex.yy.c -o for_loop_parser
./for_loop_parser
```

Enter source text matching the restricted grammar. The parser is not designed to accept arbitrary C syntax.

## Build and run the number-token exercise

```bash
lex num.l
gcc lex.yy.c -o number_counter
./number_counter
```

Enter a sequence of numbers and finish input with Ctrl+D on Linux/macOS or the terminal's end-of-file shortcut on Windows.

Other exercises have their own `.l` and `.y` files. Build the relevant lexer/parser pair together, and inspect the grammar's `%token` declarations and scanner header includes before compiling.

## Limitations

- Each grammar recognises only a small language subset intended for a lab exercise.
- A successful parse does not imply full C syntax or semantic validation.
- Generated files such as `lex.yy.c`, `y.tab.c`, `y.tab.h`, and `a.out` depend on the Lex/Yacc versions and source files used to generate them. Prefer regenerating them locally rather than treating checked-in build output as canonical.
- The repository does not include a unified build system or automated test suite.

## License

See repository licensing and course / lab requirements.
