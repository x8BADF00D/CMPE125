`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2020 10:43:06 PM
// Design Name: 
// Module Name: CLA
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CLA(a, b, c0, y, cout, y3, y4, cr);
input [3:0] a;
input [3:0] b;
input c0;
output reg [3:0] y;
output reg cout;
output reg [3:0] y3;
output reg y4;
output reg cr;

reg [1:4] c;
reg [0:3] g;
reg [0:3] p;

integer i;
integer j;

always @ (*)
begin
    cr = c0;
    for (i = 0; i < 4; i = i + 1)
    begin
        p[i] = a[i] ^ b[i];
        g[i] = a[i] & b[i];
    end

    c[1] = g[0] || (p[0] & c0);
    c[2] = g[1] || (p[1] & (g[0] || p[0] & c0));
    c[3] = g[2] || (p[2] & (g[1] || (p[1] & (g[0] || (p[0] & c0)))));
    c[4] = g[3] || (p[3] & (g[2] || (p[2] & (g[1] + (p[1] & (g[0] || (p[0] & c0)))))));
    cout = c[4];

    for (i = 1; i < 4; i = i + 1)
    begin
        y[i] = p[i] ^ c[i];
    end
    y[0] = p[0] ^ c0;
    
    if(y <= 9)
    begin
        y3 = y;
        y4 = 0;
    end
    if(y > 9)
    begin
        y3 = y - 10;
        y4 = 1;
    end
end
endmodule

/*
    y[3] = (a[3] ^ b[3]) ^ ((a[2] & b[2]) || ((a[2] ^ b[2]) & a[1] & b[1]) || ((a[2] ^ b[2]) & (a[1] ^ b[1]) & a[0] & b[0]) || ((a[2] ^ b[2]) & (a[1] ^ b[1]) & (a[0] ^ b[0]) & c0));
    y[2] = (a[2] ^ b[2]) ^ ((a[1] & b[1]) || ((a[1] ^ b[1]) & a[0] & b[0]) || ((a[1] ^ b[1]) & (a[0] ^ b[0]) & c0));
    y[1] = (a[1] ^ b[1]) ^ ((a[0] & b[0]) || (a[0] ^ b[0]));
    y[0] = (a[0] ^ b[0]) ^ c0;
    cout = (a[3] & b[3]) || ((a[3] ^ b[3]) & a[2] & b[2]) || ((a[3] ^ b[3]) & (a[2] ^ b[2]) & a[1] & b[1]) || ((a[3] ^ b[3]) & (a[2] ^ b[2]) & (a[1] ^ b[1]) & a[0] & b[0]) || ((a[3] ^ b[3]) & (a[2] ^ b[2]) & (a[1] ^ b[1]) & (a[0] ^ b[0]) & c0);
*/


/*
c0 = c0
c1 = g0 + p0c0
c2 = g1 + p1(g0 + p0c0)
c3 = g2 + p2(g1 + p1(g0 + p0c0))
c4 = g3 + p3(g2 + p2(g1 + p1(g0 + p0c0)))

c0 = c0

c1 =                            g0 +       p0c0
c2 =                 g1 +     p1g0 +     p1p0c0
c3 =        g2 +   p2g1 +   p2p1g0 +   p2p1p0c0
c4 = g3 + p3g2 + p3p2g1 + p3p2p1g0 + p3p2p1p0c0

****************************************************************

si = pi ^ ci

ci+1 = ai & bi
si = ai ^ bi

****************************************************************

p3 = a3 ^ b3
g3 = a3b3

p2 = a2 ^ b2
g2 = a2b2

p1 = a1 ^ b1
g1 = a1b1

p0 = a0 ^ b0
g0 = a0b0

y[3] = p3 ^ c3
y[3] = p3        ^ (  g2 +   p2g1          + p2p1g0                 + p2p1p0c0)
y[3] = (a3 ^ b3) ^ (a2b2 +   (a2 ^ b2)a1b1 + (a2 ^ b2)(a1 ^ b1)a0b0 + (a2 ^ b2)(a1 ^ b1)(a0 ^ b0)c0)
y[3] = (a[3] ^ b[3]) ^ ((a[2] & b[2]) || ((a[2] ^ b[2]) & a[1] & b[1]) || ((a[2] ^ b[2]) & (a[1] ^ b[1]) & a[0] & b[0]) || ((a[2] ^ b[2]) & (a[1] ^ b[1]) & (a[0] ^ b[0]) & c0))

y[2] = p2 ^ c2
y[2] = p2 ^ (g1   +  p1       g0   + p1       p0      c0)
y[2] = p2 ^ (a1b1 + (a1 ^ b1)a0b0 + (a1 ^ b1)(a0 ^ b0)c0)
y[2] = (a[2] ^ b[2]) ^ ((a[1] & b[1]) || ((a[1] ^ b[1]) & a[0] & b[0]) || ((a[1] ^ b[1]) & (a[0] ^ b[0])c0))

y[1] = p1 ^ c1
y[1] = p1 ^ (g0   +  p0c0)
y[1] = p1 ^ (a0b0 + (a0 ^ b0))
y[1] = (a[1] ^ b[1]) ^ ((a[0] & b[0]) || (a[0] ^ b[0]))

y[o] = p0        ^ c0
y[o] = (a0 ^ b0) ^ c0
y[o] = (a[0] ^ b[0]) ^ c0

cout = c4
cout = g3   +  p3      g2   +  p3       p2      g1   +  p3       p2       p1      g0   +  p3       p2       p1       p0      c0
cout = a3b3 + (a3 ^ b3)a2b2 + (a3 ^ b3)(a2 ^ b2)a1b1 + (a3 ^ b3)(a2 ^ b2)(a1 ^ b1)a0b0 + (a3 ^ b3)(a2 ^ b2)(a1 ^ b1)(a0 ^ b0)c0
cout = (a[3] & b[3]) || ((a[3] ^ b[3]) & a[2] & b[2]) || ((a[3] ^ b[3]) & (a[2] ^ b[2]) & a[1] & b[1]) || ((a[3] ^ b[3]) & (a[2] ^ b[2]) & (a[1] ^ b[1]) & a[0] & b[0]) || ((a[3] ^ b[3]) & (a[2] ^ b[2]) & (a[1] ^ b[1]) & (a[0] ^ b[0]) & c0)
*/