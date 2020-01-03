# gerbil-crt
A Gerbil Scheme implementation of the Chinese Remainder Theorem, plus some other useful functions

Requires SRFI-1

## Background
While working on a side project, I needed the CRT function, but could not find any implementations online. 
This particular design was inspired by the Haskell entry in Rosetta code.

Also includes the zip-with function I've missed from Haskell.

## Usage
```scheme
(import "gerbil-crt")

(crt '(10 4 12) '(11 12 13))

=> 1000
```


## TODO
- Rewrite into Gerbil std build format, to make it easy to use in gxpkg
- De-gerbilify code into R5RS/R7RS format for more Schemes! (shouldn't be too tricky - functions only require SRFI-1) 
