module Main where
import Drawing

-- Funcions exercici 3
lightBulb :: Color -> Double -> Drawing
lightBulb c n = colored c (translated 0 n (solidCircle 1))

frame = colored gray (solidRectangle 2.5 7.5)
trafficLight = frame <> lightBulb red 2.5 <> lightBulb yellow (0) <> lightBulb green (-2.5)

light1 :: Int -> Int -> Drawing
light1 r c = translated (3 * fromIntegral c) (8 * fromIntegral r) trafficLight  

-- Retorna n copias del semaforo, el primer argumento es una funcion thing que tiene como parametro un entero
repeatDraw :: (Int -> Drawing) -> Int -> Drawing    
repeatDraw thing 0 = blank
repeatDraw thing n = thing n <> repeatDraw thing(n-1)

-- genera 5 semaforos en una fila r
lightRow :: Int -> Drawing
lightRow r = repeatDraw (light1 r) 5

-- repeatDraw lightRow 3 produce un Drawing basasdo en 3 copias del drawing producido por lightRow
--Funcionamiento
-- lightRow 3 --> repeatDraw(light1 3) 5  en la col3 dibujamos 5 semaforos
-- lightRow 2 --> repeatDraw(light1 2) 5  en la col2 dibujamos 5 semaforos
-- lightRow 1--> repeatDraw(light1 1) 5   en la  col1 dibujamos 5 semaforos
myDrawing = translated (-10) (-15) (repeatDraw lightRow 3) 

main :: IO()
main = writeSvgFile "ex5.svg" (coordinatePlane <> myDrawing)
