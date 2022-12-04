function [lead_zr trail_zr hub_1_zr hub_2_zr hub_3_zr shroud_1_zr shroud_2_zr shroud_3_zr] = bladegen(x1,y1,x2,y2,xl,yl,xt,yt)
tmp_m=zeros(numel(x1),1);
tmp_m=tmp_m+yl(1,1);
hub_zr=[y1' (tmp_m-x1')];
shroud_zr=[y2' (tmp_m-x2')];
lead_zr=[xl' (tmp_m-yl')];
trail_zr=[xt' (tmp_m-yt')];
%hub curve in three pieces
[a b]=min((hub_zr(:,1)-lead_zr(1,1)).^2); %finding nearest point in hub and le
[p q ]=min((hub_zr(:,1)-trail_zr(1,1)).^2);%finding nearest point in hub and te
hub_zr(b,:)=lead_zr(1,:);  %replacing hub point with le point at b
hub_zr(q,:)=trail_zr(1,:); %replacing hub point with te point at y
hub_1_zr= hub_zr(1:b,:);   %definig hub into 3 curves
hub_2_zr=hub_zr(b:q,:);
hub_3_zr=hub_zr(q:end,:);

%shroud curve in three pieces

[a b]=min((shroud_zr(:,1)-lead_zr(end,1)).^2+(shroud_zr(:,2)-lead_zr(end,2)).^2) %finding nearest point in shroud and le
[p q]=min((shroud_zr(:,1)-trail_zr(end,1)).^2+(shroud_zr(:,2)-trail_zr(end,2)).^2)%finding nearest point in shroud and te
shroud_zr(b,:)=lead_zr(end,:);  %replacing shroud point with le point at b
shroud_zr(q,:)=trail_zr(end,:); %replacing shroud point with te point at y
shroud_1_zr= shroud_zr(1:b,:);   %definig shroud into 3 curves
shroud_2_zr=shroud_zr(b:q,:);
shroud_3_zr=shroud_zr(q:end,:);


hub_1_zr=[hub_1_zr(:,2) hub_1_zr(:,1)];   %definig hub into 3 curves
hub_2_zr=[hub_2_zr(:,2) hub_2_zr(:,1)];
hub_3_zr=[hub_3_zr(:,2) hub_3_zr(:,1)];

shroud_1_zr=[shroud_1_zr(:,2) shroud_1_zr(:,1)];
%definig shroud into 3 curves
shroud_2_zr=[shroud_2_zr(:,2) shroud_2_zr(:,1)];
shroud_3_zr=[shroud_3_zr(:,2) shroud_3_zr(:,1)];



end