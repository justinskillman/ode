% y' = f(x,y) = y+ 2x +1
%
%  y(x) = 4 exp(x) - (3 + 2x) ;
clear all, close all
syms  s t m
syms BigF(s,t )

%BigF(s, t) = s + 2 * t + 1;
BigF(s, t) = s + t ;

Fnc = matlabFunction( BigF);


y0 = 1;
npts = 6 ;
x= linspace(0,  1, npts);

dx = diff(x);

yEuler = size(x);
yEuler(1) = y0 ;
for ii=2: numel(x)
   yEuler( ii) =  yEuler(ii-1) + dx(ii-1) * Fnc( x(ii-1), yEuler(ii-1) ) ;
end


xTrue = linspace(0,1, 10* npts) ;
%yTrue = 4 * exp( xTrue) - (3 + 2 * xTrue) ;
yTrue = 2 * exp( xTrue) -  xTrue -1 ;


ht = plot ( xTrue, yTrue, 'k-'); hold on, 
hn = line( x, yEuler, 'LineStyle', '-', 'Color', 'r', 'Marker','d', 'MarkerFaceColor','y','MarkerEdgeColor', 'r');
xSelect = x;
ySelect =4 * exp( xSelect) - (3 + 2 * xSelect) ;
tt = title(' dy/dx = f(x,y) = x+ y, y(0) = 1; yTrue(x)=2*exp(x)-(1+x)');


fprintf(1, '  x       yEuler   yTrue      abs((yTrue-yEuler)/yTrue)\n');
fprintf(1, ' ----     ------  --------   ---------------\n') ;
fprintf(1, '  %-0.3f   %-0.3f    %-0.3f    %-0.5f\n', ...
     [x',  yEuler', ySelect', (abs(ySelect-yEuler) ./ abs(ySelect))' ]' ); 