xo=transpose([-1 1 -0.5 2]);
vo=transpose([1 -0.5 0.5 -1]);
m1=1;
m2=2; 
m3=3;
m4=1;
c1=0.1;
c2=0.2;
c3=0.1;
k1=1;
k2=2;
k3=1;
k4=4;
k5=3;
M=[m1 0 0 0; 0 m2 0 0;0 0 m3 0; 0 0 0 m4];
C=[c1+c2 0 -c2 0; 0 0 0 0 ; -c2 0 c2+c3 -c3; 0 0 -c3 c3];
K=[k1+k2+k5 -k2 -k5 0; -k2 k2+k3 -k3 0 ; -k5 -k3 k3+k4+k5 -k4; 0 0 -k4 k4];
%Solving using inbuilt functions 
%y=0;
e
%syms p =[p1 p2 p3 p4 p5 p6 p7 p8];
%


%solving using linearization, Eig can only be used for the generalized
%eigenvalue problem, hence we need to remove the lambda^2 term
z=zeros(4,4);
M1=[C M; M z];
M2=[K z;z -M];
[X,e]=eig(M2,-M1);
y=X(1:4,:);
z=X(5:8,:);
k=0;
x(t)=c1*x1(t)+c2*x(t)+c3*x3(t)
x1=real(y);%Real Part of All eigenvectors
x2=imag(y);%Imaginary part of Eigenvectors
%if(x1+1i*x2==y)
 %   k=1;
    
e1=real(e);%Real part of eigenvalues
e2=imag(e);%Imaginary part of eigenvalues
%Only need to evaluate the coefficient matrix at time t=0, top 4 rows
%correspond to y, bottom four correspond to dy/dt
A1 =[x1(:,1) x2(:,1) x1(:,3) x2(:,3) x1(:,5) x2(:,5) x1(:,7) x2(:,7)];% Top Half of the coefficient matrix at time t =0
%Bottom half of the coefficient Matrix at time t = 0

A2 =[e1(1,1)*x1(:,1)-x2(:,1)*e2(1,1) e1(1,1)*x2(:,1)+x1(:,1)*e2(1,1) e1(3,3)*x1(:,3)-x2(:,3)*e2(3,3) e1(3,3)*x2(:,3)+x1(:,3)*e2(3,3) e1(5,5)*x1(:,5)-x2(:,5)*e2(5,5) e1(5,5)*x2(:,5)+x1(:,5)*e2(5,5) e1(7,7)*x1(:,7)-x2(:,7)*e2(7,7) e1(7,7)*x2(:,7)+x1(:,7)*e2(7,7)];
A=vertcat(A1,A2)% Combining the two halves
 y=vertcat(xo,vo);% combining the two initial conditions
 bc=A\y % solving for coefficients
 sym t ;
 ysol=0;
 %Create the linear combination of all the coefficients and the matrices 
 for i = 1:2:7
ysol= exp(e1(i,i)*t)*(c(i).*(x1(:,i).*cos(e2(i,i)*t)-x2(:,i)*sin(e2(i,i)*t)))+ysol;
 end
vpa(ysol,3);

