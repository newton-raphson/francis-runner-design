Vo=0.225; % in m^3/s
H=12;  % in m
nrpm=750; %in rpm
nr=2*pi*nrpm/60; %in rad per second
N=3;

[no,R2e,Bo,Roi,Ymi,Rli,Roe,Li,Le,X2e,Y2e,Yme,Rme]= meridoinaldim (Vo,H,nr,N);
[x1,y1,x2,y2,x,y,LE1,LE2,TE1,TE2,xl,yl,xt,yt]=meri_lines(Vo,H,nr,N);

[lead_zr trail_zr hub_1_zr hub_2_zr hub_3_zr shroud_1_zr shroud_2_zr shroud_3_zr] = bladegen(x1,y1,x2,y2,xl,yl,xt,yt);

lead_zr=[lead_zr(:,2) lead_zr(:,1)];

trail_zr=[trail_zr(:,2) trail_zr(:,1)];
%%saveas(gcf,'Flow250_1500.jpg')