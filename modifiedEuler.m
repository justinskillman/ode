% y' = f(x,y) = y+ 2x +1
% modified euler
%  y(x) = 4 exp(x) - (3 + 2x) ;
clear all, %close all
syms  s t m
syms BigF(s,t )

%BigF(s, t) = s + 2 * t + 1;

BigF(s, t) = s + t ;
Fnc = matlabFunction( BigF);


y0 = 1;
npts = 6;
x= linspace(0,  1, npts);
x0 = x(1) ;
dx = diff(x);

yEulerM = size(x);
zEulerM  = size(x) ;
zEulerM(1) = y0 + dx(1) * Fnc( x0, y0) ;
yEulerM(1) = y0  ;

for ii=2: numel(x)
   zEulerM( ii) = yEulerM(ii-1) + dx(ii-1) * Fnc( x(ii-1), yEulerM(ii-1) ) ;
   
   yEulerM( ii) = yEulerM(ii-1) + dx(ii-1) /2 * ( Fnc( x(ii-1), yEulerM(ii-1)) + Fnc( x(ii), zEulerM(ii))   ) ;  
end


xTrue = linspace(0,1, 10* npts) ;
%yTrue = 4 * exp( xTrue) - (3 + 2 * xTrue) ;
yTrue =2 * exp(xTrue) - xTrue -1 ;

ht = plot ( xTrue, yTrue, 'k-'); hold on, 
hn = line( x, yEulerM, 'LineStyle', '-', 'Color', 'r', 'Marker','d', 'MarkerFaceColor','y','MarkerEdgeColor', 'r');

xSelect = x;
%ySelect =4 * exp( xSelect) - (3 + 2 * xSelect) ;
ySelect = 2* exp( xSelect) -x - 1 ;

fprintf(1, '  x       yEulerM   yTrue     abs((yTrue-yEulerM)/yTrue)\n');
fprintf(1, ' ----     ------  --------   ---------------\n') ;
fprintf(1, '  %-0.3f   %-0.3f    %-0.3f    %-0.5f\n', ...
     [x',  yEulerM', ySelect', (abs(ySelect-yEulerM) ./ abs(ySelect))' ]' ); 


