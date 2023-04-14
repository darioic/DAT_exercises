module Main where
import Drawing

-- Linea inicial
line = polyline [(0,0),(0,1)]

-- Vamos construyendo sobre cada linea dos más, una con angulo -pi/10 y otro pi/10 y asi hasta llegar al octavo nivel(n)
tree :: Int -> Drawing
tree 0 = blank
tree n = line <> translated 0 1 (rotated (pi/10) (tree(n-1))) <> translated 0 1 (rotated (-pi/10) (tree(n-1)))
-- si n!=0 dibujamos una linea encima de la anterior y la rotamos +-pi/10 y vamos obteniendo las ramas


main :: IO()
main = writeSvgFile "ex4a.svg" (coordinatePlane <> tree 8)
