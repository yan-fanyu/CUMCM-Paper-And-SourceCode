clear
clc
a=[567.255	522.238	55.128
567.235	522.242	55.108
567.247	522.251	55.128
567.252	522.244	55.129];%第一次测量塔尖的数据
x = a(:,1);
y = a(:,2);
z = a(:,3);
Xcolv = x(:); % Make X a column vector
Ycolv = y(:); % Make Y a column vector
Zcolv = z(:); % Make Z a column vector
Const = ones(size(Xcolv)); % Vector of ones for constant term
Coefficients = [Xcolv Ycolv Const]\Zcolv; % Find the coefficients
XCoeff = Coefficients(1); % X coefficient
YCoeff = Coefficients(2); % X coefficient
CCoeff = Coefficients(3); % constant term
% Using the above variables, z = XCoeff * x + YCoeff * y + CCoeff
L=plot3(x,y,z,'ro'); % Plot the original data points
set(L,'Markersize',2*get(L,'Markersize')) % Making the circle markers larger
set(L,'Markerfacecolor','r') % Filling in the markers
hold on;
grid on;
[xx, yy]=meshgrid(0:0.1:1,0:0.1:1); % Generating a regular grid for plotting
zz = XCoeff * xx + YCoeff * yy + CCoeff;
surf(xx,yy,zz) % Plotting the surface
title(sprintf('Plotting plane z=(%f)*x+(%f)*y+(%f)',XCoeff, YCoeff, CCoeff))
% By rotating the surface, you can see that the points lie on the plane
% Also, if you multiply both sides of the equation in the title by 4,
% you get the equation in the comment on the third line of this example
Coefficients
a=[567.2621	522.2309	55.127
567.2421	522.2349	55.103
567.2541	522.2439	55.125
567.2591	522.2369	55.124];%第二次测量塔尖的数据
x = a(:,1);
y = a(:,2);
z = a(:,3);
Xcolv = x(:); % Make X a column vector
Ycolv = y(:); % Make Y a column vector
Zcolv = z(:); % Make Z a column vector
Const = ones(size(Xcolv)); % Vector of ones for constant term
Coefficients = [Xcolv Ycolv Const]\Zcolv; % Find the coefficients
XCoeff = Coefficients(1); % X coefficient
YCoeff = Coefficients(2); % X coefficient
CCoeff = Coefficients(3); % constant term
% Using the above variables, z = XCoeff * x + YCoeff * y + CCoeff
L=plot3(x,y,z,'ro'); % Plot the original data points
set(L,'Markersize',2*get(L,'Markersize')) % Making the circle markers larger
set(L,'Markerfacecolor','r') % Filling in the markers
hold on;
grid on;
[xx, yy]=meshgrid(0:0.1:1,0:0.1:1); % Generating a regular grid for plotting
zz = XCoeff * xx + YCoeff * yy + CCoeff;
surf(xx,yy,zz) % Plotting the surface
title(sprintf('Plotting plane z=(%f)*x+(%f)*y+(%f)',XCoeff, YCoeff, CCoeff))
% By rotating the surface, you can see that the points lie on the plane
% Also, if you multiply both sides of the equation in the title by 4,
% you get the equation in the comment on the third line of this example
Coefficients
