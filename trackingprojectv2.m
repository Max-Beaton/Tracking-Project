clc
clear all

planeXHIST=0;
planeYHIST=0;
tInt=1;
i=0;
t=0;
planeXPOS=0;
planeYPOS=0;


projectileXPOS=-50;
projectileYPOS=-50;
projectileXHIST=0;
projectileYHIST=0;


Imax=1;
Imin=-1;

figure
plot1 = plot(projectileXHIST,projectileYHIST,'b');
hold on
plot2 = plot(planeXHIST,planeYHIST,'r');
axis equal
grid on
plot3 = plot(projectileXPOS,projectileYPOS,'bo','MarkerFaceColor','b');
plot4 = plot(planeXPOS,planeYPOS,'ro','MarkerFaceColor','r');


while abs(planeXPOS - projectileXPOS) > 1e-3 || abs(planeYPOS - projectileYPOS) > 1e-3
    i=i+1;
    t(i)=i;
% makes X and Y a random step
    randomX=3*rand - 1;
    planeXPOS=planeXPOS+randomX;
    randomY=2*rand - 1;
    planeYPOS=planeYPOS+randomY;
    planeXHIST(i)=planeXPOS;
    planeYHIST(i)=planeYPOS;
% calculates where to go to
    %slope= (planeYPOS-projectileYPOS)/(planeXPOS-projectileXPOS);
    theta=atand((planeYPOS-projectileYPOS)/(planeXPOS-projectileXPOS));

% moves 1 step in the y direction if it is greater than one step away
if abs(planeXPOS-projectileXPOS)<1
    projectileXPOS=planeXPOS;
    projectileXHIST(i)=projectileXPOS;
else
    projectileXPOS=projectileXPOS+cosd(theta);
    projectileXHIST(i)=projectileXPOS;
end    
if abs(planeYPOS-projectileYPOS)<1
    projectileYPOS=planeYPOS;
    projectileYHIST(i)=projectileYPOS;
else
    projectileYPOS=projectileYPOS+sind(theta);
    projectileYHIST(i)=projectileYPOS;
end 
        
    set(plot1,'XData',projectileXHIST,'YData',projectileYHIST)
    set(plot2,'XData',planeXHIST,'YData',planeYHIST)

    set(plot3,'XData',projectileXPOS,'YData',projectileYPOS)
    set(plot4,'XData',planeXPOS,'YData',planeYPOS)
    drawnow
    pause(0.02)
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

plot5=plot(InterceptPlaneX,InterceptPlaneY,'blackx','MarkerSize',20);