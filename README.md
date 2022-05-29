# metalogo
metaprogramming in logo

# Logo designed to easily draw itself

## definition

The default unit is 2π (two times pi), or τ (tau).
Division is done with the `N` reciprocal instruction.
Square brackets quote instructions for passing to a repeat command.
Repeat instructions are polygons, where the multiplier comes from the number of sides.
Note that polygons also multiply, so △△ is 3 * 3, or 9.

- turn right turns 2π, or 360 degrees
- turn left turns 2π, or 360 degrees
- forward goes π (6.28) pixels forward
- N gives the reciprocal of the repeat quantity, or in the case of of a single instruction, scales it down. Thus N △ ^ is the reciprocal of 3, times the normal forward amount of 6.28, or forward 2.94

## examples
- name :: symbol
  symbols used to draw this symbol
  logo source to draw this symbol
- forward :: ^
  - ^ N △ ⌈ ^
  - forward 6.28 right (1/3 * 360) forward 6.28
- turn right :: ⌈
  - ^ ^ N ⌷ ⌈ ^
  - forward 6.28 forward 6.28 right (1/4 * 360) forward 6.28
- turn left :: ⌉
  - ^ ^ N ⌷ ⌉ ^
  - forward 6.28 forward 6.28 left (1/4 * 360) forward 6.28
- repeat twice :: |
  - |
  - forward 6.28
- repeat three times :: △
  - △ [ ^ N ⌷ ⌈ ]
  - repeat 3 [ forward 6.28 right (1/4 * 360) ]
- repeat six times :: ⎔
  - ⎔ [ ^ N ⎔ ⌈ ]
  - repeat 6 [ forward 6.28 right (1/6 * 360) ]
- repeat four times :: ⌷
  - ⌷ [ ^ N ⌷ ⌈ ]
  - repeat 4 [ forward 6.28 right (1/4 * 360) ]
- repeat 5 times :: ⬠
  - ⬠ [ ^ N ⬠ ⌈ ]
  - repeat 5 [ forward 6.28 right (1/5 * 360) ]
- repeat 8 times :: ⯃
  - ⯃ [ ^ N ⯃ ⌈ ]
  - repeat 8 [ forward 6.28 right (1/8 * 360) ]
- penup :: ○
  - |||△△⬠ [ ^ N |||△△⬠ ⌈ ]
  - repeat 360 [ forward 6.28 right (1/360 * 360) ]
- pendown :: ⍉
  - |||△△⬠ [ ^ N |||△△⬠ ⌈ ] | N ⌈ ^
  - repeat 360 [ forward 6.28 right (1/360 * 360) ] right (1/2 * 360) forward 6.28
