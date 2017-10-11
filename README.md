# Zonenplatte
Zone plate pattern generator.

# Usage
```
ZONENPLATTE Generate zone plate pattern

Usage:
  Result = ZONENPLATTE(Radius, PatternType, Function, MaxFrequency, SquareWave)

Examples:
  pattern1 = ZONENPLATTE;
  pattern2 = ZONENPLATTE(256, 'circular, 'sin', pi, false);

Input:
  Radius: pattern radius, default 256
  PatternType: pattern type: 'circular' or 'hyperbolical', default 'circular'
  Function: pattern function: 'sin' or 'cos', default 'sin'
  MaxFrequency: max frequency, default pi
  SquareWave: use square wave instead of sine, default false

Output:
  Result: pattern image
    type: double
    dimensions: (Radius * 2) + 1 rows and columns
    values range: [0 1]
```

For more info see [zonenplatte_example.m](https://github.com/0x414c/zonenplatte/blob/master/zonenplatte_example.m) and [zonenplatte.m](https://github.com/0x414c/zonenplatte/blob/master/zonenplatte.m).

# Patterns
Both circular and hyperbolical variants are supported:

![Circular zone plate](https://github.com/0x414c/zonenplatte/raw/master/Patterns/Zonenplatte-r256-tcircular-fsin.png)

![Hyperbolical zone plate](https://github.com/0x414c/zonenplatte/raw/master/Patterns/Zonenplatte-r256-thyperbolical-fsin.png)

![Circular square wave zone plate](https://github.com/0x414c/zonenplatte/raw/master/Patterns/Zonenplatte-r256-tcircular-fcos-sq.png)

![Hyperbolical square wave zone plate](https://github.com/0x414c/zonenplatte/raw/master/Patterns/Zonenplatte-r256-thyperbolical-fcos-sq.png)
