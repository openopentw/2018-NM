N = 9;
x = [-2 -1.5 -1 -0.5 -0 0.5 1.0 1.5 2.0];
y = [0 0 0 0.87 1 0.87 0 0 0 ];
a=y;
A=zeros(N);
c=[0 0 0 0 0 0 0 0 0];
b=[0 0 0 0 0 0 0 0];
d=[0 0 0 0 0 0 0 0];
b1=[0 0 0 0 0 0 0 0];
for i = 1:N-1
	h(i) = x(i+1)-x(i);
end
for i = 2:N-1
	s1=((a(i+1)-a(i))*3)/h(i);
	s2=((a(i)-a(i-1))*3)/h(i-1);
    b1(i-1)=s1-s2;
    A(i,i-1)=h(i-1);
    A(i,i)=2*(h(i-1)+h(i));
    A(i, i+1)=h(i);
end
NewA=zeros(N-2);
for i = 2:N-1
	for j = 2:N-1
		NewA(i-1, j-1)=A(i,j);
	end
end
invA=inv(NewA);
t = invA.*b1;
for i = 2:N-1
	c(i) = t(i-1);
end
for i=1:N-1
	s1 = (a(i+1)-a(i))/h(i);
	s2 = (2*c(i)+c(i+1))*h(i)/3;
	b(i) = s1-s2;
	d(i) = (c(i+1)-c(i))/(3*h(i));
end
xx = (x(1):0.01:x(2))';
ff = a(1)+b(1)*(xx(:)-x(i))+c(1)*(xx(:)-x(1)).^2+d(1)*(temp1(:)-x(i)).^3;
for i = 2:N-1
	temp1=(x(i):0.01:x(i+1))';
	temp2=a(i)+b(i)*(temp1(:)-x(i))+c(i)*(temp1(:)-x(i)).^2+d(i)*(temp1(:)-x(i)).^3;
	xx=cat(1, xx, temp1);
	ff=cat(1, ff, temp2);
end
plot(xx, ff)
