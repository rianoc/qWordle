// Get a dictionary
d:"\n" vs .Q.hg "http://wiki.puzzlers.org/pub/wordlists/unixdict.txt"
// Only keep 5 letter words
d:d where 5=count each d

// Colours for printing
G:"\033[1;32m" // Green
Y:"\033[1;33m" // Yellow
W:"\033[1;37m" // White
R:"\033[0;31m" //Red

// Add colour to text
o:{x,y,W}

// Clear screen
cs:{-1 system"clear"};

s:{-1 o[""]"To play type: start"};
e:{-1 o[""]"To stop type: end"};
s[];
e[];

r:{
 i::0;
 m::6 5#enlist "_";
 w::rand d;
 s::0b;
 };

r[];

p:{-1 raze each m};

g:{[c]
 cs[];
 if[j:c~w;p[];-1 o[G]"** Correct in ",string[i+1]," goes **"];
 if[not 5=count c;p[];-1 o[R]"Choice must be 5 letters";:(::)];
 if[not c in d;p[];-1 o[R]"That's not a word!!";:(::)];
 a:enlist each c;
 a:?[c in w;?[c=w;o[G] each a;o[Y] each a];a];
 m[i]:a;
 p[];
 if[j;r[];:(::)];
 i+:1;
 if[i=6;-1 o[R]"Game over, word was: ",w;r[]];
 }
 
.z.pi:{
 x:-1_x;
 $[not[s] and x~"start";
    [r[];s::1b;cs[];:-1 "Take a guess:"];
   s and x~"end";[r[]];
   s;:g x;   
	:1 .Q.s value x,"\n"
  ];
 }