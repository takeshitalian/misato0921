%Misato Takeshita
%This is the first coding assignment.
%reference to beating cartoon heart, blog, MathWorks

L = 2.5; N = 40;
M = [0:(N/2) (-N/2):(-1)]';
clf; kx = 2*pi*M/L;
[Kx,Ky,Kz] = meshgrid(kx,kx,kx);
x = -L/2:L/N:L/2;
[X,Y,Z] = meshgrid(x,x,x);
Phi = 2-(2*X.^2 + Y.^2 + Z.^2 -1).^3 + 0.2*X.^2.*Z.^3 + Y.^2.*Z.^3;
Phihat = fftn(Phi);
gam = 0.01*(-Kx.^2-Ky.^2-Kz.^2);
t1 = 0:0.05:1;
t1 = [t1 fliplr(t1) t1 fliplr(t1) t1 fliplr(t1) t1 fliplr(t1) t1 fliplr(t1)];
clf;
set(gcf,'color','w');
t = 1;
Phi = ifftn(Phihat.*exp(gam*t1(t)));
isosurface(Phi,2);
lighting phong;
colormap([1 0 0]);
axis([0 N+N/4 0+-10 N+N/4 0 N+N/4]);
view(-63,12); box off;
grid on
set(gca,'XTick',[],'YTick',[],'ZTick',[],...
    'xcolor','w','ycolor','w','zcolor','w')
drawnow;
pumpAmplitudeScaleFactor = 0.04;
for ii = 1:0.5:50
    zoomval = 1+pumpAmplitudeScaleFactor*sin(ii);
    zoom(zoomval)
    pause(0.05)
end