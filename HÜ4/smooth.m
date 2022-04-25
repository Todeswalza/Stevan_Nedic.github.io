(* ::Package:: *)

pn(* ::Package:: *)

bild = Import["C:\\Users\\akash\\Desktop\\Neuer Ordner\\WAP PPT\\H\[CapitalUDoubleDot]4\\Dice.jpg"];
bild = ColorConvert[bild,"Grayscale"];
pixel = ImageData[bild,"Byte"];

bild3x3=OpenWrite["bild3x3.pgm"];
WriteString[bild3x3,"P2 \n",Last[Dimensions[pixel]]," ",First[Dimensions[pixel]],"\n255\n"];

bild5x5=OpenWrite["bild5x5.pgm"];
WriteString[bild5x5,"P2 \n",Last[Dimensions[pixel]]," ",First[Dimensions[pixel]],"\n255\n"];

bild7x7=OpenWrite["bild7x7.pgm"];
WriteString[bild7x7,"P2 \n",Last[Dimensions[pixel]]," ",First[Dimensions[pixel]],"\n255\n"];




For[i=1, i<= First[Dimensions[pixel]],i++, 
	For[j=1, j<=Last[Dimensions[pixel]],j++,
		If [i >= 1 && j >= 1 && i+2 <= First[Dimensions[pixel]] && j+2 <= Last[Dimensions[pixel]],
		
			WriteString[bild3x3,Round[Total[Total[Take[pixel,{i,i+2},{j,j+2}]]]/9]," "],
			
			WriteString[bild3x3,Round[Total[Total[Take[pixel,{i},{j}]]]]," "];

		]
	]
]
Close[bild3x3];

For[i=1, i<= First[Dimensions[pixel]],i++, 
	For[j=1, j<=Last[Dimensions[pixel]],j++,
		If [i >= 1 && j >= 1 && i+4 <= First[Dimensions[pixel]] && j+4 <= Last[Dimensions[pixel]],
		
			WriteString[bild5x5,Round[Total[Total[Take[pixel,{i,i+4},{j,j+4}]]]/25]," "],
			
			WriteString[bild5x5,Round[Total[Total[Take[pixel,{i},{j}]]]]," "];

		]
	]
]
Close[bild5x5];

For[i=1, i<= First[Dimensions[pixel]],i++, 
	For[j=1, j<=Last[Dimensions[pixel]],j++,
		If [i >= 1 && j >= 1 && i+6 <= First[Dimensions[pixel]] && j+6 <= Last[Dimensions[pixel]],
		
			WriteString[bild7x7,Round[Total[Total[Take[pixel,{i,i+6},{j,j+6}]]]/49]," "],
			
			WriteString[bild7x7,Round[Total[Total[Take[pixel,{i},{j}]]]]," "];

		]
	]
]
Close[bild7x7];





