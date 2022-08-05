clear;
clc;

N=600;
for k=1:N
    if k>=1 && k<=150
        input_ref(k) = 1;
    elseif k>=151 && k<=300
        input_ref(k) = -1;
    elseif k>=301 && k<=450
        input_ref(k) = 1;
    else
        input_ref(k) = -1;
    end
end


delta = 0.0025;
e = 0.05*rands(N,1);

w_f = [   11.2856   -4.6174  -12.3754    1.5622   12.0864    2.2351   -11.9197   -4.4981   12.6531  ]';
w_g = [  -0.4449    3.5097   -0.4449  ]';
m_f = [-2 -1.5 -1 -0.5 0 0.5 1 1.5 2];
m_g = [-2 0 2];


gamma_1 = -1.5;
gamma_2 = -1.4;
gamma_3 = -1.3;
gamma_4 = -1.2;
gamma_5 = -1.1;
gamma_6 = -1.0;
gamma_7 = -0.9;
gamma_8 = -0.8;
gamma_9 = -0.7;
gamma_10 = -0.6;
gamma_11 = -0.5;
gamma_12 = -0.4;
gamma_13 = -0.3;
gamma_14 = -0.2;
gamma_15 = -0.1;
gamma_16 = 0.0;
gamma_17 = 0.1;
gamma_18 = 0.2;
gamma_19 = 0.3;
gamma_20 = 0.4;
gamma_21 = 0.5;

theta_1 = [1; 1; gamma_1];
theta_2 = [1; 1; gamma_2];
theta_3 = [1; 1; gamma_3];
theta_4 = [1; 1; gamma_4];
theta_5 = [1; 1; gamma_5];
theta_6 = [1; 1; gamma_6];
theta_7 = [1; 1; gamma_7];
theta_8 = [1; 1; gamma_8];
theta_9 = [1; 1; gamma_9];
theta_10 = [1; 1; gamma_10];
theta_11 = [1; 1; gamma_11];
theta_12 = [1; 1; gamma_12];
theta_13 = [1; 1; gamma_13];
theta_14 = [1; 1; gamma_14];
theta_15 = [1; 1; gamma_15];
theta_16 = [1; 1; gamma_16];
theta_17 = [1; 1; gamma_17];
theta_18 = [1; 1; gamma_18];
theta_19 = [1; 1; gamma_19];
theta_20 = [1; 1; gamma_20];
theta_21 = [1; 1; gamma_21];


for k = 1:N
    alpha_real(k) = 1;
    beta_real(k)=1;
end

for k = 1:N

    if k>=1 && k<200
        gamma_real(k) = -0.2;
    elseif k>=200 && k<400
        gamma_real(k) = 0.32;
    elseif k>=400 && k<500
        gamma_real(k) = -0.85;
    elseif k>=500 && k<=N
        gamma_real(k) = 0.5;
    end 
end

q_1 = 1/21;q_2 = 1/21;q_3 = 1/21;q_4 = 1/21;q_5 = 1/21;
q_6 = 1/21;q_7 = 1/21;q_8 = 1/21;q_9 = 1/21;q_10 = 1/21;
q_11 = 1/21;q_12 = 1/21;q_13 = 1/21;q_14 = 1/21;q_15 = 1/21;
q_16 = 1/21;q_17 = 1/21;q_18 = 1/21;q_19 = 1/21;q_20 = 1/21;q_21 = 1/21;

var_P_V = 1;

prob_coef = 1/21;

P1(:,:,2) = var_P_V*eye(3,3);
P2(:,:,2) = var_P_V*eye(3,3);
P3(:,:,2) = var_P_V*eye(3,3);
P4(:,:,2) = var_P_V*eye(3,3);
P5(:,:,2) = var_P_V*eye(3,3);
P6(:,:,2) = var_P_V*eye(3,3);
P7(:,:,2) = var_P_V*eye(3,3);
P8(:,:,2) = var_P_V*eye(3,3);
P9(:,:,2) = var_P_V*eye(3,3);
P10(:,:,2) = var_P_V*eye(3,3);
P11(:,:,2) = var_P_V*eye(3,3);
P12(:,:,2) = var_P_V*eye(3,3);
P13(:,:,2) = var_P_V*eye(3,3);
P14(:,:,2) = var_P_V*eye(3,3);
P15(:,:,2) = var_P_V*eye(3,3);
P16(:,:,2) = var_P_V*eye(3,3);
P17(:,:,2) = var_P_V*eye(3,3);
P18(:,:,2) = var_P_V*eye(3,3);
P19(:,:,2) = var_P_V*eye(3,3);
P20(:,:,2) = var_P_V*eye(3,3);
P21(:,:,2) = var_P_V*eye(3,3);

lamda_dual = 0.9;


x(1) = 0.1;
x(2) = 0.1;
y(1) = 0.1;
y(2) = 0.1;
delta_yr(1)=0.01;
delta_yr(2)=0.01;

for k = 2:N-1

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
    q_16_plot(k) = q_16;
    q_17_plot(k) = q_17;
    q_18_plot(k) = q_18;
    q_19_plot(k) = q_19;
    q_20_plot(k) = q_20;
    q_21_plot(k) = q_21;

    for j=1:1:9
        h_f(j,k)=exp(-norm(x(k)-m_f(j))^2/(2*1));
    end 

    for j=1:1:3
        h_g(j,k)=exp(-norm(x(k)-m_g(j))^2/(2*3.6));
    end  

    u_dual_1(k) = ((input_ref(k+1)-theta_1(1)*w_f'*h_f(:,k)-theta_1(3))*(theta_1(2)*w_g'*h_g(:,k))-(1-lamda_dual)*[w_f'*h_f(:,k) 1]*P1(1:2,3,k)*w_g'*h_g(:,k))/((1-lamda_dual)*(w_g'*h_g(:,k))^2*P1(3,3,k)+(theta_1(2)*w_g'*h_g(:,k))^2);
    u_dual_2(k) = ((input_ref(k+1)-theta_2(1)*w_f'*h_f(:,k)-theta_2(3))*(theta_2(2)*w_g'*h_g(:,k))-(1-lamda_dual)*[w_f'*h_f(:,k) 1]*P2(1:2,3,k)*w_g'*h_g(:,k))/((1-lamda_dual)*(w_g'*h_g(:,k))^2*P2(3,3,k)+(theta_2(2)*w_g'*h_g(:,k))^2);
    u_dual_3(k) = ((input_ref(k+1)-theta_3(1)*w_f'*h_f(:,k)-theta_3(3))*(theta_3(2)*w_g'*h_g(:,k))-(1-lamda_dual)*[w_f'*h_f(:,k) 1]*P3(2:3,3,k)*w_g'*h_g(:,k))/((1-lamda_dual)*(w_g'*h_g(:,k))^2*P3(3,3,k)+(theta_3(2)*w_g'*h_g(:,k))^2);
    u_dual_4(k) = ((input_ref(k+1)-theta_4(1)*w_f'*h_f(:,k)-theta_4(3))*(theta_4(2)*w_g'*h_g(:,k))-(1-lamda_dual)*[w_f'*h_f(:,k) 1]*P4(2:3,3,k)*w_g'*h_g(:,k))/((1-lamda_dual)*(w_g'*h_g(:,k))^2*P4(3,3,k)+(theta_4(2)*w_g'*h_g(:,k))^2);
    u_dual_5(k) = ((input_ref(k+1)-theta_5(1)*w_f'*h_f(:,k)-theta_5(3))*(theta_5(2)*w_g'*h_g(:,k))-(1-lamda_dual)*[w_f'*h_f(:,k) 1]*P5(2:3,3,k)*w_g'*h_g(:,k))/((1-lamda_dual)*(w_g'*h_g(:,k))^2*P5(3,3,k)+(theta_5(2)*w_g'*h_g(:,k))^2);
    u_dual_6(k) = ((input_ref(k+1)-theta_6(1)*w_f'*h_f(:,k)-theta_6(3))*(theta_6(2)*w_g'*h_g(:,k))-(1-lamda_dual)*[w_f'*h_f(:,k) 1]*P6(2:3,3,k)*w_g'*h_g(:,k))/((1-lamda_dual)*(w_g'*h_g(:,k))^2*P6(3,3,k)+(theta_6(2)*w_g'*h_g(:,k))^2);
    u_dual_7(k) = ((input_ref(k+1)-theta_7(1)*w_f'*h_f(:,k)-theta_7(3))*(theta_7(2)*w_g'*h_g(:,k))-(1-lamda_dual)*[w_f'*h_f(:,k) 1]*P7(2:3,3,k)*w_g'*h_g(:,k))/((1-lamda_dual)*(w_g'*h_g(:,k))^2*P7(3,3,k)+(theta_7(2)*w_g'*h_g(:,k))^2);
    u_dual_8(k) = ((input_ref(k+1)-theta_8(1)*w_f'*h_f(:,k)-theta_8(3))*(theta_8(2)*w_g'*h_g(:,k))-(1-lamda_dual)*[w_f'*h_f(:,k) 1]*P8(2:3,3,k)*w_g'*h_g(:,k))/((1-lamda_dual)*(w_g'*h_g(:,k))^2*P8(3,3,k)+(theta_8(2)*w_g'*h_g(:,k))^2);
    u_dual_9(k) = ((input_ref(k+1)-theta_9(1)*w_f'*h_f(:,k)-theta_9(3))*(theta_9(2)*w_g'*h_g(:,k))-(1-lamda_dual)*[w_f'*h_f(:,k) 1]*P9(2:3,3,k)*w_g'*h_g(:,k))/((1-lamda_dual)*(w_g'*h_g(:,k))^2*P9(3,3,k)+(theta_9(2)*w_g'*h_g(:,k))^2);
    u_dual_10(k) = ((input_ref(k+1)-theta_10(1)*w_f'*h_f(:,k)-theta_10(3))*(theta_10(2)*w_g'*h_g(:,k))-(1-lamda_dual)*[w_f'*h_f(:,k) 1]*P10(2:3,3,k)*w_g'*h_g(:,k))/((1-lamda_dual)*(w_g'*h_g(:,k))^2*P10(3,3,k)+(theta_10(2)*w_g'*h_g(:,k))^2);
    u_dual_11(k) = ((input_ref(k+1)-theta_11(1)*w_f'*h_f(:,k)-theta_11(3))*(theta_11(2)*w_g'*h_g(:,k))-(1-lamda_dual)*[w_f'*h_f(:,k) 1]*P11(2:3,3,k)*w_g'*h_g(:,k))/((1-lamda_dual)*(w_g'*h_g(:,k))^2*P11(3,3,k)+(theta_11(2)*w_g'*h_g(:,k))^2);
    u_dual_12(k) = ((input_ref(k+1)-theta_12(1)*w_f'*h_f(:,k)-theta_12(3))*(theta_12(2)*w_g'*h_g(:,k))-(1-lamda_dual)*[w_f'*h_f(:,k) 1]*P12(2:3,3,k)*w_g'*h_g(:,k))/((1-lamda_dual)*(w_g'*h_g(:,k))^2*P12(3,3,k)+(theta_12(2)*w_g'*h_g(:,k))^2);
    u_dual_13(k) = ((input_ref(k+1)-theta_13(1)*w_f'*h_f(:,k)-theta_13(3))*(theta_13(2)*w_g'*h_g(:,k))-(1-lamda_dual)*[w_f'*h_f(:,k) 1]*P13(2:3,3,k)*w_g'*h_g(:,k))/((1-lamda_dual)*(w_g'*h_g(:,k))^2*P13(3,3,k)+(theta_13(2)*w_g'*h_g(:,k))^2);
    u_dual_14(k) = ((input_ref(k+1)-theta_14(1)*w_f'*h_f(:,k)-theta_14(3))*(theta_14(2)*w_g'*h_g(:,k))-(1-lamda_dual)*[w_f'*h_f(:,k) 1]*P14(2:3,3,k)*w_g'*h_g(:,k))/((1-lamda_dual)*(w_g'*h_g(:,k))^2*P14(3,3,k)+(theta_14(2)*w_g'*h_g(:,k))^2);
    u_dual_15(k) = ((input_ref(k+1)-theta_15(1)*w_f'*h_f(:,k)-theta_15(3))*(theta_15(2)*w_g'*h_g(:,k))-(1-lamda_dual)*[w_f'*h_f(:,k) 1]*P15(2:3,3,k)*w_g'*h_g(:,k))/((1-lamda_dual)*(w_g'*h_g(:,k))^2*P15(3,3,k)+(theta_15(2)*w_g'*h_g(:,k))^2);
    u_dual_16(k) = ((input_ref(k+1)-theta_16(1)*w_f'*h_f(:,k)-theta_16(3))*(theta_16(2)*w_g'*h_g(:,k))-(1-lamda_dual)*[w_f'*h_f(:,k) 1]*P16(2:3,3,k)*w_g'*h_g(:,k))/((1-lamda_dual)*(w_g'*h_g(:,k))^2*P16(3,3,k)+(theta_16(2)*w_g'*h_g(:,k))^2);
    u_dual_17(k) = ((input_ref(k+1)-theta_17(1)*w_f'*h_f(:,k)-theta_17(3))*(theta_17(2)*w_g'*h_g(:,k))-(1-lamda_dual)*[w_f'*h_f(:,k) 1]*P17(2:3,3,k)*w_g'*h_g(:,k))/((1-lamda_dual)*(w_g'*h_g(:,k))^2*P17(3,3,k)+(theta_17(2)*w_g'*h_g(:,k))^2);
    u_dual_18(k) = ((input_ref(k+1)-theta_18(1)*w_f'*h_f(:,k)-theta_18(3))*(theta_18(2)*w_g'*h_g(:,k))-(1-lamda_dual)*[w_f'*h_f(:,k) 1]*P18(2:3,3,k)*w_g'*h_g(:,k))/((1-lamda_dual)*(w_g'*h_g(:,k))^2*P18(3,3,k)+(theta_18(2)*w_g'*h_g(:,k))^2);
    u_dual_19(k) = ((input_ref(k+1)-theta_19(1)*w_f'*h_f(:,k)-theta_19(3))*(theta_19(2)*w_g'*h_g(:,k))-(1-lamda_dual)*[w_f'*h_f(:,k) 1]*P19(2:3,3,k)*w_g'*h_g(:,k))/((1-lamda_dual)*(w_g'*h_g(:,k))^2*P19(3,3,k)+(theta_19(2)*w_g'*h_g(:,k))^2);
    u_dual_20(k) = ((input_ref(k+1)-theta_20(1)*w_f'*h_f(:,k)-theta_20(3))*(theta_20(2)*w_g'*h_g(:,k))-(1-lamda_dual)*[w_f'*h_f(:,k) 1]*P20(2:3,3,k)*w_g'*h_g(:,k))/((1-lamda_dual)*(w_g'*h_g(:,k))^2*P20(3,3,k)+(theta_20(2)*w_g'*h_g(:,k))^2);
    u_dual_21(k) = ((input_ref(k+1)-theta_21(1)*w_f'*h_f(:,k)-theta_21(3))*(theta_21(2)*w_g'*h_g(:,k))-(1-lamda_dual)*[w_f'*h_f(:,k) 1]*P21(2:3,3,k)*w_g'*h_g(:,k))/((1-lamda_dual)*(w_g'*h_g(:,k))^2*P21(3,3,k)+(theta_21(2)*w_g'*h_g(:,k))^2);


    u_opt(k) = (input_ref(k+1)-alpha_real(k)*w_f'*h_f(:,k)-gamma_real(k))/(beta_real(k)*w_g'*h_g(:,k));

    u_q(k) = q_1*u_dual_1(k)+q_2*u_dual_2(k)+q_3*u_dual_3(k)+q_4*u_dual_4(k)+q_5*u_dual_5(k)+q_6*u_dual_6(k)+q_7*u_dual_7(k)+q_8*u_dual_8(k)+q_9*u_dual_9(k)+q_10*u_dual_10(k)...
         +q_11*u_dual_11(k)+q_12*u_dual_12(k)+q_13*u_dual_13(k)+q_14*u_dual_14(k)+q_15*u_dual_15(k)+q_16*u_dual_16(k)+q_17*u_dual_17(k)+q_18*u_dual_18(k)+q_19*u_dual_19(k)+q_20*u_dual_20(k)+q_21*u_dual_21(k);

    y(k+1) = alpha_real(k)*(sin(x(k))+cos(3*x(k)))+beta_real(k)*(2+cos(x(k)))*u_q(k)+gamma_real(k)+e(k+1);

    x(:,k+1) = y(k+1);

    w_f_q = w_f;
    w_g_q = w_g;

    gamma_q = q_1*theta_1(3)+q_2*theta_2(3)+q_3*theta_3(3)+q_4*theta_4(3)+q_5*theta_5(3)...
            +q_6*theta_6(3)+q_7*theta_7(3)+q_8*theta_8(3)+q_9*theta_9(3)+q_10*theta_10(3)...
            +q_11*theta_11(3)+q_12*theta_12(3)+q_13*theta_13(3)+q_14*theta_14(3)+q_15*theta_15(3)...
            +q_16*theta_16(3)+q_17*theta_17(3)+q_18*theta_18(3)+q_19*theta_19(3)+q_20*theta_20(3)+q_21*theta_21(3);

    y_hat_q(k+1) = w_f_q'*h_f(:,k)+w_g_q'*h_g(:,k)*u_q(k)+gamma_q;

    y_error(k+1) = abs(y(k+1)-y_hat_q(k+1));


    y_hat_1(k+1) = theta_1(1)*w_f'*h_f(:,k)+theta_1(2)*w_g'*h_g(:,k)*u_q(k)+theta_1(3);
    delta_1 = delta+((theta_1(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_1(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_1(3)-gamma_real(k))^2;
    pdf_1 = 1/delta_1*exp(-(y(k+1)-y_hat_1(k+1))^2/2/delta_1);
    
    y_hat_2(k+1) = theta_2(1)*w_f'*h_f(:,k)+theta_2(2)*w_g'*h_g(:,k)*u_q(k)+theta_2(3);
    delta_2 = delta+((theta_2(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_2(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_2(3)-gamma_real(k))^2;
    pdf_2 = 1/delta_2*exp(-(y(k+1)-y_hat_2(k+1))^2/2/delta_2);
    
    y_hat_3(k+1) = theta_3(1)*w_f'*h_f(:,k)+theta_3(2)*w_g'*h_g(:,k)*u_q(k)+theta_3(3);
    delta_3 = delta+((theta_3(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_3(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_3(3)-gamma_real(k))^2;
    pdf_3 = 1/delta_3*exp(-(y(k+1)-y_hat_3(k+1))^2/2/delta_3);
    
    y_hat_4(k+1) = theta_4(1)*w_f'*h_f(:,k)+theta_4(2)*w_g'*h_g(:,k)*u_q(k)+theta_4(3);
    delta_4 = delta+((theta_4(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_4(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_4(3)-gamma_real(k))^2;
    pdf_4 = 1/delta_4*exp(-(y(k+1)-y_hat_4(k+1))^2/2/delta_4);
    
    y_hat_5(k+1) = theta_5(1)*w_f'*h_f(:,k)+theta_5(2)*w_g'*h_g(:,k)*u_q(k)+theta_5(3);
    delta_5 = delta+((theta_5(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_5(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_5(3)-gamma_real(k))^2;
    pdf_5 = 1/delta_5*exp(-(y(k+1)-y_hat_5(k+1))^2/2/delta_5);
 
    y_hat_6(k+1) = theta_6(1)*w_f'*h_f(:,k)+theta_6(2)*w_g'*h_g(:,k)*u_q(k)+theta_6(3);
    delta_6 = delta+((theta_6(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_6(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_6(3)-gamma_real(k))^2;
    pdf_6 = 1/delta_6*exp(-(y(k+1)-y_hat_6(k+1))^2/2/delta_6);
    
    y_hat_7(k+1) = theta_7(1)*w_f'*h_f(:,k)+theta_7(2)*w_g'*h_g(:,k)*u_q(k)+theta_7(3);
    delta_7 = delta+((theta_7(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_7(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_7(3)-gamma_real(k))^2;
    pdf_7 = 1/delta_7*exp(-(y(k+1)-y_hat_7(k+1))^2/2/delta_7);
    
    y_hat_8(k+1) = theta_8(1)*w_f'*h_f(:,k)+theta_8(2)*w_g'*h_g(:,k)*u_q(k)+theta_8(3);
    delta_8 = delta+((theta_8(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_8(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_8(3)-gamma_real(k))^2;
    pdf_8 = 1/delta_8*exp(-(y(k+1)-y_hat_8(k+1))^2/2/delta_8);
    
    y_hat_9(k+1) = theta_9(1)*w_f'*h_f(:,k)+theta_9(2)*w_g'*h_g(:,k)*u_q(k)+theta_9(3);
    delta_9 = delta+((theta_9(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_9(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_9(3)-gamma_real(k))^2;
    pdf_9 = 1/delta_9*exp(-(y(k+1)-y_hat_9(k+1))^2/2/delta_9);
    
    y_hat_10(k+1) = theta_10(1)*w_f'*h_f(:,k)+theta_10(2)*w_g'*h_g(:,k)*u_q(k)+theta_10(3);
    delta_10 = delta+((theta_10(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_10(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_10(3)-gamma_real(k))^2;
    pdf_10 = 1/delta_10*exp(-(y(k+1)-y_hat_10(k+1))^2/2/delta_10);    
    
    y_hat_11(k+1) = theta_11(1)*w_f'*h_f(:,k)+theta_11(2)*w_g'*h_g(:,k)*u_q(k)+theta_11(3);
    delta_11 = delta+((theta_11(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_11(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_11(3)-gamma_real(k))^2;
    pdf_11 = 1/delta_11*exp(-(y(k+1)-y_hat_11(k+1))^2/2/delta_11);
    
    y_hat_12(k+1) = theta_12(1)*w_f'*h_f(:,k)+theta_12(2)*w_g'*h_g(:,k)*u_q(k)+theta_12(3);
    delta_12 = delta+((theta_12(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_12(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_12(3)-gamma_real(k))^2;
    pdf_12 = 1/delta_12*exp(-(y(k+1)-y_hat_12(k+1))^2/2/delta_12);
    
    y_hat_13(k+1) = theta_13(1)*w_f'*h_f(:,k)+theta_13(2)*w_g'*h_g(:,k)*u_q(k)+theta_13(3);
    delta_13 = delta+((theta_13(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_13(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_13(3)-gamma_real(k))^2;
    pdf_13 = 1/delta_13*exp(-(y(k+1)-y_hat_13(k+1))^2/2/delta_13);
    
    y_hat_14(k+1) = theta_14(1)*w_f'*h_f(:,k)+theta_14(2)*w_g'*h_g(:,k)*u_q(k)+theta_14(3);
    delta_14 = delta+((theta_14(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_14(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_14(3)-gamma_real(k))^2;
    pdf_14 = 1/delta_14*exp(-(y(k+1)-y_hat_14(k+1))^2/2/delta_14);
    
    y_hat_15(k+1) = theta_15(1)*w_f'*h_f(:,k)+theta_15(2)*w_g'*h_g(:,k)*u_q(k)+theta_15(3);
    delta_15 = delta+((theta_15(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_15(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_15(3)-gamma_real(k))^2;
    pdf_15 = 1/delta_15*exp(-(y(k+1)-y_hat_15(k+1))^2/2/delta_15);

    y_hat_16(k+1) = theta_16(1)*w_f'*h_f(:,k)+theta_16(2)*w_g'*h_g(:,k)*u_q(k)+theta_16(3);
    delta_16 = delta+((theta_16(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_16(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_16(3)-gamma_real(k))^2;
    pdf_16 = 1/delta_16*exp(-(y(k+1)-y_hat_16(k+1))^2/2/delta_16);
    
    y_hat_17(k+1) = theta_17(1)*w_f'*h_f(:,k)+theta_17(2)*w_g'*h_g(:,k)*u_q(k)+theta_17(3);
    delta_17 = delta+((theta_17(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_17(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_17(3)-gamma_real(k))^2;
    pdf_17 = 1/delta_17*exp(-(y(k+1)-y_hat_17(k+1))^2/2/delta_17);
    
    y_hat_18(k+1) = theta_18(1)*w_f'*h_f(:,k)+theta_18(2)*w_g'*h_g(:,k)*u_q(k)+theta_18(3);
    delta_18 = delta+((theta_18(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_18(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_18(3)-gamma_real(k))^2;
    pdf_18 = 1/delta_18*exp(-(y(k+1)-y_hat_18(k+1))^2/2/delta_18);
    
    y_hat_19(k+1) = theta_19(1)*w_f'*h_f(:,k)+theta_19(2)*w_g'*h_g(:,k)*u_q(k)+theta_19(3);
    delta_19 = delta+((theta_19(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_19(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_19(3)-gamma_real(k))^2;
    pdf_19 = 1/delta_19*exp(-(y(k+1)-y_hat_19(k+1))^2/2/delta_19);
    
    y_hat_20(k+1) = theta_20(1)*w_f'*h_f(:,k)+theta_20(2)*w_g'*h_g(:,k)*u_q(k)+theta_20(3);
    delta_20 = delta+((theta_20(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_20(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_20(3)-gamma_real(k))^2;
    pdf_20 = 1/delta_20*exp(-(y(k+1)-y_hat_20(k+1))^2/2/delta_20);   

    y_hat_21(k+1) = theta_21(1)*w_f'*h_f(:,k)+theta_21(2)*w_g'*h_g(:,k)*u_q(k)+theta_21(3);
    delta_21 = delta+((theta_21(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_21(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_21(3)-gamma_real(k))^2;
    pdf_21 = 1/delta_21*exp(-(y(k+1)-y_hat_21(k+1))^2/2/delta_21);       
    
    q_sum = pdf_1*q_1+pdf_2*q_2+pdf_3*q_3+pdf_4*q_4+pdf_5*q_5+pdf_6*q_6+pdf_7*q_7+pdf_8*q_8+pdf_9*q_9+pdf_10*q_10...
            +pdf_11*q_11+pdf_12*q_12+pdf_13*q_13+pdf_14*q_14+pdf_15*q_15+pdf_16*q_16+pdf_17*q_17+pdf_18*q_18+pdf_19*q_19+pdf_20*q_20+pdf_21*q_21;

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
    q_16 = pdf_16*q_16/q_sum;
    q_17 = pdf_17*q_17/q_sum;
    q_18 = pdf_18*q_18/q_sum;
    q_19 = pdf_19*q_19/q_sum;
    q_20 = pdf_20*q_20/q_sum;
    q_21 = pdf_21*q_21/q_sum;

    if y_error(k+1) >0.5
        if q_1>0.98 || q_2>0.98 || q_3>0.98 || q_4>0.98 || q_5>0.98 || q_6>0.98 || q_7>0.98 || q_8>0.98 || q_9>0.98 || q_10>0.98 ||...
           q_11>0.98 || q_12>0.98 || q_13>0.98 || q_14>0.98 || q_15>0.98 || q_16>0.98 || q_17>0.98 || q_18>0.98 || q_19>0.98 || q_20>0.98 || q_21>0.98
           
            q_1 = 1/21;q_2 = 1/21;q_3 = 1/21;q_4 = 1/21;q_5 = 1/21;
            q_6 = 1/21;q_7 = 1/21;q_8 = 1/21;q_9 = 1/21;q_10 = 1/21;
            q_11 = 1/21;q_12 = 1/21;q_13 = 1/21;q_14 = 1/21;q_15 = 1/21;
            q_16 = 1/21;q_17 = 1/21;q_18 = 1/21;q_19 = 1/21;q_20 = 1/21; q_21 = 1/21;

            P1(:,:,k) = var_P_V*eye(3,3);
            P2(:,:,k) = var_P_V*eye(3,3);
            P3(:,:,k) = var_P_V*eye(3,3);
            P4(:,:,k) = var_P_V*eye(3,3);
            P5(:,:,k) = var_P_V*eye(3,3);
            P6(:,:,k) = var_P_V*eye(3,3);
            P7(:,:,k) = var_P_V*eye(3,3);
            P8(:,:,k) = var_P_V*eye(3,3);
            P9(:,:,k) = var_P_V*eye(3,3);
            P10(:,:,k) = var_P_V*eye(3,3);
            P11(:,:,k) = var_P_V*eye(3,3);
            P12(:,:,k) = var_P_V*eye(3,3);
            P13(:,:,k) = var_P_V*eye(3,3);
            P14(:,:,k) = var_P_V*eye(3,3);
            P15(:,:,k) = var_P_V*eye(3,3);
            P16(:,:,k) = var_P_V*eye(3,3);
            P17(:,:,k) = var_P_V*eye(3,3);
            P18(:,:,k) = var_P_V*eye(3,3);
            P19(:,:,k) = var_P_V*eye(3,3);
            P20(:,:,k) = var_P_V*eye(3,3);
            P21(:,:,k) = var_P_V*eye(3,3);

        end
    end

    P1(:,:,k+1) =  prob_coef/q_1*P1(:,:,k);
    P2(:,:,k+1) =  prob_coef/q_2*P2(:,:,k);
    P3(:,:,k+1) =  prob_coef/q_3*P3(:,:,k);
    P4(:,:,k+1) =  prob_coef/q_4*P4(:,:,k);
    P5(:,:,k+1) =  prob_coef/q_5*P5(:,:,k);
    P6(:,:,k+1) =  prob_coef/q_6*P6(:,:,k);
    P7(:,:,k+1) =  prob_coef/q_7*P7(:,:,k);
    P8(:,:,k+1) =  prob_coef/q_8*P8(:,:,k);
    P9(:,:,k+1) =  prob_coef/q_9*P9(:,:,k);
    P10(:,:,k+1) =  prob_coef/q_10*P10(:,:,k);
    P11(:,:,k+1) =  prob_coef/q_11*P11(:,:,k);
    P12(:,:,k+1) =  prob_coef/q_12*P12(:,:,k);
    P13(:,:,k+1) =  prob_coef/q_13*P13(:,:,k);
    P14(:,:,k+1) =  prob_coef/q_14*P14(:,:,k);
    P15(:,:,k+1) =  prob_coef/q_15*P15(:,:,k);
    P16(:,:,k+1) =  prob_coef/q_16*P16(:,:,k);
    P17(:,:,k+1) =  prob_coef/q_17*P17(:,:,k);
    P18(:,:,k+1) =  prob_coef/q_18*P18(:,:,k);
    P19(:,:,k+1) =  prob_coef/q_19*P19(:,:,k);
    P20(:,:,k+1) =  prob_coef/q_20*P20(:,:,k);
    P21(:,:,k+1) =  prob_coef/q_21*P21(:,:,k);

    if trace(P1(:,:,k+1)) > 1e5
        P1(:,:,k+1) = P1(:,:,k);
    end
    if trace(P2(:,:,k+1)) > 1e5
        P2(:,:,k+1) = P2(:,:,k);
    end
    if trace(P3(:,:,k+1)) > 1e5
        P3(:,:,k+1) = P3(:,:,k);
    end
    if trace(P4(:,:,k+1)) > 1e5
        P4(:,:,k+1) = P4(:,:,k);
    end
    if trace(P5(:,:,k+1)) > 1e5
        P5(:,:,k+1) = P5(:,:,k);
    end
    if trace(P6(:,:,k+1)) > 1e5
        P6(:,:,k+1) = P6(:,:,k);
    end
    if trace(P7(:,:,k+1)) > 1e5
        P7(:,:,k+1) = P7(:,:,k);
    end
    if trace(P8(:,:,k+1)) > 1e5
        P8(:,:,k+1) = P8(:,:,k);
    end
    if trace(P9(:,:,k+1)) > 1e5
        P9(:,:,k+1) = P9(:,:,k);
    end
    if trace(P10(:,:,k+1)) > 1e5
        P10(:,:,k+1) = P10(:,:,k);
    end
    if trace(P11(:,:,k+1)) > 1e5
        P11(:,:,k+1) = P11(:,:,k);
    end
    if trace(P12(:,:,k+1)) > 1e5
        P12(:,:,k+1) = P12(:,:,k);
    end
    if trace(P13(:,:,k+1)) > 1e5
        P13(:,:,k+1) = P13(:,:,k);
    end
    if trace(P14(:,:,k+1)) > 1e5
        P14(:,:,k+1) = P14(:,:,k);
    end
    if trace(P15(:,:,k+1)) > 1e5
        P15(:,:,k+1) = P15(:,:,k);
    end
    if trace(P16(:,:,k+1)) > 1e5
        P16(:,:,k+1) = P16(:,:,k);
    end
    if trace(P17(:,:,k+1)) > 1e5
        P17(:,:,k+1) = P17(:,:,k);
    end
    if trace(P18(:,:,k+1)) > 1e5
        P18(:,:,k+1) = P18(:,:,k);
    end
    if trace(P19(:,:,k+1)) > 1e5
        P19(:,:,k+1) = P19(:,:,k);
    end
    if trace(P20(:,:,k+1)) > 1e5
        P20(:,:,k+1) = P20(:,:,k);
    end
    if trace(P21(:,:,k+1)) > 1e5
        P21(:,:,k+1) = P21(:,:,k);
    end


end


figure(1);
plot(input_ref,'--','LineWidth',2);hold on;
plot(y,'LineWidth',1);hold off;
set(gca,'FontSize',12);
xlabel('k','FontSize',12);
ylabel('system output','FontSize',12)
legend('y_r(k)','y(k)')

axes('position', [0.1 0.5 0.1 0.1]);
box on
xindex = 1:1:21;
plot(xindex,input_ref(xindex),'--','LineWidth',2);hold on;
plot(xindex,y(xindex),'LineWidth',1);hold off;

axes('position', [0.3 0.3 0.1 0.1]);
box on
xindex = 198:1:218;
plot(xindex,input_ref(xindex),'--','LineWidth',2);hold on;
plot(xindex,y(xindex),'LineWidth',1);hold off;

axes('position', [0.6 0.6 0.1 0.1]);
box on
xindex = 398:1:418;
plot(xindex,input_ref(xindex),'--','LineWidth',2);hold on;
plot(xindex,y(xindex),'LineWidth',1);hold off;

axes('position', [0.7 0.1 0.1 0.1]);
box on
xindex = 498:1:518;
plot(xindex,input_ref(xindex),'--','LineWidth',2);hold on;
plot(xindex,y(xindex),'LineWidth',1);hold off;


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
plot(q_15_plot,'^-');hold on;
plot(q_16_plot,'d-');hold on;
plot(q_17_plot,'<-');hold on;
plot(q_18_plot,'>-');hold on;
plot(q_19_plot,'p-');hold on;
plot(q_20_plot,'h-');hold on;
plot(q_21_plot,'h-');hold off;

legend('\pi(\theta_1)','\pi(\theta_2)','\pi(\theta_3)','\pi(\theta_4)','\pi(\theta_5)','\pi(\theta_6)','\pi(\theta_7)','\pi(\theta_8)','\pi(\theta_9)','\pi(\theta_{10})',...
    '\pi(\theta_{11})','\pi(\theta_{12})','\pi(\theta_{13})','\pi(\theta_{14})','\pi(\theta_{15})','\pi(\theta_{16})','\pi(\theta_{17})','\pi(\theta_{18})','\pi(\theta_{19})','\pi(\theta_{20})','\pi(\theta_{21})');
axis([0 600 -0.1 1.4])
set(gca,'FontSize',12);
xlabel('k','FontSize',12);
ylabel('Bayesian posterior probability','FontSize',12)

figure(3)
plot(u_opt,'o-');hold on;
plot(u_q,'.-');hold off;
set(gca,'FontSize',12);
xlabel('k','FontSize',12);
ylabel('input signal','FontSize',12)
legend('u_{opt}(k)','u(k)') 

axes('position', [0.1 0.5 0.1 0.1]);
box on
xindex = 1:1:15;
plot(xindex,u_opt(xindex),'o-','LineWidth',1);hold on;
plot(xindex,u_q(xindex),'.-','LineWidth',1);hold off;

axes('position', [0.3 0.3 0.1 0.1]);
box on
xindex = 198:1:213;
plot(xindex,u_opt(xindex),'o-','LineWidth',1);hold on;
plot(xindex,u_q(xindex),'.-','LineWidth',1);hold off;

axes('position', [0.5 0.5 0.1 0.1]);
box on
xindex = 301:1:315;
plot(xindex,u_opt(xindex),'o-','LineWidth',1);hold on;
plot(xindex,u_q(xindex),'.-','LineWidth',1);hold off;

axes('position', [0.6 0.6 0.1 0.1]);
box on
xindex = 398:1:413;
plot(xindex,u_opt(xindex),'o-','LineWidth',1);hold on;
plot(xindex,u_q(xindex),'.-','LineWidth',1);hold off;

axes('position', [0.7 0.5 0.1 0.1]);
box on
xindex = 420:1:435;
plot(xindex,u_opt(xindex),'o-','LineWidth',1);hold on;
plot(xindex,u_q(xindex),'.-','LineWidth',1);hold off;

axes('position', [0.7 0.1 0.1 0.1]);
box on
xindex = 498:1:513;
plot(xindex,u_opt(xindex),'o-','LineWidth',1);hold on;
plot(xindex,u_q(xindex),'.-','LineWidth',1);hold off;


