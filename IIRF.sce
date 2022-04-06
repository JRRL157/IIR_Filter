wc = 2*%pi*(1/40);

a = sin(wc);
b = 2*cos(wc);

H = (a/%z)/(1-b/%z + 1/(%z*%z));
plzr(H);

w = %pi*(-1000:1000)/1000;

figure("background",8);
plot(w,abs(horner(H,exp(%i*w))));

//Coeficientes RAG

arag = round(a*256)
brag = round(b*256)

n = 0:99;
x1 = sin(0.1*n);
x2 = sin(%pi*n/4);
xvazio = n*0;

x = [xvazio x1 xvazio x2 xvazio x1+x2];

y = flts(x,H);
nx = 0:(length(x)-1);

//Resposta ao impulso
N = 300;
delay = 100;

imp = zeros(1,N);
imp(delay) = 1;
nimp = 0:(N-1);

h = flts(imp,H);

figure("background",8);
subplot(2,2,1);
plot2d2(nx,x);
xtitle("Amplitude",boxed=0);
xlabel("n {amostras}");
ylabel("x[n]","rotation",0);
subplot(2,2,2);
plot2d2(nx,y);
title("Amplitude");
xlabel("n {amostras}");
ylabel("y[n]","rotation",0);
subplot(2,2,3);
plot2d2(nimp,imp);
xtitle("Amplitude",boxed=0);
xlabel("n {amostras}");
ylabel("imp[n-delay]","rotation",0);
subplot(2,2,4);
plot2d2(nimp,h);
title("Amplitude");
xlabel("n {amostras}");
ylabel("h[n]","rotation",0);
