# gerbil-crt
A Gerbil Scheme implementation of the Chinese Remainder Theorem, plus some other useful functions

Requires SRFI-1

## Background
While working on a side project, I needed the CRT function, but could not find any implementations online. 
This particular design was inspired by the Haskell entry in Rosetta code.

Also includes the zip-with function I've missed from Haskell.

## Usage
```scheme
(import :gerbil-crt/crt)

(crt '(10 4 12) '(11 12 13))

=> 1000
```

## Other Useful Functions
I've exported only the crt function, so as to not cause any symbol-clashes in other projects. If you find them useful, feel free to load them into your project. It's easy!
```scheme
(export crt)		<-- replace this line with
(export crt mod-exp)	<-- this one, adding other symbols as desired
```

## TODO
- Rewrite into Gerbil std build format, to make it easy to use in gxpkg (DONE)
- De-gerbilify code into R6RS/R7RS format for more Schemes! (shouldn't be too tricky - functions only require SRFI-1) 
