clc
clear all
clear h1 h2 h3 h4
planeXHIST=0;
planeYHIST=0;
planeZHIST=0;
tInt=1;
i=0;
t=0;
planeXPOS=0;
planeYPOS=0;
planeZPOS=0;


projectileXPOS=50;
projectileYPOS=50;
projectileZPOS=50;
projectileXHIST=0;
projectileYHIST=0;
projectileZHIST=0;


Imax=1;
Imin=-1;

figure
hProjLine = plot3(projectileXHIST,projectileYHIST,projectileZHIST,'b');
hold on
hPlaneLine = plot3(0,0,0,'r');
axis equal
grid on
view(3)
hProjDot = plot3(projectileXPOS,projectileYPOS,projectileZPOS,'bo','MarkerFaceColor','b');
hPlaneDot = plot3(planeXPOS,planeYPOS,planeZPOS,'ro','MarkerFaceColor','r');
view(45,30)
xlabel X
ylabel Y
zlabel Z
legend('Projectile','Target')

while norm([planeXPOS-projectileXPOS,planeYPOS-projectileYPOS,planeZPOS-projectileZPOS]) > 1e-3
    i=i+1;
    t(i)=i;
% makes X Y and Z a random step
    randomX=4*rand - 1;
    planeXPOS=planeXPOS+randomX;
    randomY=2*rand - 1;
    planeYPOS=planeYPOS+randomY;
    randomZ=2*rand-1;
    planeZPOS=planeZPOS+randomZ;
    planeXHIST(i)=planeXPOS;
    planeYHIST(i)=planeYPOS;
    planeZHIST(i)=planeZPOS;

% calculates where to go to
  
   magnitude= sqrt(((planeXPOS-projectileXPOS)^2)+((planeYPOS-projectileYPOS)^2)+((planeZPOS-projectileZPOS)^2));
   UvecX=(planeXPOS-projectileXPOS)/magnitude;
   UvecY=(planeYPOS-projectileYPOS)/magnitude;
   UvecZ=(planeZPOS-projectileZPOS)/magnitude;
   UvecX=UvecX*2;
   UvecY=UvecY*2;
   UvecZ=UvecZ*2;


% moves 1 step in the y direction if it is greater than one step away
if abs(planeXPOS-projectileXPOS)<1
    projectileXPOS=planeXPOS;
    projectileXHIST(i)=projectileXPOS;
else
    projectileXPOS=projectileXPOS+UvecX;
    projectileXHIST(i)=projectileXPOS;
end    
if abs(planeYPOS-projectileYPOS)<1
    projectileYPOS=planeYPOS;
    projectileYHIST(i)=projectileYPOS;
else
    projectileYPOS=projectileYPOS+UvecY;
    projectileYHIST(i)=projectileYPOS;
end 
        
if abs(planeZPOS-projectileZPOS)<1
    projectileZPOS=planeZPOS;
    projectileZHIST(i)=projectileZPOS;
else
    projectileZPOS=projectileZPOS+UvecZ;
    projectileZHIST(i)=projectileZPOS;
end 
        
    set(hProjLine,'XData',projectileXHIST,'YData',projectileYHIST,'ZData',projectileZHIST)
    set(hPlaneLine,'XData',planeXHIST,'YData',planeYHIST,'ZData',planeZHIST)

    set(hProjDot,'XData',projectileXPOS,'YData',projectileYPOS,'ZData',projectileZPOS)
    set(hPlaneDot,'XData',planeXPOS,'YData',planeYPOS,'ZData',planeZPOS)
    drawnow
    pause(0.001)
end


%shows where It gets intercepted
projectileYHISTlength=length(projectileYHIST);
InterceptProjY=projectileYHIST(projectileYHISTlength)
projectileXHISTlength=length(projectileXHIST);
InterceptProjX=projectileXHIST(projectileXHISTlength)
planeYHISTlength=length(planeYHIST);
InterceptPlaneY=planeYHIST(planeYHISTlength)
planeXHISTlength=length(planeXHIST);
InterceptPlaneX=planeXHIST(planeXHISTlength)
planeZHISTlength=length(planeZHIST);
InterceptPlaneZ=planeZHIST(planeZHISTlength)

plot5=plot3(InterceptPlaneX,InterceptPlaneY,InterceptPlaneZ,'blackx','MarkerSize',20);
doneMesg=sprintf("The Target got intercepted at %.2f X, %.2f Y and %.2f Z",InterceptPlaneX,InterceptPlaneY,InterceptPlaneZ);
title(doneMesg)