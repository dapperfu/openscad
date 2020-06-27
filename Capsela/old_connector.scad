module hexagon(r=1,h=1,x=0,y=0){
linear_extrude(height = h) {
polygon(points=[[(r+x),(r*(tan(30)))+y],
                [x,(r*(2/sqrt(3)))+y],
                [-r+x,(r*(tan(30)))+y],
                [-
    r+x,-(r*(tan(30)))+y],
                [x,-(r*(2/sqrt(3)))+y], 
                [r+x,-(r*(tan(30)))+y]]);
         
 }
 }
 
d = (13.57+13.62+13.55)/3;
r = d/2;
R = r/cos(30);
R2 = R+2;

L = 20;
difference() {
cylinder(h=L, r=R2+5, center=false);
cylinder(h=L, r=R2, center=false);

}

difference() {
color("blue") {
hexagon(R+2,L, 0,0);
}
hexagon(R,L, 0,0);
}
