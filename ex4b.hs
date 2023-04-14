module Main where
import Drawing

-- Linea inicial
line = polyline [(0,0),(0,1)]

-- Siplemente cuando lleguemos al ultimo nivel(n=0) dibujamos un circulo amarillo
tree :: Int -> Drawing
tree 0 =  colored yellow (solidCircle 0.2)
tree n = line <> translated 0 1 (rotated (pi/10) (tree(n-1))) <> translated 0 1 (rotated (-pi/10) (tree(n-1)))

main :: IO()
main = writeSvgFile "ex4b.svg" (coordinatePlane <> tree 8)