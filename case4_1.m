close all;
clear;
clc;

% %  reference input 
% k = 0:0.1:5-0.1;
% input_ref(1:50) = 1-exp(-k);
% k = 5:0.1:10-0.1;
% input_ref(51:100) =1-exp(-k)-(1-exp(5-k));
% input_ref = input_ref*2-1;
% 
% input_ref(101:150) = input_ref(1:50);
% input_ref(151:200) = input_ref(51:100);
% input_ref(201:250) = input_ref(1:50);
% input_ref(251:300) = input_ref(51:100);
% input_ref(301:350) = input_ref(1:50);
% input_ref(351:400) = input_ref(51:100);

% i =0:0.02:4*pi;
% input_ref = cos(i);

% N = length(input_ref);
N=600;
for k=1:N
    input_ref(k) = cos(5*pi*k/N);
end


delta = 0.0004;
e = 0.02*rands(N,1);

w_f = [   11.2856   -4.6174  -12.3754    1.5622   12.0864    2.2351   -11.9197   -4.4981   12.6531  ]';
w_g = [  -0.4449    3.5097   -0.4449  ]';
m_f = [-2 -1.5 -1 -0.5 0 0.5 1 1.5 2];
m_g = [-2 0 2];

alpha_real = 1;

alpha_1 = 0.8;
alpha_2 = 0.9;
alpha_3 = 1.0;
alpha_4 = 1.1;
alpha_5 = 1.2;

beta_1 = 0.8;
beta_2 = 0.9;
beta_3 = 1.0;

theta_1 = [alpha_1; beta_1; 0];
theta_2 = [alpha_1; beta_2; 0];
theta_3 = [alpha_1; beta_3; 0];
theta_4 = [alpha_2; beta_1; 0];
theta_5 = [alpha_2; beta_2; 0];
theta_6 = [alpha_2; beta_3; 0];
theta_7 = [alpha_3; beta_1; 0];
theta_8 = [alpha_3; beta_2; 0];
theta_9 = [alpha_3; beta_3; 0];
theta_10 = [alpha_4; beta_1; 0];
theta_11 = [alpha_4; beta_2; 0];
theta_12 = [alpha_4; beta_3; 0];
theta_13 = [alpha_5; beta_1; 0];
theta_14 = [alpha_5; beta_2; 0];
theta_15 = [alpha_5; beta_3; 0];


for k = 1:N
    if k>=1 && k<=85
        alpha_real(k) = 1.0;
    elseif k>=86 && k<=180
        alpha_real(k) = 1.11;
    elseif k>=181 && k<=340
        alpha_real(k) = 0.78;
    elseif k>=341 && k<=480
        alpha_real(k) = 0.91;
    elseif k>=481 && k<=N
        alpha_real(k) = 1.18;
    end 
end

for k = 1:N
    if k>=1 && k<=180
        beta_real(k) = 0.9;
    elseif k>=181 && k<=340
        beta_real(k) = 0.82;
    elseif k>=341 && k<=N
        beta_real(k) = 1.0;
    end 
end


% w_f_1 = alpha_1*w_f;
% w_f_2 = alpha_2*w_f;
% w_f_3 = alpha_3*w_f;
% w_f_4 = alpha_4*w_f;
% w_f_5 = alpha_5*w_f;

q_1 = 1/15;
q_2 = 1/15;
q_3 = 1/15;
q_4 = 1/15;
q_5 = 1/15;
q_6 = 1/15;
q_7 = 1/15;
q_8 = 1/15;
q_9 = 1/15;
q_10 = 1/15;
q_11 = 1/15;
q_12 = 1/15;
q_13 = 1/15;
q_14 = 1/15;
q_15 = 1/15;


x(1) = -1;
y(1) = x(1);

num_change = 0;
for k = 1:N-1
    
    q_1_plot(k) = q_1;
    q_2_plot(k) = q_2;
    q_3_plot(k) = q_3;
    q_4_plot(k) = q_4;
    q_5_plot(k) = q_5;
    q_6_plot(k) = q_6;
    q_7_plot(k) = q_7;
    q_8_plot(k) = q_8;
    q_9_plot(k) = q_9;
    q_10_plot(k) = q_10;
    q_11_plot(k) = q_11;
    q_12_plot(k) = q_12;
    q_13_plot(k) = q_13;
    q_14_plot(k) = q_14;
    q_15_plot(k) = q_15;
    
    for j=1:1:9
        h_f(j,k)=exp(-norm(x(k)-m_f(j))^2/(2*1));
    end 

    for j=1:1:3
        h_g(j,k)=exp(-norm(x(k)-m_g(j))^2/(2*3.6));
    end
    
    u_1(k) = (input_ref(k+1)-theta_1(1)*w_f'*h_f(:,k)-theta_1(3))/(theta_1(2)*w_g'*h_g(:,k));
    u_2(k) = (input_ref(k+1)-theta_2(1)*w_f'*h_f(:,k)-theta_2(3))/(theta_2(2)*w_g'*h_g(:,k));
    u_3(k) = (input_ref(k+1)-theta_3(1)*w_f'*h_f(:,k)-theta_3(3))/(theta_3(2)*w_g'*h_g(:,k));
    u_4(k) = (input_ref(k+1)-theta_4(1)*w_f'*h_f(:,k)-theta_4(3))/(theta_4(2)*w_g'*h_g(:,k));
    u_5(k) = (input_ref(k+1)-theta_5(1)*w_f'*h_f(:,k)-theta_5(3))/(theta_5(2)*w_g'*h_g(:,k));
    u_6(k) = (input_ref(k+1)-theta_6(1)*w_f'*h_f(:,k)-theta_6(3))/(theta_6(2)*w_g'*h_g(:,k));
    u_7(k) = (input_ref(k+1)-theta_7(1)*w_f'*h_f(:,k)-theta_7(3))/(theta_7(2)*w_g'*h_g(:,k));
    u_8(k) = (input_ref(k+1)-theta_8(1)*w_f'*h_f(:,k)-theta_8(3))/(theta_8(2)*w_g'*h_g(:,k));
    u_9(k) = (input_ref(k+1)-theta_9(1)*w_f'*h_f(:,k)-theta_9(3))/(theta_9(2)*w_g'*h_g(:,k));
    u_10(k) = (input_ref(k+1)-theta_10(1)*w_f'*h_f(:,k)-theta_10(3))/(theta_10(2)*w_g'*h_g(:,k));
    u_11(k) = (input_ref(k+1)-theta_11(1)*w_f'*h_f(:,k)-theta_11(3))/(theta_11(2)*w_g'*h_g(:,k));
    u_12(k) = (input_ref(k+1)-theta_12(1)*w_f'*h_f(:,k)-theta_12(3))/(theta_12(2)*w_g'*h_g(:,k));
    u_13(k) = (input_ref(k+1)-theta_13(1)*w_f'*h_f(:,k)-theta_13(3))/(theta_13(2)*w_g'*h_g(:,k));
    u_14(k) = (input_ref(k+1)-theta_14(1)*w_f'*h_f(:,k)-theta_14(3))/(theta_14(2)*w_g'*h_g(:,k));
    u_15(k) = (input_ref(k+1)-theta_15(1)*w_f'*h_f(:,k)-theta_15(3))/(theta_15(2)*w_g'*h_g(:,k));

    u_opt(k) = (input_ref(k+1)-alpha_real(k)*w_f'*h_f(:,k)-0)/(beta_real(k)*w_g'*h_g(:,k));
    
    u_q(k) = q_1*u_1(k)+q_2*u_2(k)+q_3*u_3(k)+q_4*u_4(k)+q_5*u_5(k)+q_6*u_6(k)+q_7*u_7(k)+q_8*u_8(k)+q_9*u_9(k)+q_10*u_10(k)+q_11*u_11(k)+q_12*u_12(k)+q_13*u_13(k)+q_14*u_14(k)+q_15*u_15(k);
    x(k+1) = alpha_real(k)*(sin(x(k))+cos(3*x(k)))+beta_real(k)*(2+cos(x(k)))*u_q(k)+e(k+1);
    y(k+1) = x(k+1);
    
    
    w_f_q = (q_1*theta_1(1)+q_2*theta_2(1)+q_3*theta_3(1)+q_4*theta_4(1)+q_5*theta_5(1)+q_6*theta_6(1)+q_7*theta_7(1)+q_8*theta_8(1)+q_9*theta_9(1)+q_10*theta_10(1)+q_11*theta_11(1)+q_12*theta_12(1)+q_13*theta_13(1)+q_14*theta_14(1)+q_15*theta_15(1))*w_f;
    w_g_q = (q_1*theta_1(2)+q_2*theta_2(2)+q_3*theta_3(2)+q_4*theta_4(2)+q_5*theta_5(2)+q_6*theta_6(2)+q_7*theta_7(2)+q_8*theta_8(2)+q_9*theta_9(2)+q_10*theta_10(2)+q_11*theta_11(2)+q_12*theta_12(2)+q_13*theta_13(2)+q_14*theta_14(2)+q_15*theta_15(2))*w_g;
    y_hat_q(k+1) = w_f_q'*h_f(:,k)+w_g_q'*h_g(:,k)*u_q(k);
    
    y_error(k+1) = abs(y(k+1)-y_hat_q(k+1));
    
    if y_error(k+1) >0.08
        if q_1>0.98 || q_2>0.98 || q_3>0.98 || q_4>0.98 || q_5>0.98 || q_6>0.98 || q_7>0.98 || q_8>0.98 || q_9>0.98 || q_10>0.98 || q_11>0.98 || q_12>0.98 || q_13>0.98 || q_14>0.98 || q_15>0.98
            q_1 = 1/15;
            q_2 = 1/15;
            q_3 = 1/15;
            q_4 = 1/15;
            q_5 = 1/15;
            q_6 = 1/15;
            q_7 = 1/15;
            q_8 = 1/15;
            q_9 = 1/15;
            q_10 = 1/15;
            q_11 = 1/15;
            q_12 = 1/15;
            q_13 = 1/15;
            q_14 = 1/15;
            q_15 = 1/15;
            num_change = num_change+1;
        end
    end
   
 
    y_hat_1(k+1) = theta_1(1)*w_f'*h_f(:,k)+theta_1(2)*w_g'*h_g(:,k)*u_q(k);
    delta_1 = delta+((theta_1(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_1(2)-beta_real(k))*w_g'*h_g(:,k))^2;
    pdf_1 = 1/delta_1*exp(-(y(k+1)-y_hat_1(k+1))^2/2/delta_1);
    
    y_hat_2(k+1) = theta_2(1)*w_f'*h_f(:,k)+theta_2(2)*w_g'*h_g(:,k)*u_q(k);
    delta_2 = delta+((theta_2(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_2(2)-beta_real(k))*w_g'*h_g(:,k))^2;
    pdf_2 = 1/delta_2*exp(-(y(k+1)-y_hat_2(k+1))^2/2/delta_2);
    
    y_hat_3(k+1) = theta_3(1)*w_f'*h_f(:,k)+theta_3(2)*w_g'*h_g(:,k)*u_q(k);
    delta_3 = delta+((theta_3(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_3(2)-beta_real(k))*w_g'*h_g(:,k))^2;
    pdf_3 = 1/delta_3*exp(-(y(k+1)-y_hat_3(k+1))^2/2/delta_3);
    
    y_hat_4(k+1) = theta_4(1)*w_f'*h_f(:,k)+theta_4(2)*w_g'*h_g(:,k)*u_q(k);
    delta_4 = delta+((theta_4(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_4(2)-beta_real(k))*w_g'*h_g(:,k))^2;
    pdf_4 = 1/delta_4*exp(-(y(k+1)-y_hat_4(k+1))^2/2/delta_4);
    
    y_hat_5(k+1) = theta_5(1)*w_f'*h_f(:,k)+theta_5(2)*w_g'*h_g(:,k)*u_q(k);
    delta_5 = delta+((theta_5(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_5(2)-beta_real(k))*w_g'*h_g(:,k))^2;
    pdf_5 = 1/delta_5*exp(-(y(k+1)-y_hat_5(k+1))^2/2/delta_5);
 
    y_hat_6(k+1) = theta_6(1)*w_f'*h_f(:,k)+theta_6(2)*w_g'*h_g(:,k)*u_q(k);
    delta_6 = delta+((theta_6(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_6(2)-beta_real(k))*w_g'*h_g(:,k))^2;
    pdf_6 = 1/delta_6*exp(-(y(k+1)-y_hat_6(k+1))^2/2/delta_6);
    
    y_hat_7(k+1) = theta_7(1)*w_f'*h_f(:,k)+theta_7(2)*w_g'*h_g(:,k)*u_q(k);
    delta_7 = delta+((theta_7(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_7(2)-beta_real(k))*w_g'*h_g(:,k))^2;
    pdf_7 = 1/delta_7*exp(-(y(k+1)-y_hat_7(k+1))^2/2/delta_7);
    
    y_hat_8(k+1) = theta_8(1)*w_f'*h_f(:,k)+theta_8(2)*w_g'*h_g(:,k)*u_q(k);
    delta_8 = delta+((theta_8(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_8(2)-beta_real(k))*w_g'*h_g(:,k))^2;
    pdf_8 = 1/delta_8*exp(-(y(k+1)-y_hat_8(k+1))^2/2/delta_8);
    
    y_hat_9(k+1) = theta_9(1)*w_f'*h_f(:,k)+theta_9(2)*w_g'*h_g(:,k)*u_q(k);
    delta_9 = delta+((theta_9(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_9(2)-beta_real(k))*w_g'*h_g(:,k))^2;
    pdf_9 = 1/delta_9*exp(-(y(k+1)-y_hat_9(k+1))^2/2/delta_9);
    
    y_hat_10(k+1) = theta_10(1)*w_f'*h_f(:,k)+theta_10(2)*w_g'*h_g(:,k)*u_q(k);
    delta_10 = delta+((theta_10(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_10(2)-beta_real(k))*w_g'*h_g(:,k))^2;
    pdf_10 = 1/delta_10*exp(-(y(k+1)-y_hat_10(k+1))^2/2/delta_10);    
    
    y_hat_11(k+1) = theta_11(1)*w_f'*h_f(:,k)+theta_11(2)*w_g'*h_g(:,k)*u_q(k);
    delta_11 = delta+((theta_11(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_11(2)-beta_real(k))*w_g'*h_g(:,k))^2;
    pdf_11 = 1/delta_11*exp(-(y(k+1)-y_hat_11(k+1))^2/2/delta_11);
    
    y_hat_12(k+1) = theta_12(1)*w_f'*h_f(:,k)+theta_12(2)*w_g'*h_g(:,k)*u_q(k);
    delta_12 = delta+((theta_12(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_12(2)-beta_real(k))*w_g'*h_g(:,k))^2;
    pdf_12 = 1/delta_12*exp(-(y(k+1)-y_hat_12(k+1))^2/2/delta_12);
    
    y_hat_13(k+1) = theta_13(1)*w_f'*h_f(:,k)+theta_13(2)*w_g'*h_g(:,k)*u_q(k);
    delta_13 = delta+((theta_13(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_13(2)-beta_real(k))*w_g'*h_g(:,k))^2;
    pdf_13 = 1/delta_13*exp(-(y(k+1)-y_hat_13(k+1))^2/2/delta_13);
    
    y_hat_14(k+1) = theta_14(1)*w_f'*h_f(:,k)+theta_14(2)*w_g'*h_g(:,k)*u_q(k);
    delta_14 = delta+((theta_14(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_14(2)-beta_real(k))*w_g'*h_g(:,k))^2;
    pdf_14 = 1/delta_14*exp(-(y(k+1)-y_hat_14(k+1))^2/2/delta_14);
    
    y_hat_15(k+1) = theta_15(1)*w_f'*h_f(:,k)+theta_15(2)*w_g'*h_g(:,k)*u_q(k);
    delta_15 = delta+((theta_15(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_15(2)-beta_real(k))*w_g'*h_g(:,k))^2;
    pdf_15 = 1/delta_15*exp(-(y(k+1)-y_hat_15(k+1))^2/2/delta_15);
    
    
    
    q_sum = pdf_1*q_1+pdf_2*q_2+pdf_3*q_3+pdf_4*q_4+pdf_5*q_5+pdf_6*q_6+pdf_7*q_7+pdf_8*q_8+pdf_9*q_9+pdf_10*q_10+pdf_11*q_11+pdf_12*q_12+pdf_13*q_13+pdf_14*q_14+pdf_15*q_15;
    
    q_1 = pdf_1*q_1/q_sum;
    q_2 = pdf_2*q_2/q_sum;
    q_3 = pdf_3*q_3/q_sum;
    q_4 = pdf_4*q_4/q_sum;
    q_5 = pdf_5*q_5/q_sum;
    q_6 = pdf_6*q_6/q_sum;
    q_7 = pdf_7*q_7/q_sum;
    q_8 = pdf_8*q_8/q_sum;
    q_9 = pdf_9*q_9/q_sum;
    q_10 = pdf_10*q_10/q_sum;
    q_11 = pdf_11*q_11/q_sum;
    q_12 = pdf_12*q_12/q_sum;
    q_13 = pdf_13*q_13/q_sum;
    q_14 = pdf_14*q_14/q_sum;
    q_15 = pdf_15*q_15/q_sum;
      
end

figure(1);
plot(input_ref,'--','LineWidth',2);hold on;
plot(y,'LineWidth',1);hold off;
set(gca,'FontSize',12);
xlabel('k','FontSize',12);
ylabel('system output','FontSize',12)
legend('y_r(k)','y(k)')

axes('position', [0.1 0.1 0.1 0.1]);
box on
xindex = 80:1:95;
plot(xindex,input_ref(xindex),'--','LineWidth',2);hold on;
plot(xindex,y(xindex),'LineWidth',1);hold off;

axes('position', [0.3 0.3 0.1 0.1]);
box on
xindex = 175:1:190;
plot(xindex,input_ref(xindex),'--','LineWidth',2);hold on;
plot(xindex,y(xindex),'LineWidth',1);hold off;

axes('position', [0.5 0.5 0.1 0.1]);
box on
xindex = 335:1:350;
plot(xindex,input_ref(xindex),'--','LineWidth',2);hold on;
plot(xindex,y(xindex),'LineWidth',1);hold off;

axes('position', [0.7 0.7 0.1 0.1]);
box on
xindex = 475:1:490;
plot(xindex,input_ref(xindex),'--','LineWidth',2);hold on;
plot(xindex,y(xindex),'LineWidth',1);hold off;



figure(3);
plot(u_opt,'o-'); hold on;
plot(u_q,'.-'); hold off;
set(gca,'FontSize',12);
xlabel('k','FontSize',12);
ylabel('input signal','FontSize',12)
legend('u_{opt}(k)','u(k)') 

axes('position', [0.1 0.5 0.1 0.1]);
box on
xindex = 2:1:16;
plot(xindex,u_opt(xindex),'o-','LineWidth',1);hold on;
plot(xindex,u_q(xindex),'.-','LineWidth',1);hold off;

axes('position', [0.3 0.5 0.1 0.1]);
box on
xindex = 110:1:125;
plot(xindex,u_opt(xindex),'o-','LineWidth',1);hold on;
plot(xindex,u_q(xindex),'.-','LineWidth',1);hold off;

axes('position', [0.5 0.5 0.1 0.1]);
box on
xindex = 175:1:190;
plot(xindex,u_opt(xindex),'o-','LineWidth',1);hold on;
plot(xindex,u_q(xindex),'.-','LineWidth',1);hold off;

axes('position', [0.7 0.5 0.1 0.1]);
box on
xindex = 335:1:350;
plot(xindex,u_opt(xindex),'o-','LineWidth',1);hold on;
plot(xindex,u_q(xindex),'.-','LineWidth',1);hold off;

axes('position', [0.8 0.7 0.1 0.1]);
box on
xindex = 475:1:490;
plot(xindex,u_opt(xindex),'o-','LineWidth',1);hold on;
plot(xindex,u_q(xindex),'.-','LineWidth',1);hold off;

figure(2);
plot(q_1_plot,'*-');hold on;
plot(q_2_plot,'s-');hold on;
plot(q_3_plot,'o-');hold on;
plot(q_4_plot,'+-');hold on;
plot(q_5_plot,'x-');hold on;
plot(q_6_plot,'d-');hold on;
plot(q_7_plot,'<-');hold on;
plot(q_8_plot,'>-');hold on;
plot(q_9_plot,'p-');hold on;
plot(q_10_plot,'h-');hold on;
plot(q_11_plot,'*-');hold on;
plot(q_12_plot,'s-');hold on;
plot(q_13_plot,'o-');hold on;
plot(q_14_plot,'+-');hold on;
plot(q_15_plot);hold off;
legend('\pi(\theta_1)','\pi(\theta_2)','\pi(\theta_3)','\pi(\theta_4)','\pi(\theta_5)','\pi(\theta_6)','\pi(\theta_7)','\pi(\theta_8)','\pi(\theta_9)','\pi(\theta_{10})','\pi(\theta_{11})','\pi(\theta_{12})','\pi(\theta_{13})','\pi(\theta_{14})','\pi(\theta_{15})');
axis([0 600 -0.1 1.4])
set(gca,'FontSize',12);
xlabel('k','FontSize',12);
ylabel('Bayesian posterior probability','FontSize',12)




% x(1) = -1;
% y(1) = x(1);
% 
% for k = 1:N-1
%     
%     for j=1:1:9
%         h_f(j,k)=exp(-norm(x(k)-m_f(j))^2/(2*1));
%     end 
% 
%     for j=1:1:3
%         h_g(j,k)=exp(-norm(x(k)-m_g(j))^2/(2*3.6));
%     end
%     
%     u(k) = (input_ref(k+1)-w_f'*h_f(:,k))/(w_g'*h_g(:,k));
%     
%     x(k+1) = 1*(sin(x(k))+cos(3*x(k)))+(2+cos(x(k)))*u(k)+e(k+1);
%     y(k+1) = x(k+1);
%       
% end
% 
% figure(1);
% plot(input_ref,'--');hold on;
% plot(y);hold off;



























