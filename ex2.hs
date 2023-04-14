module Main where
import Drawing



lightBulb :: Color -> Double -> Drawing
-- parámetros c=color n=altura(eje y)
lightBulb c n = colored c (translated 0 n (solidCircle 1))
frame = colored gray (solidRectangle 2.5 7.5)
-- rectangulo de 2.5x7.5 --> centramos rojo en 2.5, amarillo 0, verde -2,5
trafficLight = frame <> lightBulb red 2.5 <> lightBulb yellow (0) <> lightBulb green (-2.5)


myDrawing :: Drawing
myDrawing = trafficLight


main :: IO()
-- main = putSvg myDrawing -->aqui lo tendriamos que redirigir en el terminal
main = writeSvgFile "ex2.svg" (coordinatePlane <> myDrawing)
