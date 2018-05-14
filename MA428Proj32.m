col=linspace(0,8);
m1=12+0.01*13;
m2=3+0.04*84; 
m3=0.00001;
m4=25+0.03*17;
c1=0.2;
c2=0.2;
c3=0.1;
k1=1;
k2=2;
k3=1;
k4=4;
k5=3;


e1=-2+1i*2;
e2=-1+1i*3;
err=ones(100,1);
  for i=1:100
 %c2= col(i);
 M=[m1 0 0 0; 0 m2 0 0;0 0 m3 0; 0 0 0 m4];
 C=[c1+c2 0 -c2 0; 0 0 0 0 ; -c2 0 c2+c3 -c3; 0 0 -c3 c3];
 K=[k1+k2+k5 -k2 -k5 0; -k2 k2+k3 -k3 0 ; -k3 -k5 k3+k4+k5 0; 0 0 -k4 k4];
 
 z=zeros(4,4);
 M1=[C M; M z];
 M2=[K z;z -M];
 
 [X,e]=eig(M1,-M2);
 D=[real(e(1,1)-e1) imag((e(1,1)-e1)) real((e(3,3)-e2)) imag((e(3,3)-e2))];
 err(i)= rssq(D);
  end
[A,I]=min(err);
  plot(1:100,err);
  
  