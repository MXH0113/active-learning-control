clear;
clc;
close all

xi = 0.06;
T = 0.1;
c0 = 0.79;
c1 = 0.0064;
c2 = 0.000115;

N=600;

%  reference input 
k = 0:0.02:12;
input_ref(1:601) = 270+50*(1-exp(-k));
plot(input_ref);

delta = 1;
e = 1*rands(N,1);

w_f = [ -89.7837  -59.2076  -31.5564   -6.8539   14.8930   33.6945   49.5783   62.5889   72.7885   80.2560 ...
         85.0870   87.3936   87.3034   84.9594   80.5193   74.1542   66.0484   56.3980   45.4101   33.3016 ...
         20.2981    6.6326   -7.4556  -21.7223  -35.9201  -49.7991  -63.1088  -75.5995  -87.0234  -97.1363 ...
       -105.6989 -112.4782 -117.2488 -119.7940 -119.9078 -117.3949 -112.0731 -103.7735  -92.3416  -77.6387 ...
        -59.5422  -37.9465  -12.7637   16.0759   48.6236   84.9114  124.9526  168.7409  216.2511  267.4385 ...
        322.2398  ]';
b_f = 80;
m_f = 250:2:350;

w_g = [ 0.0044    0.0032    0.0036    0.0036    0.0032    0.0044]';
b_g = 50;
m_g = -10:74:360;

alpha_1 = 0.75;
alpha_2 = 0.8;
alpha_3 = 0.85;
alpha_4 = 0.9;
alpha_5 = 0.95;
alpha_6 = 1.0;
alpha_7 = 1.05;

beta_1 = 1.0;

gamma_1 = -12.5;
gamma_2 = -11.5;
gamma_3 = -10.5;
gamma_4 = -9.5;
gamma_5 = -8.5;
gamma_6 = -7.5;
gamma_7 = -6.5;
gamma_8 = -5.5;
gamma_9 = -4.5;
gamma_10 = -3.5;
gamma_11 = -2.5;
gamma_12 = -1.5;
gamma_13 = -0.5;
gamma_14 = 0.5;
gamma_15 = 1.5;

theta_1 = [alpha_1; beta_1; gamma_1];
theta_2 = [alpha_1; beta_1; gamma_2];
theta_3 = [alpha_1; beta_1; gamma_3];
theta_4 = [alpha_1; beta_1; gamma_4];
theta_5 = [alpha_1; beta_1; gamma_5];
theta_6 = [alpha_1; beta_1; gamma_6];
theta_7 = [alpha_1; beta_1; gamma_7];
theta_8 = [alpha_1; beta_1; gamma_8];
theta_9 = [alpha_1; beta_1; gamma_9];
theta_10 = [alpha_1; beta_1; gamma_10];
theta_11 = [alpha_1; beta_1; gamma_11];
theta_12 = [alpha_1; beta_1; gamma_12];
theta_13 = [alpha_1; beta_1; gamma_13];
theta_14 = [alpha_1; beta_1; gamma_14];
theta_15 = [alpha_1; beta_1; gamma_15];
theta_16 = [alpha_2; beta_1; gamma_1];
theta_17 = [alpha_2; beta_1; gamma_2];
theta_18 = [alpha_2; beta_1; gamma_3];
theta_19 = [alpha_2; beta_1; gamma_4];
theta_20 = [alpha_2; beta_1; gamma_5];
theta_21 = [alpha_2; beta_1; gamma_6];
theta_22 = [alpha_2; beta_1; gamma_7];
theta_23 = [alpha_2; beta_1; gamma_8];
theta_24 = [alpha_2; beta_1; gamma_9];
theta_25 = [alpha_2; beta_1; gamma_10];
theta_26 = [alpha_2; beta_1; gamma_11];
theta_27 = [alpha_2; beta_1; gamma_12];
theta_28 = [alpha_2; beta_1; gamma_13];
theta_29 = [alpha_2; beta_1; gamma_14];
theta_30 = [alpha_2; beta_1; gamma_15];
theta_31 = [alpha_3; beta_1; gamma_1];
theta_32 = [alpha_3; beta_1; gamma_2];
theta_33 = [alpha_3; beta_1; gamma_3];
theta_34 = [alpha_3; beta_1; gamma_4];
theta_35 = [alpha_3; beta_1; gamma_5];
theta_36 = [alpha_3; beta_1; gamma_6];
theta_37 = [alpha_3; beta_1; gamma_7];
theta_38 = [alpha_3; beta_1; gamma_8];
theta_39 = [alpha_3; beta_1; gamma_9];
theta_40 = [alpha_3; beta_1; gamma_10];
theta_41 = [alpha_3; beta_1; gamma_11];
theta_42 = [alpha_3; beta_1; gamma_12];
theta_43 = [alpha_3; beta_1; gamma_13];
theta_44 = [alpha_3; beta_1; gamma_14];
theta_45 = [alpha_3; beta_1; gamma_15];
theta_46 = [alpha_4; beta_1; gamma_1];
theta_47 = [alpha_4; beta_1; gamma_2];
theta_48 = [alpha_4; beta_1; gamma_3];
theta_49 = [alpha_4; beta_1; gamma_4];
theta_50 = [alpha_4; beta_1; gamma_5];
theta_51 = [alpha_4; beta_1; gamma_6];
theta_52 = [alpha_4; beta_1; gamma_7];
theta_53 = [alpha_4; beta_1; gamma_8];
theta_54 = [alpha_4; beta_1; gamma_9];
theta_55 = [alpha_4; beta_1; gamma_10];
theta_56 = [alpha_4; beta_1; gamma_11];
theta_57 = [alpha_4; beta_1; gamma_12];
theta_58 = [alpha_4; beta_1; gamma_13];
theta_59 = [alpha_4; beta_1; gamma_14];
theta_60 = [alpha_4; beta_1; gamma_15];
theta_61 = [alpha_5; beta_1; gamma_1];
theta_62 = [alpha_5; beta_1; gamma_2];
theta_63 = [alpha_5; beta_1; gamma_3];
theta_64 = [alpha_5; beta_1; gamma_4];
theta_65 = [alpha_5; beta_1; gamma_5];
theta_66 = [alpha_5; beta_1; gamma_6];
theta_67 = [alpha_5; beta_1; gamma_7];
theta_68 = [alpha_5; beta_1; gamma_8];
theta_69 = [alpha_5; beta_1; gamma_9];
theta_70 = [alpha_5; beta_1; gamma_10];
theta_71 = [alpha_5; beta_1; gamma_11];
theta_72 = [alpha_5; beta_1; gamma_12];
theta_73 = [alpha_5; beta_1; gamma_13];
theta_74 = [alpha_5; beta_1; gamma_14];
theta_75 = [alpha_5; beta_1; gamma_15];
theta_76 = [alpha_6; beta_1; gamma_1];
theta_77 = [alpha_6; beta_1; gamma_2];
theta_78 = [alpha_6; beta_1; gamma_3];
theta_79 = [alpha_6; beta_1; gamma_4];
theta_80 = [alpha_6; beta_1; gamma_5];
theta_81 = [alpha_6; beta_1; gamma_6];
theta_82 = [alpha_6; beta_1; gamma_7];
theta_83 = [alpha_6; beta_1; gamma_8];
theta_84 = [alpha_6; beta_1; gamma_9];
theta_85 = [alpha_6; beta_1; gamma_10];
theta_86 = [alpha_6; beta_1; gamma_11];
theta_87 = [alpha_6; beta_1; gamma_12];
theta_88 = [alpha_6; beta_1; gamma_13];
theta_89 = [alpha_6; beta_1; gamma_14];
theta_90 = [alpha_6; beta_1; gamma_15];
theta_91 = [alpha_7; beta_1; gamma_1];
theta_92 = [alpha_7; beta_1; gamma_2];
theta_93 = [alpha_7; beta_1; gamma_3];
theta_94 = [alpha_7; beta_1; gamma_4];
theta_95 = [alpha_7; beta_1; gamma_5];
theta_96 = [alpha_7; beta_1; gamma_6];
theta_97 = [alpha_7; beta_1; gamma_7];
theta_98 = [alpha_7; beta_1; gamma_8];
theta_99 = [alpha_7; beta_1; gamma_9];
theta_100 = [alpha_7; beta_1; gamma_10];
theta_101 = [alpha_7; beta_1; gamma_11];
theta_102 = [alpha_7; beta_1; gamma_12];
theta_103 = [alpha_7; beta_1; gamma_13];
theta_104 = [alpha_7; beta_1; gamma_14];
theta_105 = [alpha_7; beta_1; gamma_15];

% alpha_rand = 0.75+(1.25-0.75)*rand(1,1);
% beta_rand = 0.75+(1.05-0.75)*rand(1,1);
for k = 1:N
%         alpha_real(k) = 0.8;
%         beta_real(k) = 1.0;
%         gamma_real(k)=-12.8;
    if k>=1 && k<100
        alpha_real(k) = 1.0;
        beta_real(k) = 1.0;
        gamma_real(k)=0;
    elseif k>=100 && k<250
        alpha_real(k) = 1.05;
        beta_real(k) = 0.9;
        gamma_real(k)=0;
    elseif k>=250 && k<350
        alpha_real(k) = 0.95;
        beta_real(k) = 0.9;
        gamma_real(k)=0;
    elseif k>=350 && k<500
        alpha_real(k) = 0.92;
        beta_real(k) = 1.0;
        gamma_real(k)=-12.5;
    elseif k>=500 && k<600
        alpha_real(k) = 0.95;
        beta_real(k) = 1.15;
        gamma_real(k)=-2.25;
    end
end

x(1) = 270;
x(2) = 270;
y(1) = 270;
y(2) = 270;
for j=1:1:51
    h_f(j,1)=exp(-norm(x(1)-m_f(j))^2/(2*b_f^2));
end 

for j=1:1:6
    h_g(j,1)=exp(-norm(x(1)-m_g(j))^2/(2*b_g^2));
end 
u_opt(1) = (input_ref(2)-w_f'*h_f(:,1))/(w_g'*h_g(:,1));

for k = 1:N-2

    x(k+1) = alpha_real(k)*(x(k)+xi*T*(-c0-c1*x(k)-c2*x(k)^2))+beta_real(k)*(xi*T)*u_opt(k)+gamma_real(k)+e(k+1);
    y(:,k+1) = x(k+1);

    for j=1:1:51
        h_f(j,k+1)=exp(-norm(x(k+1)-m_f(j))^2/(2*b_f^2));
    end 

    for j=1:1:6
        h_g(j,k+1)=exp(-norm(x(k+1)-m_g(j))^2/(2*b_g^2));
    end  

    u_opt(k+1) = (input_ref(k+2)-alpha_real(k+1)*w_f'*h_f(:,k+1)-gamma_real(k+1))/(beta_real(k+1)*w_g'*h_g(:,k+1));

end

y_opt = y;


clear x y 

q_1 = 1/105;
q_2 = 1/105;
q_3 = 1/105;
q_4 = 1/105;
q_5 = 1/105;
q_6 = 1/105;
q_7 = 1/105;
q_8 = 1/105;
q_9 = 1/105;
q_10 = 1/105;
q_11 = 1/105;
q_12 = 1/105;
q_13 = 1/105;
q_14 = 1/105;
q_15 = 1/105;
q_16 = 1/105;
q_17 = 1/105;
q_18 = 1/105;
q_19 = 1/105;
q_20 = 1/105;
q_21 = 1/105;
q_22 = 1/105;
q_23 = 1/105;
q_24 = 1/105;
q_25 = 1/105;
q_26 = 1/105;
q_27 = 1/105;
q_28 = 1/105;
q_29 = 1/105;
q_30 = 1/105;
q_31 = 1/105;
q_32 = 1/105;
q_33 = 1/105;
q_34 = 1/105;
q_35 = 1/105;
q_36 = 1/105;
q_37 = 1/105;
q_38 = 1/105;
q_39 = 1/105;
q_40 = 1/105;
q_41 = 1/105;
q_42 = 1/105;
q_43 = 1/105;
q_44 = 1/105;
q_45 = 1/105;
q_46 = 1/105;
q_47 = 1/105;
q_48 = 1/105;
q_49 = 1/105;
q_50 = 1/105;
q_51 = 1/105;
q_52 = 1/105;
q_53 = 1/105;
q_54 = 1/105;
q_55 = 1/105;
q_56 = 1/105;
q_57 = 1/105;
q_58 = 1/105;
q_59 = 1/105;
q_60 = 1/105;
q_61 = 1/105;
q_62 = 1/105;
q_63 = 1/105;
q_64 = 1/105;
q_65 = 1/105;
q_66 = 1/105;
q_67 = 1/105;
q_68 = 1/105;
q_69 = 1/105;
q_70 = 1/105;
q_71 = 1/105;
q_72 = 1/105;
q_73 = 1/105;
q_74 = 1/105;
q_75 = 1/105;
q_76 = 1/105;
q_77 = 1/105;
q_78 = 1/105;
q_79 = 1/105;
q_80 = 1/105;
q_81 = 1/105;
q_82 = 1/105;
q_83 = 1/105;
q_84 = 1/105;
q_85 = 1/105;
q_86 = 1/105;
q_87 = 1/105;
q_88 = 1/105;
q_89 = 1/105;
q_90 = 1/105;
q_91 = 1/105;
q_92 = 1/105;
q_93 = 1/105;
q_94 = 1/105;
q_95 = 1/105;
q_96 = 1/105;
q_97 = 1/105;
q_98 = 1/105;
q_99 = 1/105;
q_100 = 1/105;
q_101 = 1/105;
q_102 = 1/105;
q_103 = 1/105;
q_104 = 1/105;
q_105 = 1/105;

x(1) = 270;
x(2) = 270;
y(1) = 270;
y(2) = 270;
for j=1:1:51
    h_f(j,1)=exp(-norm(x(1)-m_f(j))^2/(2*b_f^2));
end 

for j=1:1:6
    h_g(j,1)=exp(-norm(x(1)-m_g(j))^2/(2*b_g^2));
end 
u_q(1) = (input_ref(2)-w_f'*h_f(:,1))/(w_g'*h_g(:,1));

para_q = 0;

flag_reset = 0;

var_P_V = 1;

prob_coef = 1/105;

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
P22(:,:,2) = var_P_V*eye(3,3);
P23(:,:,2) = var_P_V*eye(3,3);
P24(:,:,2) = var_P_V*eye(3,3);
P25(:,:,2) = var_P_V*eye(3,3);
P26(:,:,2) = var_P_V*eye(3,3);
P27(:,:,2) = var_P_V*eye(3,3);
P28(:,:,2) = var_P_V*eye(3,3);
P29(:,:,2) = var_P_V*eye(3,3);
P30(:,:,2) = var_P_V*eye(3,3);
P31(:,:,2) = var_P_V*eye(3,3);
P32(:,:,2) = var_P_V*eye(3,3);
P33(:,:,2) = var_P_V*eye(3,3);
P34(:,:,2) = var_P_V*eye(3,3);
P35(:,:,2) = var_P_V*eye(3,3);
P36(:,:,2) = var_P_V*eye(3,3);
P37(:,:,2) = var_P_V*eye(3,3);
P38(:,:,2) = var_P_V*eye(3,3);
P39(:,:,2) = var_P_V*eye(3,3);
P40(:,:,2) = var_P_V*eye(3,3);
P41(:,:,2) = var_P_V*eye(3,3);
P42(:,:,2) = var_P_V*eye(3,3);
P43(:,:,2) = var_P_V*eye(3,3);
P44(:,:,2) = var_P_V*eye(3,3);
P45(:,:,2) = var_P_V*eye(3,3);
P46(:,:,2) = var_P_V*eye(3,3);
P47(:,:,2) = var_P_V*eye(3,3);
P48(:,:,2) = var_P_V*eye(3,3);
P49(:,:,2) = var_P_V*eye(3,3);
P50(:,:,2) = var_P_V*eye(3,3);
P51(:,:,2) = var_P_V*eye(3,3);
P52(:,:,2) = var_P_V*eye(3,3);
P53(:,:,2) = var_P_V*eye(3,3);
P54(:,:,2) = var_P_V*eye(3,3);
P55(:,:,2) = var_P_V*eye(3,3);
P56(:,:,2) = var_P_V*eye(3,3);
P57(:,:,2) = var_P_V*eye(3,3);
P58(:,:,2) = var_P_V*eye(3,3);
P59(:,:,2) = var_P_V*eye(3,3);
P60(:,:,2) = var_P_V*eye(3,3);
P61(:,:,2) = var_P_V*eye(3,3);
P62(:,:,2) = var_P_V*eye(3,3);
P63(:,:,2) = var_P_V*eye(3,3);
P64(:,:,2) = var_P_V*eye(3,3);
P65(:,:,2) = var_P_V*eye(3,3);
P66(:,:,2) = var_P_V*eye(3,3);
P67(:,:,2) = var_P_V*eye(3,3);
P68(:,:,2) = var_P_V*eye(3,3);
P69(:,:,2) = var_P_V*eye(3,3);
P70(:,:,2) = var_P_V*eye(3,3);
P71(:,:,2) = var_P_V*eye(3,3);
P72(:,:,2) = var_P_V*eye(3,3);
P73(:,:,2) = var_P_V*eye(3,3);
P74(:,:,2) = var_P_V*eye(3,3);
P75(:,:,2) = var_P_V*eye(3,3);
P76(:,:,2) = var_P_V*eye(3,3);
P77(:,:,2) = var_P_V*eye(3,3);
P78(:,:,2) = var_P_V*eye(3,3);
P79(:,:,2) = var_P_V*eye(3,3);
P80(:,:,2) = var_P_V*eye(3,3);
P81(:,:,2) = var_P_V*eye(3,3);
P82(:,:,2) = var_P_V*eye(3,3);
P83(:,:,2) = var_P_V*eye(3,3);
P84(:,:,2) = var_P_V*eye(3,3);
P85(:,:,2) = var_P_V*eye(3,3);
P86(:,:,2) = var_P_V*eye(3,3);
P87(:,:,2) = var_P_V*eye(3,3);
P88(:,:,2) = var_P_V*eye(3,3);
P89(:,:,2) = var_P_V*eye(3,3);
P90(:,:,2) = var_P_V*eye(3,3);
P91(:,:,2) = var_P_V*eye(3,3);
P92(:,:,2) = var_P_V*eye(3,3);
P93(:,:,2) = var_P_V*eye(3,3);
P94(:,:,2) = var_P_V*eye(3,3);
P95(:,:,2) = var_P_V*eye(3,3);
P96(:,:,2) = var_P_V*eye(3,3);
P97(:,:,2) = var_P_V*eye(3,3);
P98(:,:,2) = var_P_V*eye(3,3);
P99(:,:,2) = var_P_V*eye(3,3);
P100(:,:,2) = var_P_V*eye(3,3);
P101(:,:,2) = var_P_V*eye(3,3);
P102(:,:,2) = var_P_V*eye(3,3);
P103(:,:,2) = var_P_V*eye(3,3);
P104(:,:,2) = var_P_V*eye(3,3);
P105(:,:,2) = var_P_V*eye(3,3);

lamda_dual = 0.95;

for k = 1:N-2

    x(k+1) = alpha_real(k)*(x(k)+xi*T*(-c0-c1*x(k)-c2*x(k)^2))+beta_real(k)*(xi*T)*u_q(k)+gamma_real(k)+e(k+1);
    y(:,k+1) = x(k+1);

    w_f_q = (q_1*theta_1(1)+q_2*theta_2(1)+q_3*theta_3(1)+q_4*theta_4(1)+q_5*theta_5(1)...
        +q_6*theta_6(1)+q_7*theta_7(1)+q_8*theta_8(1)+q_9*theta_9(1)+q_10*theta_10(1)...
        +q_11*theta_11(1)+q_12*theta_12(1)+q_13*theta_13(1)+q_14*theta_14(1)+q_15*theta_15(1)...
        +q_16*theta_16(1)+q_17*theta_17(1)+q_18*theta_18(1)+q_19*theta_19(1)+q_20*theta_20(1)...
        +q_21*theta_21(1)+q_22*theta_22(1)+q_23*theta_23(1)+q_24*theta_24(1)+q_25*theta_25(1)...
        +q_26*theta_26(1)+q_27*theta_27(1)+q_28*theta_28(1)+q_29*theta_29(1)+q_30*theta_30(1)...
        +q_31*theta_31(1)+q_32*theta_32(1)+q_33*theta_33(1)+q_34*theta_34(1)+q_35*theta_35(1)...
        +q_36*theta_36(1)+q_37*theta_37(1)+q_38*theta_38(1)+q_39*theta_39(1)+q_40*theta_40(1)...
        +q_41*theta_41(1)+q_42*theta_42(1)+q_43*theta_43(1)+q_44*theta_44(1)+q_45*theta_45(1)...
        +q_46*theta_46(1)+q_47*theta_47(1)+q_48*theta_48(1)+q_49*theta_49(1)+q_50*theta_50(1)...
        +q_51*theta_51(1)+q_52*theta_52(1)+q_53*theta_53(1)+q_54*theta_54(1)+q_55*theta_55(1)...
        +q_56*theta_56(1)+q_57*theta_57(1)+q_58*theta_58(1)+q_59*theta_59(1)+q_60*theta_60(1)...
        +q_61*theta_61(1)+q_62*theta_62(1)+q_63*theta_63(1)+q_64*theta_64(1)+q_65*theta_65(1)...
        +q_66*theta_66(1)+q_67*theta_67(1)+q_68*theta_68(1)+q_69*theta_69(1)+q_70*theta_70(1)...
        +q_71*theta_71(1)+q_72*theta_72(1)+q_73*theta_73(1)+q_74*theta_74(1)+q_75*theta_75(1)...
        +q_76*theta_76(1)+q_77*theta_77(1)+q_78*theta_78(1)+q_79*theta_79(1)+q_80*theta_80(1)...
        +q_81*theta_81(1)+q_82*theta_82(1)+q_83*theta_83(1)+q_84*theta_84(1)+q_85*theta_85(1)...
        +q_86*theta_86(1)+q_87*theta_87(1)+q_88*theta_88(1)+q_89*theta_89(1)+q_90*theta_90(1)...
        +q_91*theta_91(1)+q_92*theta_92(1)+q_93*theta_93(1)+q_94*theta_94(1)+q_95*theta_95(1)...
        +q_96*theta_96(1)+q_97*theta_97(1)+q_98*theta_98(1)+q_99*theta_99(1)+q_100*theta_100(1)...
        +q_101*theta_101(1)+q_102*theta_102(1)+q_103*theta_103(1)+q_104*theta_104(1)+q_105*theta_105(1))*w_f;

    w_g_q = (q_1*theta_1(2)+q_2*theta_2(2)+q_3*theta_3(2)+q_4*theta_4(2)+q_5*theta_5(2)...
        +q_6*theta_6(2)+q_7*theta_7(2)+q_8*theta_8(2)+q_9*theta_9(2)+q_10*theta_10(2)...
        +q_11*theta_11(2)+q_12*theta_12(2)+q_13*theta_13(2)+q_14*theta_14(2)+q_15*theta_15(2)...
        +q_16*theta_16(2)+q_17*theta_17(2)+q_18*theta_18(2)+q_19*theta_19(2)+q_20*theta_20(2)...
        +q_21*theta_21(2)+q_22*theta_22(2)+q_23*theta_23(2)+q_24*theta_24(2)+q_25*theta_25(2)...
        +q_26*theta_26(2)+q_27*theta_27(2)+q_28*theta_28(2)+q_29*theta_29(2)+q_30*theta_30(2)...
        +q_31*theta_31(2)+q_32*theta_32(2)+q_33*theta_33(2)+q_34*theta_34(2)+q_35*theta_35(2)...
        +q_36*theta_36(2)+q_37*theta_37(2)+q_38*theta_38(2)+q_39*theta_39(2)+q_40*theta_40(2)...
        +q_41*theta_41(2)+q_42*theta_42(2)+q_43*theta_43(2)+q_44*theta_44(2)+q_45*theta_45(2)...
        +q_46*theta_46(2)+q_47*theta_47(2)+q_48*theta_48(2)+q_49*theta_49(2)+q_50*theta_50(2)...
        +q_51*theta_51(2)+q_52*theta_52(2)+q_53*theta_53(2)+q_54*theta_54(2)+q_55*theta_55(2)...
        +q_56*theta_56(2)+q_57*theta_57(2)+q_58*theta_58(2)+q_59*theta_59(2)+q_60*theta_60(2)...
        +q_61*theta_61(2)+q_62*theta_62(2)+q_63*theta_63(2)+q_64*theta_64(2)+q_65*theta_65(2)...
        +q_66*theta_66(2)+q_67*theta_67(2)+q_68*theta_68(2)+q_69*theta_69(2)+q_70*theta_70(2)...
        +q_71*theta_71(2)+q_72*theta_72(2)+q_73*theta_73(2)+q_74*theta_74(2)+q_75*theta_75(2)...
        +q_76*theta_76(2)+q_77*theta_77(2)+q_78*theta_78(2)+q_79*theta_79(2)+q_80*theta_80(2)...
        +q_81*theta_81(2)+q_82*theta_82(2)+q_83*theta_83(2)+q_84*theta_84(2)+q_85*theta_85(2)...
        +q_86*theta_86(2)+q_87*theta_87(2)+q_88*theta_88(2)+q_89*theta_89(2)+q_90*theta_90(2)...
        +q_91*theta_91(2)+q_92*theta_92(2)+q_93*theta_93(2)+q_94*theta_94(2)+q_95*theta_95(2)...
        +q_96*theta_96(2)+q_97*theta_97(2)+q_98*theta_98(2)+q_99*theta_99(2)+q_100*theta_100(2)...
        +q_101*theta_101(2)+q_102*theta_102(2)+q_103*theta_103(2)+q_104*theta_104(2)+q_105*theta_105(2))*w_g;

    gamma_q = q_1*theta_1(3)+q_2*theta_2(3)+q_3*theta_3(3)+q_4*theta_4(3)+q_5*theta_5(3)...
        +q_6*theta_6(3)+q_7*theta_7(3)+q_8*theta_8(3)+q_9*theta_9(3)+q_10*theta_10(3)...
        +q_11*theta_11(3)+q_12*theta_12(3)+q_13*theta_13(3)+q_14*theta_14(3)+q_15*theta_15(3)...
        +q_16*theta_16(3)+q_17*theta_17(3)+q_18*theta_18(3)+q_19*theta_19(3)+q_20*theta_20(3)...
        +q_21*theta_21(3)+q_22*theta_22(3)+q_23*theta_23(3)+q_24*theta_24(3)+q_25*theta_25(3)...
        +q_26*theta_26(3)+q_27*theta_27(3)+q_28*theta_28(3)+q_29*theta_29(3)+q_30*theta_30(3)...
        +q_31*theta_31(3)+q_32*theta_32(3)+q_33*theta_33(3)+q_34*theta_34(3)+q_35*theta_35(3)...
        +q_36*theta_36(3)+q_37*theta_37(3)+q_38*theta_38(3)+q_39*theta_39(3)+q_40*theta_40(3)...
        +q_41*theta_41(3)+q_42*theta_42(3)+q_43*theta_43(3)+q_44*theta_44(3)+q_45*theta_45(3)...
        +q_46*theta_46(3)+q_47*theta_47(3)+q_48*theta_48(3)+q_49*theta_49(3)+q_50*theta_50(3)...
        +q_51*theta_51(3)+q_52*theta_52(3)+q_53*theta_53(3)+q_54*theta_54(3)+q_55*theta_55(3)...
        +q_56*theta_56(3)+q_57*theta_57(3)+q_58*theta_58(3)+q_59*theta_59(3)+q_60*theta_60(3)...
        +q_61*theta_61(3)+q_62*theta_62(3)+q_63*theta_63(3)+q_64*theta_64(3)+q_65*theta_65(3)...
        +q_66*theta_66(3)+q_67*theta_67(3)+q_68*theta_68(3)+q_69*theta_69(3)+q_70*theta_70(3)...
        +q_71*theta_71(3)+q_72*theta_72(3)+q_73*theta_73(3)+q_74*theta_74(3)+q_75*theta_75(3)...
        +q_76*theta_76(3)+q_77*theta_77(3)+q_78*theta_78(3)+q_79*theta_79(3)+q_80*theta_80(3)...
        +q_81*theta_81(3)+q_82*theta_82(3)+q_83*theta_83(3)+q_84*theta_84(3)+q_85*theta_85(3)...
        +q_86*theta_86(3)+q_87*theta_87(3)+q_88*theta_88(3)+q_89*theta_89(3)+q_90*theta_90(3)...
        +q_91*theta_91(3)+q_92*theta_92(3)+q_93*theta_93(3)+q_94*theta_94(3)+q_95*theta_95(3)...
        +q_96*theta_96(3)+q_97*theta_97(3)+q_98*theta_98(3)+q_99*theta_99(3)+q_100*theta_100(3)...
        +q_101*theta_101(3)+q_102*theta_102(3)+q_103*theta_103(3)+q_104*theta_104(3)+q_105*theta_105(3);

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
    
    y_hat_22(k+1) = theta_22(1)*w_f'*h_f(:,k)+theta_22(2)*w_g'*h_g(:,k)*u_q(k)+theta_22(3);
    delta_22 = delta+((theta_22(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_22(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_22(3)-gamma_real(k))^2;
    pdf_22 = 1/delta_22*exp(-(y(k+1)-y_hat_22(k+1))^2/2/delta_22);
    
    y_hat_23(k+1) = theta_23(1)*w_f'*h_f(:,k)+theta_23(2)*w_g'*h_g(:,k)*u_q(k)+theta_23(3);
    delta_23 = delta+((theta_23(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_23(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_23(3)-gamma_real(k))^2;
    pdf_23 = 1/delta_23*exp(-(y(k+1)-y_hat_23(k+1))^2/2/delta_23);
    
    y_hat_24(k+1) = theta_24(1)*w_f'*h_f(:,k)+theta_24(2)*w_g'*h_g(:,k)*u_q(k)+theta_24(3);
    delta_24 = delta+((theta_24(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_24(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_24(3)-gamma_real(k))^2;
    pdf_24 = 1/delta_24*exp(-(y(k+1)-y_hat_24(k+1))^2/2/delta_24);
    
    y_hat_25(k+1) = theta_25(1)*w_f'*h_f(:,k)+theta_25(2)*w_g'*h_g(:,k)*u_q(k)+theta_25(3);
    delta_25 = delta+((theta_25(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_25(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_25(3)-gamma_real(k))^2;
    pdf_25 = 1/delta_25*exp(-(y(k+1)-y_hat_25(k+1))^2/2/delta_25);
 
    y_hat_26(k+1) = theta_26(1)*w_f'*h_f(:,k)+theta_26(2)*w_g'*h_g(:,k)*u_q(k)+theta_26(3);
    delta_26 = delta+((theta_26(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_26(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_26(3)-gamma_real(k))^2;
    pdf_26 = 1/delta_26*exp(-(y(k+1)-y_hat_26(k+1))^2/2/delta_26);
    
    y_hat_27(k+1) = theta_27(1)*w_f'*h_f(:,k)+theta_27(2)*w_g'*h_g(:,k)*u_q(k)+theta_27(3);
    delta_27 = delta+((theta_27(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_27(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_27(3)-gamma_real(k))^2;
    pdf_27 = 1/delta_27*exp(-(y(k+1)-y_hat_27(k+1))^2/2/delta_27);
    
    y_hat_28(k+1) = theta_28(1)*w_f'*h_f(:,k)+theta_28(2)*w_g'*h_g(:,k)*u_q(k)+theta_28(3);
    delta_28 = delta+((theta_28(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_28(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_28(3)-gamma_real(k))^2;
    pdf_28 = 1/delta_28*exp(-(y(k+1)-y_hat_28(k+1))^2/2/delta_28);
    
    y_hat_29(k+1) = theta_29(1)*w_f'*h_f(:,k)+theta_29(2)*w_g'*h_g(:,k)*u_q(k)+theta_29(3);
    delta_29 = delta+((theta_29(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_29(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_29(3)-gamma_real(k))^2;
    pdf_29 = 1/delta_29*exp(-(y(k+1)-y_hat_29(k+1))^2/2/delta_29);
    
    y_hat_30(k+1) = theta_30(1)*w_f'*h_f(:,k)+theta_30(2)*w_g'*h_g(:,k)*u_q(k)+theta_30(3);
    delta_30 = delta+((theta_30(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_30(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_30(3)-gamma_real(k))^2;
    pdf_30 = 1/delta_30*exp(-(y(k+1)-y_hat_30(k+1))^2/2/delta_30);    

    y_hat_31(k+1) = theta_31(1)*w_f'*h_f(:,k)+theta_31(2)*w_g'*h_g(:,k)*u_q(k)+theta_31(3);
    delta_31 = delta+((theta_31(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_31(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_31(3)-gamma_real(k))^2;
    pdf_31 = 1/delta_31*exp(-(y(k+1)-y_hat_31(k+1))^2/2/delta_31);
    
    y_hat_32(k+1) = theta_32(1)*w_f'*h_f(:,k)+theta_32(2)*w_g'*h_g(:,k)*u_q(k)+theta_32(3);
    delta_32 = delta+((theta_32(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_32(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_32(3)-gamma_real(k))^2;
    pdf_32 = 1/delta_32*exp(-(y(k+1)-y_hat_32(k+1))^2/2/delta_32);
    
    y_hat_33(k+1) = theta_33(1)*w_f'*h_f(:,k)+theta_33(2)*w_g'*h_g(:,k)*u_q(k)+theta_33(3);
    delta_33 = delta+((theta_33(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_33(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_33(3)-gamma_real(k))^2;
    pdf_33 = 1/delta_33*exp(-(y(k+1)-y_hat_33(k+1))^2/2/delta_33);
    
    y_hat_34(k+1) = theta_34(1)*w_f'*h_f(:,k)+theta_34(2)*w_g'*h_g(:,k)*u_q(k)+theta_34(3);
    delta_34 = delta+((theta_34(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_34(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_34(3)-gamma_real(k))^2;
    pdf_34 = 1/delta_34*exp(-(y(k+1)-y_hat_34(k+1))^2/2/delta_34);
    
    y_hat_35(k+1) = theta_35(1)*w_f'*h_f(:,k)+theta_35(2)*w_g'*h_g(:,k)*u_q(k)+theta_35(3);
    delta_35 = delta+((theta_35(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_35(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_35(3)-gamma_real(k))^2;
    pdf_35 = 1/delta_35*exp(-(y(k+1)-y_hat_35(k+1))^2/2/delta_35);

    y_hat_36(k+1) = theta_36(1)*w_f'*h_f(:,k)+theta_36(2)*w_g'*h_g(:,k)*u_q(k)+theta_36(3);
    delta_36 = delta+((theta_36(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_36(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_36(3)-gamma_real(k))^2;
    pdf_36 = 1/delta_36*exp(-(y(k+1)-y_hat_36(k+1))^2/2/delta_36);
    
    y_hat_37(k+1) = theta_37(1)*w_f'*h_f(:,k)+theta_37(2)*w_g'*h_g(:,k)*u_q(k)+theta_37(3);
    delta_37 = delta+((theta_37(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_37(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_37(3)-gamma_real(k))^2;
    pdf_37 = 1/delta_37*exp(-(y(k+1)-y_hat_37(k+1))^2/2/delta_37);
    
    y_hat_38(k+1) = theta_38(1)*w_f'*h_f(:,k)+theta_38(2)*w_g'*h_g(:,k)*u_q(k)+theta_38(3);
    delta_38 = delta+((theta_38(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_38(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_38(3)-gamma_real(k))^2;
    pdf_38 = 1/delta_38*exp(-(y(k+1)-y_hat_38(k+1))^2/2/delta_38);
    
    y_hat_39(k+1) = theta_39(1)*w_f'*h_f(:,k)+theta_39(2)*w_g'*h_g(:,k)*u_q(k)+theta_39(3);
    delta_39 = delta+((theta_39(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_39(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_39(3)-gamma_real(k))^2;
    pdf_39 = 1/delta_39*exp(-(y(k+1)-y_hat_39(k+1))^2/2/delta_39);
    
    y_hat_40(k+1) = theta_40(1)*w_f'*h_f(:,k)+theta_40(2)*w_g'*h_g(:,k)*u_q(k)+theta_40(3);
    delta_40 = delta+((theta_40(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_40(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_40(3)-gamma_real(k))^2;
    pdf_40 = 1/delta_40*exp(-(y(k+1)-y_hat_40(k+1))^2/2/delta_40);    

    y_hat_41(k+1) = theta_41(1)*w_f'*h_f(:,k)+theta_41(2)*w_g'*h_g(:,k)*u_q(k)+theta_41(3);
    delta_41 = delta+((theta_41(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_41(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_41(3)-gamma_real(k))^2;
    pdf_41 = 1/delta_41*exp(-(y(k+1)-y_hat_41(k+1))^2/2/delta_41);
    
    y_hat_42(k+1) = theta_42(1)*w_f'*h_f(:,k)+theta_42(2)*w_g'*h_g(:,k)*u_q(k)+theta_42(3);
    delta_42 = delta+((theta_42(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_42(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_42(3)-gamma_real(k))^2;
    pdf_42 = 1/delta_42*exp(-(y(k+1)-y_hat_42(k+1))^2/2/delta_42);
    
    y_hat_43(k+1) = theta_43(1)*w_f'*h_f(:,k)+theta_43(2)*w_g'*h_g(:,k)*u_q(k)+theta_43(3);
    delta_43 = delta+((theta_43(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_43(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_43(3)-gamma_real(k))^2;
    pdf_43 = 1/delta_43*exp(-(y(k+1)-y_hat_43(k+1))^2/2/delta_43);
    
    y_hat_44(k+1) = theta_44(1)*w_f'*h_f(:,k)+theta_44(2)*w_g'*h_g(:,k)*u_q(k)+theta_44(3);
    delta_44 = delta+((theta_44(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_44(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_44(3)-gamma_real(k))^2;
    pdf_44 = 1/delta_44*exp(-(y(k+1)-y_hat_44(k+1))^2/2/delta_44);
    
    y_hat_45(k+1) = theta_45(1)*w_f'*h_f(:,k)+theta_45(2)*w_g'*h_g(:,k)*u_q(k)+theta_45(3);
    delta_45 = delta+((theta_45(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_45(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_45(3)-gamma_real(k))^2;
    pdf_45 = 1/delta_45*exp(-(y(k+1)-y_hat_45(k+1))^2/2/delta_45);
 
    y_hat_46(k+1) = theta_46(1)*w_f'*h_f(:,k)+theta_46(2)*w_g'*h_g(:,k)*u_q(k)+theta_46(3);
    delta_46 = delta+((theta_46(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_46(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_46(3)-gamma_real(k))^2;
    pdf_46 = 1/delta_46*exp(-(y(k+1)-y_hat_46(k+1))^2/2/delta_46);
    
    y_hat_47(k+1) = theta_47(1)*w_f'*h_f(:,k)+theta_47(2)*w_g'*h_g(:,k)*u_q(k)+theta_47(3);
    delta_47 = delta+((theta_47(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_47(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_47(3)-gamma_real(k))^2;
    pdf_47 = 1/delta_47*exp(-(y(k+1)-y_hat_47(k+1))^2/2/delta_47);
    
    y_hat_48(k+1) = theta_48(1)*w_f'*h_f(:,k)+theta_48(2)*w_g'*h_g(:,k)*u_q(k)+theta_48(3);
    delta_48 = delta+((theta_48(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_48(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_48(3)-gamma_real(k))^2;
    pdf_48 = 1/delta_48*exp(-(y(k+1)-y_hat_48(k+1))^2/2/delta_48);
    
    y_hat_49(k+1) = theta_49(1)*w_f'*h_f(:,k)+theta_49(2)*w_g'*h_g(:,k)*u_q(k)+theta_49(3);
    delta_49 = delta+((theta_49(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_49(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_49(3)-gamma_real(k))^2;
    pdf_49 = 1/delta_49*exp(-(y(k+1)-y_hat_49(k+1))^2/2/delta_49);
    
    y_hat_50(k+1) = theta_50(1)*w_f'*h_f(:,k)+theta_50(2)*w_g'*h_g(:,k)*u_q(k)+theta_50(3);
    delta_50 = delta+((theta_50(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_50(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_50(3)-gamma_real(k))^2;
    pdf_50 = 1/delta_50*exp(-(y(k+1)-y_hat_50(k+1))^2/2/delta_50);    
    
    y_hat_51(k+1) = theta_51(1)*w_f'*h_f(:,k)+theta_51(2)*w_g'*h_g(:,k)*u_q(k)+theta_51(3);
    delta_51 = delta+((theta_51(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_51(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_51(3)-gamma_real(k))^2;
    pdf_51 = 1/delta_51*exp(-(y(k+1)-y_hat_51(k+1))^2/2/delta_51);
    
    y_hat_52(k+1) = theta_52(1)*w_f'*h_f(:,k)+theta_52(2)*w_g'*h_g(:,k)*u_q(k)+theta_52(3);
    delta_52 = delta+((theta_52(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_52(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_52(3)-gamma_real(k))^2;
    pdf_52 = 1/delta_52*exp(-(y(k+1)-y_hat_52(k+1))^2/2/delta_52);
    
    y_hat_53(k+1) = theta_53(1)*w_f'*h_f(:,k)+theta_53(2)*w_g'*h_g(:,k)*u_q(k)+theta_53(3);
    delta_53 = delta+((theta_53(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_53(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_53(3)-gamma_real(k))^2;
    pdf_53 = 1/delta_53*exp(-(y(k+1)-y_hat_53(k+1))^2/2/delta_53);
    
    y_hat_54(k+1) = theta_54(1)*w_f'*h_f(:,k)+theta_54(2)*w_g'*h_g(:,k)*u_q(k)+theta_54(3);
    delta_54 = delta+((theta_54(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_54(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_54(3)-gamma_real(k))^2;
    pdf_54 = 1/delta_54*exp(-(y(k+1)-y_hat_54(k+1))^2/2/delta_54);
    
    y_hat_55(k+1) = theta_55(1)*w_f'*h_f(:,k)+theta_55(2)*w_g'*h_g(:,k)*u_q(k)+theta_55(3);
    delta_55 = delta+((theta_55(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_55(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_55(3)-gamma_real(k))^2;
    pdf_55 = 1/delta_55*exp(-(y(k+1)-y_hat_55(k+1))^2/2/delta_55);

    y_hat_56(k+1) = theta_56(1)*w_f'*h_f(:,k)+theta_56(2)*w_g'*h_g(:,k)*u_q(k)+theta_56(3);
    delta_56 = delta+((theta_56(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_56(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_56(3)-gamma_real(k))^2;
    pdf_56 = 1/delta_56*exp(-(y(k+1)-y_hat_56(k+1))^2/2/delta_56);
    
    y_hat_57(k+1) = theta_57(1)*w_f'*h_f(:,k)+theta_57(2)*w_g'*h_g(:,k)*u_q(k)+theta_57(3);
    delta_57 = delta+((theta_57(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_57(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_57(3)-gamma_real(k))^2;
    pdf_57 = 1/delta_57*exp(-(y(k+1)-y_hat_57(k+1))^2/2/delta_57);
    
    y_hat_58(k+1) = theta_58(1)*w_f'*h_f(:,k)+theta_58(2)*w_g'*h_g(:,k)*u_q(k)+theta_58(3);
    delta_58 = delta+((theta_58(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_58(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_58(3)-gamma_real(k))^2;
    pdf_58 = 1/delta_58*exp(-(y(k+1)-y_hat_58(k+1))^2/2/delta_58);
    
    y_hat_59(k+1) = theta_59(1)*w_f'*h_f(:,k)+theta_59(2)*w_g'*h_g(:,k)*u_q(k)+theta_59(3);
    delta_59 = delta+((theta_59(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_59(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_59(3)-gamma_real(k))^2;
    pdf_59 = 1/delta_59*exp(-(y(k+1)-y_hat_59(k+1))^2/2/delta_59);
    
    y_hat_60(k+1) = theta_60(1)*w_f'*h_f(:,k)+theta_60(2)*w_g'*h_g(:,k)*u_q(k)+theta_60(3);
    delta_60 = delta+((theta_60(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_60(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_60(3)-gamma_real(k))^2;
    pdf_60 = 1/delta_60*exp(-(y(k+1)-y_hat_60(k+1))^2/2/delta_60);   

    y_hat_61(k+1) = theta_61(1)*w_f'*h_f(:,k)+theta_61(2)*w_g'*h_g(:,k)*u_q(k)+theta_61(3);
    delta_61 = delta+((theta_61(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_61(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_61(3)-gamma_real(k))^2;
    pdf_61 = 1/delta_61*exp(-(y(k+1)-y_hat_61(k+1))^2/2/delta_61);
    
    y_hat_62(k+1) = theta_62(1)*w_f'*h_f(:,k)+theta_62(2)*w_g'*h_g(:,k)*u_q(k)+theta_62(3);
    delta_62 = delta+((theta_62(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_62(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_62(3)-gamma_real(k))^2;
    pdf_62 = 1/delta_62*exp(-(y(k+1)-y_hat_62(k+1))^2/2/delta_62);
    
    y_hat_63(k+1) = theta_63(1)*w_f'*h_f(:,k)+theta_63(2)*w_g'*h_g(:,k)*u_q(k)+theta_63(3);
    delta_63 = delta+((theta_63(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_63(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_63(3)-gamma_real(k))^2;
    pdf_63 = 1/delta_63*exp(-(y(k+1)-y_hat_63(k+1))^2/2/delta_63);
    
    y_hat_64(k+1) = theta_64(1)*w_f'*h_f(:,k)+theta_64(2)*w_g'*h_g(:,k)*u_q(k)+theta_64(3);
    delta_64 = delta+((theta_64(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_64(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_64(3)-gamma_real(k))^2;
    pdf_64 = 1/delta_64*exp(-(y(k+1)-y_hat_64(k+1))^2/2/delta_64);
    
    y_hat_65(k+1) = theta_65(1)*w_f'*h_f(:,k)+theta_65(2)*w_g'*h_g(:,k)*u_q(k)+theta_65(3);
    delta_65 = delta+((theta_65(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_65(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_65(3)-gamma_real(k))^2;
    pdf_65 = 1/delta_65*exp(-(y(k+1)-y_hat_65(k+1))^2/2/delta_65);
 
    y_hat_66(k+1) = theta_66(1)*w_f'*h_f(:,k)+theta_66(2)*w_g'*h_g(:,k)*u_q(k)+theta_66(3);
    delta_66 = delta+((theta_66(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_66(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_66(3)-gamma_real(k))^2;
    pdf_66 = 1/delta_66*exp(-(y(k+1)-y_hat_66(k+1))^2/2/delta_66);
    
    y_hat_67(k+1) = theta_67(1)*w_f'*h_f(:,k)+theta_67(2)*w_g'*h_g(:,k)*u_q(k)+theta_67(3);
    delta_67 = delta+((theta_67(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_67(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_67(3)-gamma_real(k))^2;
    pdf_67 = 1/delta_67*exp(-(y(k+1)-y_hat_67(k+1))^2/2/delta_67);
    
    y_hat_68(k+1) = theta_68(1)*w_f'*h_f(:,k)+theta_68(2)*w_g'*h_g(:,k)*u_q(k)+theta_68(3);
    delta_68 = delta+((theta_68(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_68(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_68(3)-gamma_real(k))^2;
    pdf_68 = 1/delta_68*exp(-(y(k+1)-y_hat_68(k+1))^2/2/delta_68);
    
    y_hat_69(k+1) = theta_69(1)*w_f'*h_f(:,k)+theta_69(2)*w_g'*h_g(:,k)*u_q(k)+theta_69(3);
    delta_69 = delta+((theta_69(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_69(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_69(3)-gamma_real(k))^2;
    pdf_69 = 1/delta_69*exp(-(y(k+1)-y_hat_69(k+1))^2/2/delta_69);
    
    y_hat_70(k+1) = theta_70(1)*w_f'*h_f(:,k)+theta_70(2)*w_g'*h_g(:,k)*u_q(k)+theta_70(3);
    delta_70 = delta+((theta_70(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_70(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_70(3)-gamma_real(k))^2;
    pdf_70 = 1/delta_70*exp(-(y(k+1)-y_hat_70(k+1))^2/2/delta_70);        

    y_hat_71(k+1) = theta_71(1)*w_f'*h_f(:,k)+theta_71(2)*w_g'*h_g(:,k)*u_q(k)+theta_71(3);
    delta_71 = delta+((theta_71(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_71(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_71(3)-gamma_real(k))^2;
    pdf_71 = 1/delta_71*exp(-(y(k+1)-y_hat_71(k+1))^2/2/delta_71);
    
    y_hat_72(k+1) = theta_72(1)*w_f'*h_f(:,k)+theta_72(2)*w_g'*h_g(:,k)*u_q(k)+theta_72(3);
    delta_72 = delta+((theta_72(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_72(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_72(3)-gamma_real(k))^2;
    pdf_72 = 1/delta_72*exp(-(y(k+1)-y_hat_72(k+1))^2/2/delta_72);
    
    y_hat_73(k+1) = theta_73(1)*w_f'*h_f(:,k)+theta_73(2)*w_g'*h_g(:,k)*u_q(k)+theta_73(3);
    delta_73 = delta+((theta_73(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_73(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_73(3)-gamma_real(k))^2;
    pdf_73 = 1/delta_73*exp(-(y(k+1)-y_hat_73(k+1))^2/2/delta_73);
    
    y_hat_74(k+1) = theta_74(1)*w_f'*h_f(:,k)+theta_74(2)*w_g'*h_g(:,k)*u_q(k)+theta_74(3);
    delta_74 = delta+((theta_74(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_74(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_74(3)-gamma_real(k))^2;
    pdf_74 = 1/delta_74*exp(-(y(k+1)-y_hat_74(k+1))^2/2/delta_74);
    
    y_hat_75(k+1) = theta_75(1)*w_f'*h_f(:,k)+theta_75(2)*w_g'*h_g(:,k)*u_q(k)+theta_75(3);
    delta_75 = delta+((theta_75(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_75(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_75(3)-gamma_real(k))^2;
    pdf_75 = 1/delta_75*exp(-(y(k+1)-y_hat_75(k+1))^2/2/delta_75);
 
    y_hat_76(k+1) = theta_76(1)*w_f'*h_f(:,k)+theta_76(2)*w_g'*h_g(:,k)*u_q(k)+theta_76(3);
    delta_76 = delta+((theta_76(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_76(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_76(3)-gamma_real(k))^2;
    pdf_76 = 1/delta_76*exp(-(y(k+1)-y_hat_76(k+1))^2/2/delta_76);
    
    y_hat_77(k+1) = theta_77(1)*w_f'*h_f(:,k)+theta_77(2)*w_g'*h_g(:,k)*u_q(k)+theta_77(3);
    delta_77 = delta+((theta_77(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_77(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_77(3)-gamma_real(k))^2;
    pdf_77 = 1/delta_77*exp(-(y(k+1)-y_hat_77(k+1))^2/2/delta_77);
    
    y_hat_78(k+1) = theta_78(1)*w_f'*h_f(:,k)+theta_78(2)*w_g'*h_g(:,k)*u_q(k)+theta_78(3);
    delta_78 = delta+((theta_78(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_78(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_78(3)-gamma_real(k))^2;
    pdf_78 = 1/delta_78*exp(-(y(k+1)-y_hat_78(k+1))^2/2/delta_78);
    
    y_hat_79(k+1) = theta_79(1)*w_f'*h_f(:,k)+theta_79(2)*w_g'*h_g(:,k)*u_q(k)+theta_79(3);
    delta_79 = delta+((theta_79(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_79(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_79(3)-gamma_real(k))^2;
    pdf_79 = 1/delta_79*exp(-(y(k+1)-y_hat_79(k+1))^2/2/delta_79);
    
    y_hat_80(k+1) = theta_80(1)*w_f'*h_f(:,k)+theta_80(2)*w_g'*h_g(:,k)*u_q(k)+theta_80(3);
    delta_80 = delta+((theta_80(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_80(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_80(3)-gamma_real(k))^2;
    pdf_80 = 1/delta_80*exp(-(y(k+1)-y_hat_80(k+1))^2/2/delta_80);    

    y_hat_81(k+1) = theta_81(1)*w_f'*h_f(:,k)+theta_81(2)*w_g'*h_g(:,k)*u_q(k)+theta_81(3);
    delta_81 = delta+((theta_81(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_81(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_81(3)-gamma_real(k))^2;
    pdf_81 = 1/delta_81*exp(-(y(k+1)-y_hat_81(k+1))^2/2/delta_81);
    
    y_hat_82(k+1) = theta_82(1)*w_f'*h_f(:,k)+theta_82(2)*w_g'*h_g(:,k)*u_q(k)+theta_82(3);
    delta_82 = delta+((theta_82(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_82(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_82(3)-gamma_real(k))^2;
    pdf_82 = 1/delta_82*exp(-(y(k+1)-y_hat_82(k+1))^2/2/delta_82);
    
    y_hat_83(k+1) = theta_83(1)*w_f'*h_f(:,k)+theta_83(2)*w_g'*h_g(:,k)*u_q(k)+theta_83(3);
    delta_83 = delta+((theta_83(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_83(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_83(3)-gamma_real(k))^2;
    pdf_83 = 1/delta_83*exp(-(y(k+1)-y_hat_83(k+1))^2/2/delta_83);
    
    y_hat_84(k+1) = theta_84(1)*w_f'*h_f(:,k)+theta_84(2)*w_g'*h_g(:,k)*u_q(k)+theta_84(3);
    delta_84 = delta+((theta_84(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_84(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_84(3)-gamma_real(k))^2;
    pdf_84 = 1/delta_84*exp(-(y(k+1)-y_hat_84(k+1))^2/2/delta_84);
    
    y_hat_85(k+1) = theta_85(1)*w_f'*h_f(:,k)+theta_85(2)*w_g'*h_g(:,k)*u_q(k)+theta_85(3);
    delta_85 = delta+((theta_85(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_85(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_85(3)-gamma_real(k))^2;
    pdf_85 = 1/delta_85*exp(-(y(k+1)-y_hat_85(k+1))^2/2/delta_85);
 
    y_hat_86(k+1) = theta_86(1)*w_f'*h_f(:,k)+theta_86(2)*w_g'*h_g(:,k)*u_q(k)+theta_86(3);
    delta_86 = delta+((theta_86(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_86(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_86(3)-gamma_real(k))^2;
    pdf_86 = 1/delta_86*exp(-(y(k+1)-y_hat_86(k+1))^2/2/delta_86);
    
    y_hat_87(k+1) = theta_87(1)*w_f'*h_f(:,k)+theta_87(2)*w_g'*h_g(:,k)*u_q(k)+theta_87(3);
    delta_87 = delta+((theta_87(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_87(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_87(3)-gamma_real(k))^2;
    pdf_87 = 1/delta_87*exp(-(y(k+1)-y_hat_87(k+1))^2/2/delta_87);
    
    y_hat_88(k+1) = theta_88(1)*w_f'*h_f(:,k)+theta_88(2)*w_g'*h_g(:,k)*u_q(k)+theta_88(3);
    delta_88 = delta+((theta_88(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_88(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_88(3)-gamma_real(k))^2;
    pdf_88 = 1/delta_88*exp(-(y(k+1)-y_hat_88(k+1))^2/2/delta_88);
    
    y_hat_89(k+1) = theta_89(1)*w_f'*h_f(:,k)+theta_89(2)*w_g'*h_g(:,k)*u_q(k)+theta_89(3);
    delta_89 = delta+((theta_89(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_89(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_89(3)-gamma_real(k))^2;
    pdf_89 = 1/delta_89*exp(-(y(k+1)-y_hat_89(k+1))^2/2/delta_89);
    
    y_hat_90(k+1) = theta_90(1)*w_f'*h_f(:,k)+theta_90(2)*w_g'*h_g(:,k)*u_q(k)+theta_90(3);
    delta_90 = delta+((theta_90(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_90(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_90(3)-gamma_real(k))^2;
    pdf_90 = 1/delta_90*exp(-(y(k+1)-y_hat_90(k+1))^2/2/delta_90);    

    y_hat_91(k+1) = theta_91(1)*w_f'*h_f(:,k)+theta_91(2)*w_g'*h_g(:,k)*u_q(k)+theta_91(3);
    delta_91 = delta+((theta_91(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_91(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_91(3)-gamma_real(k))^2;
    pdf_91 = 1/delta_91*exp(-(y(k+1)-y_hat_91(k+1))^2/2/delta_91);
    
    y_hat_92(k+1) = theta_92(1)*w_f'*h_f(:,k)+theta_92(2)*w_g'*h_g(:,k)*u_q(k)+theta_92(3);
    delta_92 = delta+((theta_92(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_92(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_92(3)-gamma_real(k))^2;
    pdf_92 = 1/delta_92*exp(-(y(k+1)-y_hat_92(k+1))^2/2/delta_92);
    
    y_hat_93(k+1) = theta_93(1)*w_f'*h_f(:,k)+theta_93(2)*w_g'*h_g(:,k)*u_q(k)+theta_93(3);
    delta_93 = delta+((theta_93(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_93(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_93(3)-gamma_real(k))^2;
    pdf_93 = 1/delta_93*exp(-(y(k+1)-y_hat_93(k+1))^2/2/delta_93);
    
    y_hat_94(k+1) = theta_94(1)*w_f'*h_f(:,k)+theta_94(2)*w_g'*h_g(:,k)*u_q(k)+theta_94(3);
    delta_94 = delta+((theta_94(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_94(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_94(3)-gamma_real(k))^2;
    pdf_94 = 1/delta_94*exp(-(y(k+1)-y_hat_94(k+1))^2/2/delta_94);
    
    y_hat_95(k+1) = theta_95(1)*w_f'*h_f(:,k)+theta_95(2)*w_g'*h_g(:,k)*u_q(k)+theta_95(3);
    delta_95 = delta+((theta_95(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_95(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_95(3)-gamma_real(k))^2;
    pdf_95 = 1/delta_95*exp(-(y(k+1)-y_hat_95(k+1))^2/2/delta_95);
 
    y_hat_96(k+1) = theta_96(1)*w_f'*h_f(:,k)+theta_96(2)*w_g'*h_g(:,k)*u_q(k)+theta_96(3);
    delta_96 = delta+((theta_96(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_96(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_96(3)-gamma_real(k))^2;
    pdf_96 = 1/delta_96*exp(-(y(k+1)-y_hat_96(k+1))^2/2/delta_96);
    
    y_hat_97(k+1) = theta_97(1)*w_f'*h_f(:,k)+theta_97(2)*w_g'*h_g(:,k)*u_q(k)+theta_97(3);
    delta_97 = delta+((theta_97(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_97(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_97(3)-gamma_real(k))^2;
    pdf_97 = 1/delta_97*exp(-(y(k+1)-y_hat_97(k+1))^2/2/delta_97);
    
    y_hat_98(k+1) = theta_98(1)*w_f'*h_f(:,k)+theta_98(2)*w_g'*h_g(:,k)*u_q(k)+theta_98(3);
    delta_98 = delta+((theta_98(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_98(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_98(3)-gamma_real(k))^2;
    pdf_98 = 1/delta_98*exp(-(y(k+1)-y_hat_98(k+1))^2/2/delta_98);
    
    y_hat_99(k+1) = theta_99(1)*w_f'*h_f(:,k)+theta_99(2)*w_g'*h_g(:,k)*u_q(k)+theta_99(3);
    delta_99 = delta+((theta_99(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_99(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_99(3)-gamma_real(k))^2;
    pdf_99 = 1/delta_99*exp(-(y(k+1)-y_hat_99(k+1))^2/2/delta_99);
    
    y_hat_100(k+1) = theta_100(1)*w_f'*h_f(:,k)+theta_100(2)*w_g'*h_g(:,k)*u_q(k)+theta_100(3);
    delta_100 = delta+((theta_100(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_100(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_100(3)-gamma_real(k))^2;
    pdf_100 = 1/delta_100*exp(-(y(k+1)-y_hat_100(k+1))^2/2/delta_100);    

    y_hat_101(k+1) = theta_101(1)*w_f'*h_f(:,k)+theta_101(2)*w_g'*h_g(:,k)*u_q(k)+theta_101(3);
    delta_101 = delta+((theta_101(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_101(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_101(3)-gamma_real(k))^2;
    pdf_101 = 1/delta_101*exp(-(y(k+1)-y_hat_101(k+1))^2/2/delta_101);
    
    y_hat_102(k+1) = theta_102(1)*w_f'*h_f(:,k)+theta_102(2)*w_g'*h_g(:,k)*u_q(k)+theta_102(3);
    delta_102 = delta+((theta_102(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_102(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_102(3)-gamma_real(k))^2;
    pdf_102 = 1/delta_102*exp(-(y(k+1)-y_hat_102(k+1))^2/2/delta_102);
    
    y_hat_103(k+1) = theta_103(1)*w_f'*h_f(:,k)+theta_103(2)*w_g'*h_g(:,k)*u_q(k)+theta_103(3);
    delta_103 = delta+((theta_103(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_103(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_103(3)-gamma_real(k))^2;
    pdf_103 = 1/delta_103*exp(-(y(k+1)-y_hat_103(k+1))^2/2/delta_103);
    
    y_hat_104(k+1) = theta_104(1)*w_f'*h_f(:,k)+theta_104(2)*w_g'*h_g(:,k)*u_q(k)+theta_104(3);
    delta_104 = delta+((theta_104(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_104(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_104(3)-gamma_real(k))^2;
    pdf_104 = 1/delta_104*exp(-(y(k+1)-y_hat_104(k+1))^2/2/delta_104);
    
    y_hat_105(k+1) = theta_105(1)*w_f'*h_f(:,k)+theta_105(2)*w_g'*h_g(:,k)*u_q(k)+theta_105(3);
    delta_105 = delta+((theta_105(1)-alpha_real(k))*w_f'*h_f(:,k)+(theta_105(2)-beta_real(k))*w_g'*h_g(:,k)*u_q(k)+theta_105(3)-gamma_real(k))^2;
    pdf_105 = 1/delta_105*exp(-(y(k+1)-y_hat_105(k+1))^2/2/delta_105);

    q_sum = pdf_1*q_1+pdf_2*q_2+pdf_3*q_3+pdf_4*q_4+pdf_5*q_5+pdf_6*q_6+pdf_7*q_7+pdf_8*q_8+pdf_9*q_9+pdf_10*q_10...
           +pdf_11*q_11+pdf_12*q_12+pdf_13*q_13+pdf_14*q_14+pdf_15*q_15+pdf_16*q_16+pdf_17*q_17+pdf_18*q_18+pdf_19*q_19+pdf_20*q_20...
            +pdf_21*q_21+pdf_22*q_22+pdf_23*q_23+pdf_24*q_24+pdf_25*q_25+pdf_26*q_26+pdf_27*q_27+pdf_28*q_28+pdf_29*q_29+pdf_30*q_30...
            +pdf_31*q_31+pdf_32*q_32+pdf_33*q_33+pdf_34*q_34+pdf_35*q_35+pdf_36*q_36+pdf_37*q_37+pdf_38*q_38+pdf_39*q_39+pdf_40*q_40...
            +pdf_41*q_41+pdf_42*q_42+pdf_43*q_43+pdf_44*q_44+pdf_45*q_45+pdf_46*q_46+pdf_47*q_47+pdf_48*q_48+pdf_49*q_49+pdf_50*q_50...
            +pdf_51*q_51+pdf_52*q_52+pdf_53*q_53+pdf_54*q_54+pdf_55*q_55+pdf_56*q_56+pdf_57*q_57+pdf_58*q_58+pdf_59*q_59+pdf_60*q_60...
            +pdf_61*q_61+pdf_62*q_62+pdf_63*q_63+pdf_64*q_64+pdf_65*q_65+pdf_66*q_66+pdf_67*q_67+pdf_68*q_68+pdf_69*q_69+pdf_70*q_70...
            +pdf_71*q_71+pdf_72*q_72+pdf_73*q_73+pdf_74*q_74+pdf_75*q_75+pdf_76*q_76+pdf_77*q_77+pdf_78*q_78+pdf_79*q_79+pdf_80*q_80...
            +pdf_81*q_81+pdf_82*q_82+pdf_83*q_83+pdf_84*q_84+pdf_85*q_85+pdf_86*q_86+pdf_87*q_87+pdf_88*q_88+pdf_89*q_89+pdf_90*q_90...
            +pdf_91*q_91+pdf_92*q_92+pdf_93*q_93+pdf_94*q_94+pdf_95*q_95+pdf_96*q_96+pdf_97*q_97+pdf_98*q_98+pdf_99*q_99+pdf_100*q_100...
            +pdf_101*q_101+pdf_102*q_102+pdf_103*q_103+pdf_104*q_104+pdf_105*q_105;

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
    q_22 = pdf_22*q_22/q_sum;
    q_23 = pdf_23*q_23/q_sum;
    q_24 = pdf_24*q_24/q_sum;
    q_25 = pdf_25*q_25/q_sum;
    q_26 = pdf_26*q_26/q_sum;
    q_27 = pdf_27*q_27/q_sum;
    q_28 = pdf_28*q_28/q_sum;
    q_29 = pdf_29*q_29/q_sum;
    q_30 = pdf_30*q_30/q_sum;
    q_31 = pdf_31*q_31/q_sum;
    q_32 = pdf_32*q_32/q_sum;
    q_33 = pdf_33*q_33/q_sum;
    q_34 = pdf_34*q_34/q_sum;
    q_35 = pdf_35*q_35/q_sum;
    q_36 = pdf_36*q_36/q_sum;
    q_37 = pdf_37*q_37/q_sum;
    q_38 = pdf_38*q_38/q_sum;
    q_39 = pdf_39*q_39/q_sum;
    q_40 = pdf_40*q_40/q_sum;
    q_41 = pdf_41*q_41/q_sum;
    q_42 = pdf_42*q_42/q_sum;
    q_43 = pdf_43*q_43/q_sum;
    q_44 = pdf_44*q_44/q_sum;
    q_45 = pdf_45*q_45/q_sum;
    q_46 = pdf_46*q_46/q_sum;
    q_47 = pdf_47*q_47/q_sum;
    q_48 = pdf_48*q_48/q_sum;
    q_49 = pdf_49*q_49/q_sum;
    q_50 = pdf_50*q_50/q_sum;
    q_51 = pdf_51*q_51/q_sum;
    q_52 = pdf_52*q_52/q_sum;
    q_53 = pdf_53*q_53/q_sum;
    q_54 = pdf_54*q_54/q_sum;
    q_55 = pdf_55*q_55/q_sum;
    q_56 = pdf_56*q_56/q_sum;
    q_57 = pdf_57*q_57/q_sum;
    q_58 = pdf_58*q_58/q_sum;
    q_59 = pdf_59*q_59/q_sum;
    q_60 = pdf_60*q_60/q_sum;   
    q_61 = pdf_61*q_61/q_sum;
    q_62 = pdf_62*q_62/q_sum;
    q_63 = pdf_63*q_63/q_sum;
    q_64 = pdf_64*q_64/q_sum;
    q_65 = pdf_65*q_65/q_sum;
    q_66 = pdf_66*q_66/q_sum;
    q_67 = pdf_67*q_67/q_sum;
    q_68 = pdf_68*q_68/q_sum;
    q_69 = pdf_69*q_69/q_sum;
    q_70 = pdf_70*q_70/q_sum;
    q_71 = pdf_71*q_71/q_sum;
    q_72 = pdf_72*q_72/q_sum;
    q_73 = pdf_73*q_73/q_sum;
    q_74 = pdf_74*q_74/q_sum;
    q_75 = pdf_75*q_75/q_sum;
    q_76 = pdf_76*q_76/q_sum;
    q_77 = pdf_77*q_77/q_sum;
    q_78 = pdf_78*q_78/q_sum;
    q_79 = pdf_79*q_79/q_sum;
    q_80 = pdf_80*q_80/q_sum;
    q_81 = pdf_81*q_81/q_sum;
    q_82 = pdf_82*q_82/q_sum;
    q_83 = pdf_83*q_83/q_sum;
    q_84 = pdf_84*q_84/q_sum;
    q_85 = pdf_85*q_85/q_sum;
    q_86 = pdf_86*q_86/q_sum;
    q_87 = pdf_87*q_87/q_sum;
    q_88 = pdf_88*q_88/q_sum;
    q_89 = pdf_89*q_89/q_sum;
    q_90 = pdf_90*q_90/q_sum;
    q_91 = pdf_91*q_91/q_sum;
    q_92 = pdf_92*q_92/q_sum;
    q_93 = pdf_93*q_93/q_sum;
    q_94 = pdf_94*q_94/q_sum;
    q_95 = pdf_95*q_95/q_sum;
    q_96 = pdf_96*q_96/q_sum;
    q_97 = pdf_97*q_97/q_sum;
    q_98 = pdf_98*q_98/q_sum;
    q_99 = pdf_99*q_99/q_sum;
    q_100 = pdf_100*q_100/q_sum;
    q_101 = pdf_101*q_101/q_sum;
    q_102 = pdf_102*q_102/q_sum;
    q_103 = pdf_103*q_103/q_sum;
    q_104 = pdf_104*q_104/q_sum;
    q_105 = pdf_105*q_105/q_sum;    
    
    
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
    q_22_plot(k) = q_22;
    q_23_plot(k) = q_23;
    q_24_plot(k) = q_24;
    q_25_plot(k) = q_25;
    q_26_plot(k) = q_26;
    q_27_plot(k) = q_27;
    q_28_plot(k) = q_28;
    q_29_plot(k) = q_29;
    q_30_plot(k) = q_30;
    q_31_plot(k) = q_31;
    q_32_plot(k) = q_32;
    q_33_plot(k) = q_33;
    q_34_plot(k) = q_34;
    q_35_plot(k) = q_35;    
    q_36_plot(k) = q_36;
    q_37_plot(k) = q_37;
    q_38_plot(k) = q_38;
    q_39_plot(k) = q_39;
    q_40_plot(k) = q_40;
    q_41_plot(k) = q_41;
    q_42_plot(k) = q_42;
    q_43_plot(k) = q_43;
    q_44_plot(k) = q_44;
    q_45_plot(k) = q_45;
    q_46_plot(k) = q_46;
    q_47_plot(k) = q_47;
    q_48_plot(k) = q_48;
    q_49_plot(k) = q_49;
    q_50_plot(k) = q_50;
    q_51_plot(k) = q_51;
    q_52_plot(k) = q_52;
    q_53_plot(k) = q_53;
    q_54_plot(k) = q_54;
    q_55_plot(k) = q_55;
    q_56_plot(k) = q_56;
    q_57_plot(k) = q_57;
    q_58_plot(k) = q_58;
    q_59_plot(k) = q_59;
    q_60_plot(k) = q_60;
    q_61_plot(k) = q_61;
    q_62_plot(k) = q_62;
    q_63_plot(k) = q_63;
    q_64_plot(k) = q_64;
    q_65_plot(k) = q_65;
    q_66_plot(k) = q_66;
    q_67_plot(k) = q_67;
    q_68_plot(k) = q_68;
    q_69_plot(k) = q_69;
    q_70_plot(k) = q_70;
    q_71_plot(k) = q_71;
    q_72_plot(k) = q_72;
    q_73_plot(k) = q_73;
    q_74_plot(k) = q_74;
    q_75_plot(k) = q_75;
    q_76_plot(k) = q_76;
    q_77_plot(k) = q_77;
    q_78_plot(k) = q_78;
    q_79_plot(k) = q_79;
    q_80_plot(k) = q_80;
    q_81_plot(k) = q_81;
    q_82_plot(k) = q_82;
    q_83_plot(k) = q_83;
    q_84_plot(k) = q_84;
    q_85_plot(k) = q_85;
    q_86_plot(k) = q_86;
    q_87_plot(k) = q_87;
    q_88_plot(k) = q_88;
    q_89_plot(k) = q_89;
    q_90_plot(k) = q_90;
    q_91_plot(k) = q_91;
    q_92_plot(k) = q_92;
    q_93_plot(k) = q_93;
    q_94_plot(k) = q_94;
    q_95_plot(k) = q_95;
    q_96_plot(k) = q_96;
    q_97_plot(k) = q_97;
    q_98_plot(k) = q_98;
    q_99_plot(k) = q_99;
    q_100_plot(k) = q_100;
    q_101_plot(k) = q_101;
    q_102_plot(k) = q_102;
    q_103_plot(k) = q_103;
    q_104_plot(k) = q_104;
    q_105_plot(k) = q_105;


    P1(:,:,k+2) =  prob_coef/q_1*P1(:,:,k+1);
    P2(:,:,k+2) =  prob_coef/q_2*P2(:,:,k+1);
    P3(:,:,k+2) =  prob_coef/q_3*P3(:,:,k+1);
    P4(:,:,k+2) =  prob_coef/q_4*P4(:,:,k+1);
    P5(:,:,k+2) =  prob_coef/q_5*P5(:,:,k+1);
    P6(:,:,k+2) =  prob_coef/q_6*P6(:,:,k+1);
    P7(:,:,k+2) =  prob_coef/q_7*P7(:,:,k+1);
    P8(:,:,k+2) =  prob_coef/q_8*P8(:,:,k+1);
    P9(:,:,k+2) =  prob_coef/q_9*P9(:,:,k+1);
    P10(:,:,k+2) =  prob_coef/q_10*P10(:,:,k+1);
    P11(:,:,k+2) =  prob_coef/q_11*P11(:,:,k+1);
    P12(:,:,k+2) =  prob_coef/q_12*P12(:,:,k+1);
    P13(:,:,k+2) =  prob_coef/q_13*P13(:,:,k+1);
    P14(:,:,k+2) =  prob_coef/q_14*P14(:,:,k+1);
    P15(:,:,k+2) =  prob_coef/q_15*P15(:,:,k+1);
    P16(:,:,k+2) =  prob_coef/q_16*P16(:,:,k+1);
    P17(:,:,k+2) =  prob_coef/q_17*P17(:,:,k+1);
    P18(:,:,k+2) =  prob_coef/q_18*P18(:,:,k+1);
    P19(:,:,k+2) =  prob_coef/q_19*P19(:,:,k+1);
    P20(:,:,k+2) =  prob_coef/q_20*P20(:,:,k+1);
    P21(:,:,k+2) =  prob_coef/q_21*P21(:,:,k+1);
    P22(:,:,k+2) =  prob_coef/q_22*P22(:,:,k+1);
    P23(:,:,k+2) =  prob_coef/q_23*P23(:,:,k+1);
    P24(:,:,k+2) =  prob_coef/q_24*P24(:,:,k+1);
    P25(:,:,k+2) =  prob_coef/q_25*P25(:,:,k+1);
    P26(:,:,k+2) =  prob_coef/q_26*P26(:,:,k+1);
    P27(:,:,k+2) =  prob_coef/q_27*P27(:,:,k+1);
    P28(:,:,k+2) =  prob_coef/q_28*P28(:,:,k+1);
    P29(:,:,k+2) =  prob_coef/q_29*P29(:,:,k+1);
    P30(:,:,k+2) =  prob_coef/q_30*P30(:,:,k+1);
    P31(:,:,k+2) =  prob_coef/q_31*P31(:,:,k+1);
    P32(:,:,k+2) =  prob_coef/q_32*P32(:,:,k+1);
    P33(:,:,k+2) =  prob_coef/q_33*P33(:,:,k+1);
    P34(:,:,k+2) =  prob_coef/q_34*P34(:,:,k+1);
    P35(:,:,k+2) =  prob_coef/q_35*P35(:,:,k+1);
    P36(:,:,k+2) =  prob_coef/q_36*P36(:,:,k+1);
    P37(:,:,k+2) =  prob_coef/q_37*P37(:,:,k+1);
    P38(:,:,k+2) =  prob_coef/q_38*P38(:,:,k+1);
    P39(:,:,k+2) =  prob_coef/q_39*P39(:,:,k+1);
    P40(:,:,k+2) =  prob_coef/q_40*P40(:,:,k+1);
    P41(:,:,k+2) =  prob_coef/q_41*P41(:,:,k+1);
    P42(:,:,k+2) =  prob_coef/q_42*P42(:,:,k+1);
    P43(:,:,k+2) =  prob_coef/q_43*P43(:,:,k+1);
    P44(:,:,k+2) =  prob_coef/q_44*P44(:,:,k+1);
    P45(:,:,k+2) =  prob_coef/q_45*P45(:,:,k+1);
    P46(:,:,k+2) =  prob_coef/q_46*P46(:,:,k+1);
    P47(:,:,k+2) =  prob_coef/q_47*P47(:,:,k+1);
    P48(:,:,k+2) =  prob_coef/q_48*P48(:,:,k+1);
    P49(:,:,k+2) =  prob_coef/q_49*P49(:,:,k+1);
    P50(:,:,k+2) =  prob_coef/q_50*P50(:,:,k+1);
    P51(:,:,k+2) =  prob_coef/q_51*P51(:,:,k+1);
    P52(:,:,k+2) =  prob_coef/q_52*P52(:,:,k+1);
    P53(:,:,k+2) =  prob_coef/q_53*P53(:,:,k+1);
    P54(:,:,k+2) =  prob_coef/q_54*P54(:,:,k+1);
    P55(:,:,k+2) =  prob_coef/q_55*P55(:,:,k+1);
    P56(:,:,k+2) =  prob_coef/q_56*P56(:,:,k+1);
    P57(:,:,k+2) =  prob_coef/q_57*P57(:,:,k+1);
    P58(:,:,k+2) =  prob_coef/q_58*P58(:,:,k+1);
    P59(:,:,k+2) =  prob_coef/q_59*P59(:,:,k+1);
    P60(:,:,k+2) =  prob_coef/q_60*P60(:,:,k+1);
    P61(:,:,k+2) =  prob_coef/q_61*P61(:,:,k+1);
    P62(:,:,k+2) =  prob_coef/q_62*P62(:,:,k+1);
    P63(:,:,k+2) =  prob_coef/q_63*P63(:,:,k+1);
    P64(:,:,k+2) =  prob_coef/q_64*P64(:,:,k+1);
    P65(:,:,k+2) =  prob_coef/q_65*P65(:,:,k+1);
    P66(:,:,k+2) =  prob_coef/q_66*P66(:,:,k+1);
    P67(:,:,k+2) =  prob_coef/q_67*P67(:,:,k+1);
    P68(:,:,k+2) =  prob_coef/q_68*P68(:,:,k+1);
    P69(:,:,k+2) =  prob_coef/q_69*P69(:,:,k+1);
    P70(:,:,k+2) =  prob_coef/q_70*P70(:,:,k+1);
    P71(:,:,k+2) =  prob_coef/q_71*P71(:,:,k+1);
    P72(:,:,k+2) =  prob_coef/q_72*P72(:,:,k+1);
    P73(:,:,k+2) =  prob_coef/q_73*P73(:,:,k+1);
    P74(:,:,k+2) =  prob_coef/q_74*P74(:,:,k+1);
    P75(:,:,k+2) =  prob_coef/q_75*P75(:,:,k+1);
    P76(:,:,k+2) =  prob_coef/q_76*P76(:,:,k+1);
    P77(:,:,k+2) =  prob_coef/q_77*P77(:,:,k+1);
    P78(:,:,k+2) =  prob_coef/q_78*P78(:,:,k+1);
    P79(:,:,k+2) =  prob_coef/q_79*P79(:,:,k+1);
    P80(:,:,k+2) =  prob_coef/q_80*P80(:,:,k+1);
    P81(:,:,k+2) =  prob_coef/q_81*P81(:,:,k+1);
    P82(:,:,k+2) =  prob_coef/q_82*P82(:,:,k+1);
    P83(:,:,k+2) =  prob_coef/q_83*P83(:,:,k+1);
    P84(:,:,k+2) =  prob_coef/q_84*P84(:,:,k+1);
    P85(:,:,k+2) =  prob_coef/q_85*P85(:,:,k+1);
    P86(:,:,k+2) =  prob_coef/q_86*P86(:,:,k+1);
    P87(:,:,k+2) =  prob_coef/q_87*P87(:,:,k+1);
    P88(:,:,k+2) =  prob_coef/q_88*P88(:,:,k+1);
    P89(:,:,k+2) =  prob_coef/q_89*P89(:,:,k+1);
    P90(:,:,k+2) =  prob_coef/q_90*P90(:,:,k+1);
    P91(:,:,k+2) =  prob_coef/q_91*P91(:,:,k+1);
    P92(:,:,k+2) =  prob_coef/q_92*P92(:,:,k+1);
    P93(:,:,k+2) =  prob_coef/q_93*P93(:,:,k+1);
    P94(:,:,k+2) =  prob_coef/q_94*P94(:,:,k+1);
    P95(:,:,k+2) =  prob_coef/q_95*P95(:,:,k+1);
    P96(:,:,k+2) =  prob_coef/q_96*P96(:,:,k+1);
    P97(:,:,k+2) =  prob_coef/q_97*P97(:,:,k+1);
    P98(:,:,k+2) =  prob_coef/q_98*P98(:,:,k+1);
    P99(:,:,k+2) =  prob_coef/q_99*P99(:,:,k+1);
    P100(:,:,k+2) =  prob_coef/q_100*P100(:,:,k+1);
    P101(:,:,k+2) =  prob_coef/q_101*P101(:,:,k+1);
    P102(:,:,k+2) =  prob_coef/q_102*P102(:,:,k+1);
    P103(:,:,k+2) =  prob_coef/q_103*P103(:,:,k+1);
    P104(:,:,k+2) =  prob_coef/q_104*P104(:,:,k+1);
    P105(:,:,k+2) =  prob_coef/q_105*P105(:,:,k+1);


    if trace(P1(:,:,k+2)) > 1e5
        P1(:,:,k+2) = P1(:,:,k+1);
    end
    if trace(P2(:,:,k+2)) > 1e5
        P2(:,:,k+2) = P2(:,:,k+1);
    end
    if trace(P3(:,:,k+2)) > 1e5
        P3(:,:,k+2) = P3(:,:,k+1);
    end
    if trace(P4(:,:,k+2)) > 1e5
        P4(:,:,k+2) = P4(:,:,k+1);
    end
    if trace(P5(:,:,k+2)) > 1e5
        P5(:,:,k+2) = P5(:,:,k+1);
    end
    if trace(P6(:,:,k+2)) > 1e5
        P6(:,:,k+2) = P6(:,:,k+1);
    end
    if trace(P7(:,:,k+2)) > 1e5
        P7(:,:,k+2) = P7(:,:,k+1);
    end
    if trace(P8(:,:,k+2)) > 1e5
        P8(:,:,k+2) = P8(:,:,k+1);
    end
    if trace(P9(:,:,k+2)) > 1e5
        P9(:,:,k+2) = P9(:,:,k+1);
    end
    if trace(P10(:,:,k+2)) > 1e5
        P10(:,:,k+2) = P10(:,:,k+1);
    end
    if trace(P11(:,:,k+2)) > 1e5
        P11(:,:,k+2) = P11(:,:,k+1);
    end
    if trace(P12(:,:,k+2)) > 1e5
        P12(:,:,k+2) = P12(:,:,k+1);
    end
    if trace(P13(:,:,k+2)) > 1e5
        P13(:,:,k+2) = P13(:,:,k+1);
    end
    if trace(P14(:,:,k+2)) > 1e5
        P14(:,:,k+2) = P14(:,:,k+1);
    end
    if trace(P15(:,:,k+2)) > 1e5
        P15(:,:,k+2) = P15(:,:,k+1);
    end
    if trace(P16(:,:,k+2)) > 1e5
        P16(:,:,k+2) = P16(:,:,k+1);
    end
    if trace(P17(:,:,k+2)) > 1e5
        P17(:,:,k+2) = P17(:,:,k+1);
    end
    if trace(P18(:,:,k+2)) > 1e5
        P18(:,:,k+2) = P18(:,:,k+1);
    end
    if trace(P19(:,:,k+2)) > 1e5
        P19(:,:,k+2) = P19(:,:,k+1);
    end
    if trace(P20(:,:,k+2)) > 1e5
        P20(:,:,k+2) = P20(:,:,k+1);
    end
    if trace(P21(:,:,k+2)) > 1e5
        P21(:,:,k+2) = P21(:,:,k+1);
    end
    if trace(P22(:,:,k+2)) > 1e5
        P22(:,:,k+2) = P22(:,:,k+1);
    end
    if trace(P23(:,:,k+2)) > 1e5
        P23(:,:,k+2) = P23(:,:,k+1);
    end
    if trace(P24(:,:,k+2)) > 1e5
        P24(:,:,k+2) = P24(:,:,k+1);
    end
    if trace(P25(:,:,k+2)) > 1e5
        P25(:,:,k+2) = P25(:,:,k+1);
    end
    if trace(P26(:,:,k+2)) > 1e5
        P26(:,:,k+2) = P26(:,:,k+1);
    end
    if trace(P27(:,:,k+2)) > 1e5
        P27(:,:,k+2) = P27(:,:,k+1);
    end
    if trace(P28(:,:,k+2)) > 1e5
        P28(:,:,k+2) = P28(:,:,k+1);
    end
    if trace(P29(:,:,k+2)) > 1e5
        P29(:,:,k+2) = P29(:,:,k+1);
    end
    if trace(P30(:,:,k+2)) > 1e5
        P30(:,:,k+2) = P30(:,:,k+1);
    end
    if trace(P31(:,:,k+2)) > 1e5
        P31(:,:,k+2) = P31(:,:,k+1);
    end
    if trace(P32(:,:,k+2)) > 1e5
        P32(:,:,k+2) = P32(:,:,k+1);
    end
    if trace(P33(:,:,k+2)) > 1e5
        P33(:,:,k+2) = P33(:,:,k+1);
    end
    if trace(P34(:,:,k+2)) > 1e5
        P34(:,:,k+2) = P34(:,:,k+1);
    end
    if trace(P35(:,:,k+2)) > 1e5
        P35(:,:,k+2) = P35(:,:,k+1);
    end
    if trace(P36(:,:,k+2)) > 1e5
        P36(:,:,k+2) = P36(:,:,k+1);
    end
    if trace(P37(:,:,k+2)) > 1e5
        P37(:,:,k+2) = P37(:,:,k+1);
    end
    if trace(P38(:,:,k+2)) > 1e5
        P38(:,:,k+2) = P38(:,:,k+1);
    end
    if trace(P39(:,:,k+2)) > 1e5
        P39(:,:,k+2) = P39(:,:,k+1);
    end
    if trace(P40(:,:,k+2)) > 1e5
        P40(:,:,k+2) = P40(:,:,k+1);
    end
    if trace(P41(:,:,k+2)) > 1e5
        P41(:,:,k+2) = P41(:,:,k+1);
    end
    if trace(P42(:,:,k+2)) > 1e5
        P42(:,:,k+2) = P42(:,:,k+1);
    end
    if trace(P43(:,:,k+2)) > 1e5
        P43(:,:,k+2) = P43(:,:,k+1);
    end
    if trace(P44(:,:,k+2)) > 1e5
        P44(:,:,k+2) = P44(:,:,k+1);
    end
    if trace(P45(:,:,k+2)) > 1e5
        P45(:,:,k+2) = P45(:,:,k+1);
    end
    if trace(P46(:,:,k+2)) > 1e5
        P46(:,:,k+2) = P46(:,:,k+1);
    end
    if trace(P47(:,:,k+2)) > 1e5
        P47(:,:,k+2) = P47(:,:,k+1);
    end
    if trace(P48(:,:,k+2)) > 1e5
        P48(:,:,k+2) = P48(:,:,k+1);
    end
    if trace(P49(:,:,k+2)) > 1e5
        P49(:,:,k+2) = P49(:,:,k+1);
    end
    if trace(P50(:,:,k+2)) > 1e5
        P50(:,:,k+2) = P50(:,:,k+1);
    end
    if trace(P51(:,:,k+2)) > 1e5
        P51(:,:,k+2) = P51(:,:,k+1);
    end
    if trace(P52(:,:,k+2)) > 1e5
        P52(:,:,k+2) = P52(:,:,k+1);
    end
    if trace(P53(:,:,k+2)) > 1e5
        P53(:,:,k+2) = P53(:,:,k+1);
    end
    if trace(P54(:,:,k+2)) > 1e5
        P54(:,:,k+2) = P54(:,:,k+1);
    end
    if trace(P55(:,:,k+2)) > 1e5
        P55(:,:,k+2) = P55(:,:,k+1);
    end
    if trace(P56(:,:,k+2)) > 1e5
        P56(:,:,k+2) = P56(:,:,k+1);
    end
    if trace(P57(:,:,k+2)) > 1e5
        P57(:,:,k+2) = P57(:,:,k+1);
    end
    if trace(P58(:,:,k+2)) > 1e5
        P58(:,:,k+2) = P58(:,:,k+1);
    end
    if trace(P59(:,:,k+2)) > 1e5
        P59(:,:,k+2) = P59(:,:,k+1);
    end
    if trace(P60(:,:,k+2)) > 1e5
        P60(:,:,k+2) = P60(:,:,k+1);
    end
    if trace(P61(:,:,k+2)) > 1e5
        P61(:,:,k+2) = P61(:,:,k+1);
    end
    if trace(P62(:,:,k+2)) > 1e5
        P62(:,:,k+2) = P62(:,:,k+1);
    end
    if trace(P63(:,:,k+2)) > 1e5
        P63(:,:,k+2) = P63(:,:,k+1);
    end
    if trace(P64(:,:,k+2)) > 1e5
        P64(:,:,k+2) = P64(:,:,k+1);
    end
    if trace(P65(:,:,k+2)) > 1e5
        P65(:,:,k+2) = P65(:,:,k+1);
    end
    if trace(P66(:,:,k+2)) > 1e5
        P66(:,:,k+2) = P66(:,:,k+1);
    end
    if trace(P67(:,:,k+2)) > 1e5
        P67(:,:,k+2) = P67(:,:,k+1);
    end
    if trace(P68(:,:,k+2)) > 1e5
        P68(:,:,k+2) = P68(:,:,k+1);
    end
    if trace(P69(:,:,k+2)) > 1e5
        P69(:,:,k+2) = P69(:,:,k+1);
    end
    if trace(P70(:,:,k+2)) > 1e5
        P70(:,:,k+2) = P70(:,:,k+1);
    end
    if trace(P71(:,:,k+2)) > 1e5
        P71(:,:,k+2) = P71(:,:,k+1);
    end
    if trace(P72(:,:,k+2)) > 1e5
        P72(:,:,k+2) = P72(:,:,k+1);
    end
    if trace(P73(:,:,k+2)) > 1e5
        P73(:,:,k+2) = P73(:,:,k+1);
    end
    if trace(P74(:,:,k+2)) > 1e5
        P74(:,:,k+2) = P74(:,:,k+1);
    end
    if trace(P75(:,:,k+2)) > 1e5
        P75(:,:,k+2) = P75(:,:,k+1);
    end
    if trace(P76(:,:,k+2)) > 1e5
        P76(:,:,k+2) = P76(:,:,k+1);
    end
    if trace(P77(:,:,k+2)) > 1e5
        P77(:,:,k+2) = P77(:,:,k+1);
    end
    if trace(P78(:,:,k+2)) > 1e5
        P78(:,:,k+2) = P78(:,:,k+1);
    end
    if trace(P79(:,:,k+2)) > 1e5
        P79(:,:,k+2) = P79(:,:,k+1);
    end
    if trace(P80(:,:,k+2)) > 1e5
        P80(:,:,k+2) = P80(:,:,k+1);
    end
    if trace(P81(:,:,k+2)) > 1e5
        P81(:,:,k+2) = P81(:,:,k+1);
    end
    if trace(P82(:,:,k+2)) > 1e5
        P82(:,:,k+2) = P82(:,:,k+1);
    end
    if trace(P83(:,:,k+2)) > 1e5
        P83(:,:,k+2) = P83(:,:,k+1);
    end
    if trace(P84(:,:,k+2)) > 1e5
        P84(:,:,k+2) = P84(:,:,k+1);
    end
    if trace(P85(:,:,k+2)) > 1e5
        P85(:,:,k+2) = P85(:,:,k+1);
    end
    if trace(P86(:,:,k+2)) > 1e5
        P86(:,:,k+2) = P86(:,:,k+1);
    end
    if trace(P87(:,:,k+2)) > 1e5
        P87(:,:,k+2) = P87(:,:,k+1);
    end
    if trace(P88(:,:,k+2)) > 1e5
        P88(:,:,k+2) = P88(:,:,k+1);
    end
    if trace(P89(:,:,k+2)) > 1e5
        P89(:,:,k+2) = P89(:,:,k+1);
    end
    if trace(P90(:,:,k+2)) > 1e5
        P90(:,:,k+2) = P90(:,:,k+1);
    end
    if trace(P91(:,:,k+2)) > 1e5
        P91(:,:,k+2) = P91(:,:,k+1);
    end
    if trace(P92(:,:,k+2)) > 1e5
        P92(:,:,k+2) = P92(:,:,k+1);
    end
    if trace(P93(:,:,k+2)) > 1e5
        P93(:,:,k+2) = P93(:,:,k+1);
    end
    if trace(P94(:,:,k+2)) > 1e5
        P94(:,:,k+2) = P94(:,:,k+1);
    end
    if trace(P95(:,:,k+2)) > 1e5
        P95(:,:,k+2) = P95(:,:,k+1);
    end
    if trace(P96(:,:,k+2)) > 1e5
        P96(:,:,k+2) = P6(:,:,k+1);
    end
    if trace(P97(:,:,k+2)) > 1e5
        P97(:,:,k+2) = P97(:,:,k+1);
    end
    if trace(P98(:,:,k+2)) > 1e5
        P98(:,:,k+2) = P98(:,:,k+1);
    end
    if trace(P99(:,:,k+2)) > 1e5
        P99(:,:,k+2) = P99(:,:,k+1);
    end
    if trace(P100(:,:,k+2)) > 1e5
        P100(:,:,k+2) = P100(:,:,k+1);
    end
    if trace(P101(:,:,k+2)) > 1e5
        P101(:,:,k+2) = P101(:,:,k+1);
    end
    if trace(P102(:,:,k+2)) > 1e5
        P102(:,:,k+2) = P102(:,:,k+1);
    end
    if trace(P103(:,:,k+2)) > 1e5
        P103(:,:,k+2) = P103(:,:,k+1);
    end
    if trace(P104(:,:,k+2)) > 1e5
        P104(:,:,k+2) = P104(:,:,k+1);
    end
    if trace(P105(:,:,k+2)) > 1e5
        P105(:,:,k+2) = P105(:,:,k+1);
    end


    for j=1:1:51
        h_f(j,k+1)=exp(-norm(x(k+1)-m_f(j))^2/(2*b_f^2));
    end 

    for j=1:1:6
        h_g(j,k+1)=exp(-norm(x(k+1)-m_g(j))^2/(2*b_g^2));
    end  

    u_dual_1(k+1) = ((input_ref(k+1)-theta_1(1)*w_f'*h_f(:,k+1)-theta_1(3))*(theta_1(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P1(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P1(3,3,k+1)+(theta_1(2)*w_g'*h_g(:,k+1))^2);
    u_dual_2(k+1) = ((input_ref(k+1)-theta_2(1)*w_f'*h_f(:,k+1)-theta_2(3))*(theta_2(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P2(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P2(3,3,k+1)+(theta_2(2)*w_g'*h_g(:,k+1))^2);
    u_dual_3(k+1) = ((input_ref(k+1)-theta_3(1)*w_f'*h_f(:,k+1)-theta_3(3))*(theta_3(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P3(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P3(3,3,k+1)+(theta_3(2)*w_g'*h_g(:,k+1))^2);
    u_dual_4(k+1) = ((input_ref(k+1)-theta_4(1)*w_f'*h_f(:,k+1)-theta_4(3))*(theta_4(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P4(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P4(3,3,k+1)+(theta_4(2)*w_g'*h_g(:,k+1))^2);
    u_dual_5(k+1) = ((input_ref(k+1)-theta_5(1)*w_f'*h_f(:,k+1)-theta_5(3))*(theta_5(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P5(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P5(3,3,k+1)+(theta_5(2)*w_g'*h_g(:,k+1))^2);
    u_dual_6(k+1) = ((input_ref(k+1)-theta_6(1)*w_f'*h_f(:,k+1)-theta_6(3))*(theta_6(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P6(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P6(3,3,k+1)+(theta_6(2)*w_g'*h_g(:,k+1))^2);
    u_dual_7(k+1) = ((input_ref(k+1)-theta_7(1)*w_f'*h_f(:,k+1)-theta_7(3))*(theta_7(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P7(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P7(3,3,k+1)+(theta_7(2)*w_g'*h_g(:,k+1))^2);
    u_dual_8(k+1) = ((input_ref(k+1)-theta_8(1)*w_f'*h_f(:,k+1)-theta_8(3))*(theta_8(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P8(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P8(3,3,k+1)+(theta_8(2)*w_g'*h_g(:,k+1))^2);
    u_dual_9(k+1) = ((input_ref(k+1)-theta_9(1)*w_f'*h_f(:,k+1)-theta_9(3))*(theta_9(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P9(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P9(3,3,k+1)+(theta_9(2)*w_g'*h_g(:,k+1))^2);
    u_dual_10(k+1) = ((input_ref(k+1)-theta_10(1)*w_f'*h_f(:,k+1)-theta_10(3))*(theta_10(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P10(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P10(3,3,k+1)+(theta_10(2)*w_g'*h_g(:,k+1))^2);
    u_dual_11(k+1) = ((input_ref(k+1)-theta_11(1)*w_f'*h_f(:,k+1)-theta_11(3))*(theta_11(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P11(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P11(3,3,k+1)+(theta_11(2)*w_g'*h_g(:,k+1))^2);
    u_dual_12(k+1) = ((input_ref(k+1)-theta_12(1)*w_f'*h_f(:,k+1)-theta_12(3))*(theta_12(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P12(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P12(3,3,k+1)+(theta_12(2)*w_g'*h_g(:,k+1))^2);
    u_dual_13(k+1) = ((input_ref(k+1)-theta_13(1)*w_f'*h_f(:,k+1)-theta_13(3))*(theta_13(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P13(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P13(3,3,k+1)+(theta_13(2)*w_g'*h_g(:,k+1))^2);
    u_dual_14(k+1) = ((input_ref(k+1)-theta_14(1)*w_f'*h_f(:,k+1)-theta_14(3))*(theta_14(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P14(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P14(3,3,k+1)+(theta_14(2)*w_g'*h_g(:,k+1))^2);
    u_dual_15(k+1) = ((input_ref(k+1)-theta_15(1)*w_f'*h_f(:,k+1)-theta_15(3))*(theta_15(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P15(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P15(3,3,k+1)+(theta_15(2)*w_g'*h_g(:,k+1))^2);
    u_dual_16(k+1) = ((input_ref(k+1)-theta_16(1)*w_f'*h_f(:,k+1)-theta_16(3))*(theta_16(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P16(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P16(3,3,k+1)+(theta_16(2)*w_g'*h_g(:,k+1))^2);
    u_dual_17(k+1) = ((input_ref(k+1)-theta_17(1)*w_f'*h_f(:,k+1)-theta_17(3))*(theta_17(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P17(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P17(3,3,k+1)+(theta_17(2)*w_g'*h_g(:,k+1))^2);
    u_dual_18(k+1) = ((input_ref(k+1)-theta_18(1)*w_f'*h_f(:,k+1)-theta_18(3))*(theta_18(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P18(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P18(3,3,k+1)+(theta_18(2)*w_g'*h_g(:,k+1))^2);
    u_dual_19(k+1) = ((input_ref(k+1)-theta_19(1)*w_f'*h_f(:,k+1)-theta_19(3))*(theta_19(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P19(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P19(3,3,k+1)+(theta_19(2)*w_g'*h_g(:,k+1))^2);
    u_dual_20(k+1) = ((input_ref(k+1)-theta_20(1)*w_f'*h_f(:,k+1)-theta_20(3))*(theta_20(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P20(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P20(3,3,k+1)+(theta_20(2)*w_g'*h_g(:,k+1))^2);
    u_dual_21(k+1) = ((input_ref(k+1)-theta_21(1)*w_f'*h_f(:,k+1)-theta_21(3))*(theta_21(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P21(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P21(3,3,k+1)+(theta_21(2)*w_g'*h_g(:,k+1))^2);
    u_dual_22(k+1) = ((input_ref(k+1)-theta_22(1)*w_f'*h_f(:,k+1)-theta_22(3))*(theta_22(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P22(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P22(3,3,k+1)+(theta_22(2)*w_g'*h_g(:,k+1))^2);
    u_dual_23(k+1) = ((input_ref(k+1)-theta_23(1)*w_f'*h_f(:,k+1)-theta_23(3))*(theta_23(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P23(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P23(3,3,k+1)+(theta_23(2)*w_g'*h_g(:,k+1))^2);
    u_dual_24(k+1) = ((input_ref(k+1)-theta_24(1)*w_f'*h_f(:,k+1)-theta_24(3))*(theta_24(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P24(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P24(3,3,k+1)+(theta_24(2)*w_g'*h_g(:,k+1))^2);
    u_dual_25(k+1) = ((input_ref(k+1)-theta_25(1)*w_f'*h_f(:,k+1)-theta_25(3))*(theta_25(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P25(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P25(3,3,k+1)+(theta_25(2)*w_g'*h_g(:,k+1))^2);
    u_dual_26(k+1) = ((input_ref(k+1)-theta_26(1)*w_f'*h_f(:,k+1)-theta_26(3))*(theta_26(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P26(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P26(3,3,k+1)+(theta_26(2)*w_g'*h_g(:,k+1))^2);
    u_dual_27(k+1) = ((input_ref(k+1)-theta_27(1)*w_f'*h_f(:,k+1)-theta_27(3))*(theta_27(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P27(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P27(3,3,k+1)+(theta_27(2)*w_g'*h_g(:,k+1))^2);
    u_dual_28(k+1) = ((input_ref(k+1)-theta_28(1)*w_f'*h_f(:,k+1)-theta_28(3))*(theta_28(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P28(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P28(3,3,k+1)+(theta_28(2)*w_g'*h_g(:,k+1))^2);
    u_dual_29(k+1) = ((input_ref(k+1)-theta_29(1)*w_f'*h_f(:,k+1)-theta_29(3))*(theta_29(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P29(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P29(3,3,k+1)+(theta_29(2)*w_g'*h_g(:,k+1))^2);
    u_dual_30(k+1) = ((input_ref(k+1)-theta_30(1)*w_f'*h_f(:,k+1)-theta_30(3))*(theta_30(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P30(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P30(3,3,k+1)+(theta_30(2)*w_g'*h_g(:,k+1))^2);
    u_dual_31(k+1) = ((input_ref(k+1)-theta_31(1)*w_f'*h_f(:,k+1)-theta_31(3))*(theta_31(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P31(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P31(3,3,k+1)+(theta_31(2)*w_g'*h_g(:,k+1))^2);
    u_dual_32(k+1) = ((input_ref(k+1)-theta_32(1)*w_f'*h_f(:,k+1)-theta_32(3))*(theta_32(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P32(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P32(3,3,k+1)+(theta_32(2)*w_g'*h_g(:,k+1))^2);
    u_dual_33(k+1) = ((input_ref(k+1)-theta_33(1)*w_f'*h_f(:,k+1)-theta_33(3))*(theta_33(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P33(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P33(3,3,k+1)+(theta_33(2)*w_g'*h_g(:,k+1))^2);
    u_dual_34(k+1) = ((input_ref(k+1)-theta_34(1)*w_f'*h_f(:,k+1)-theta_34(3))*(theta_34(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P34(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P34(3,3,k+1)+(theta_34(2)*w_g'*h_g(:,k+1))^2);
    u_dual_35(k+1) = ((input_ref(k+1)-theta_35(1)*w_f'*h_f(:,k+1)-theta_35(3))*(theta_35(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P35(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P35(3,3,k+1)+(theta_35(2)*w_g'*h_g(:,k+1))^2);
    u_dual_36(k+1) = ((input_ref(k+1)-theta_36(1)*w_f'*h_f(:,k+1)-theta_36(3))*(theta_36(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P36(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P36(3,3,k+1)+(theta_36(2)*w_g'*h_g(:,k+1))^2);
    u_dual_37(k+1) = ((input_ref(k+1)-theta_37(1)*w_f'*h_f(:,k+1)-theta_37(3))*(theta_37(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P37(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P37(3,3,k+1)+(theta_37(2)*w_g'*h_g(:,k+1))^2);
    u_dual_38(k+1) = ((input_ref(k+1)-theta_38(1)*w_f'*h_f(:,k+1)-theta_38(3))*(theta_38(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P38(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P38(3,3,k+1)+(theta_38(2)*w_g'*h_g(:,k+1))^2);
    u_dual_39(k+1) = ((input_ref(k+1)-theta_39(1)*w_f'*h_f(:,k+1)-theta_39(3))*(theta_39(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P39(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P39(3,3,k+1)+(theta_39(2)*w_g'*h_g(:,k+1))^2);
    u_dual_40(k+1) = ((input_ref(k+1)-theta_40(1)*w_f'*h_f(:,k+1)-theta_40(3))*(theta_40(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P40(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P40(3,3,k+1)+(theta_40(2)*w_g'*h_g(:,k+1))^2);
    u_dual_41(k+1) = ((input_ref(k+1)-theta_41(1)*w_f'*h_f(:,k+1)-theta_41(3))*(theta_41(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P41(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P41(3,3,k+1)+(theta_41(2)*w_g'*h_g(:,k+1))^2);
    u_dual_42(k+1) = ((input_ref(k+1)-theta_42(1)*w_f'*h_f(:,k+1)-theta_42(3))*(theta_42(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P42(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P42(3,3,k+1)+(theta_42(2)*w_g'*h_g(:,k+1))^2);
    u_dual_43(k+1) = ((input_ref(k+1)-theta_43(1)*w_f'*h_f(:,k+1)-theta_43(3))*(theta_43(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P43(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P43(3,3,k+1)+(theta_43(2)*w_g'*h_g(:,k+1))^2);
    u_dual_44(k+1) = ((input_ref(k+1)-theta_44(1)*w_f'*h_f(:,k+1)-theta_44(3))*(theta_44(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P44(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P44(3,3,k+1)+(theta_44(2)*w_g'*h_g(:,k+1))^2);
    u_dual_45(k+1) = ((input_ref(k+1)-theta_45(1)*w_f'*h_f(:,k+1)-theta_45(3))*(theta_45(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P45(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P45(3,3,k+1)+(theta_45(2)*w_g'*h_g(:,k+1))^2);
    u_dual_46(k+1) = ((input_ref(k+1)-theta_46(1)*w_f'*h_f(:,k+1)-theta_46(3))*(theta_46(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P46(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P46(3,3,k+1)+(theta_46(2)*w_g'*h_g(:,k+1))^2);
    u_dual_47(k+1) = ((input_ref(k+1)-theta_47(1)*w_f'*h_f(:,k+1)-theta_47(3))*(theta_47(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P47(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P47(3,3,k+1)+(theta_47(2)*w_g'*h_g(:,k+1))^2);
    u_dual_48(k+1) = ((input_ref(k+1)-theta_48(1)*w_f'*h_f(:,k+1)-theta_48(3))*(theta_48(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P48(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P48(3,3,k+1)+(theta_48(2)*w_g'*h_g(:,k+1))^2);
    u_dual_49(k+1) = ((input_ref(k+1)-theta_49(1)*w_f'*h_f(:,k+1)-theta_49(3))*(theta_49(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P49(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P49(3,3,k+1)+(theta_49(2)*w_g'*h_g(:,k+1))^2);
    u_dual_50(k+1) = ((input_ref(k+1)-theta_50(1)*w_f'*h_f(:,k+1)-theta_50(3))*(theta_50(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P50(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P50(3,3,k+1)+(theta_50(2)*w_g'*h_g(:,k+1))^2);
    u_dual_51(k+1) = ((input_ref(k+1)-theta_51(1)*w_f'*h_f(:,k+1)-theta_51(3))*(theta_51(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P51(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P51(3,3,k+1)+(theta_51(2)*w_g'*h_g(:,k+1))^2);
    u_dual_52(k+1) = ((input_ref(k+1)-theta_52(1)*w_f'*h_f(:,k+1)-theta_52(3))*(theta_52(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P52(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P52(3,3,k+1)+(theta_52(2)*w_g'*h_g(:,k+1))^2);
    u_dual_53(k+1) = ((input_ref(k+1)-theta_53(1)*w_f'*h_f(:,k+1)-theta_53(3))*(theta_53(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P53(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P53(3,3,k+1)+(theta_53(2)*w_g'*h_g(:,k+1))^2);
    u_dual_54(k+1) = ((input_ref(k+1)-theta_54(1)*w_f'*h_f(:,k+1)-theta_54(3))*(theta_54(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P54(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P54(3,3,k+1)+(theta_54(2)*w_g'*h_g(:,k+1))^2);
    u_dual_55(k+1) = ((input_ref(k+1)-theta_55(1)*w_f'*h_f(:,k+1)-theta_55(3))*(theta_55(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P55(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P55(3,3,k+1)+(theta_55(2)*w_g'*h_g(:,k+1))^2);
    u_dual_56(k+1) = ((input_ref(k+1)-theta_56(1)*w_f'*h_f(:,k+1)-theta_56(3))*(theta_56(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P56(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P56(3,3,k+1)+(theta_56(2)*w_g'*h_g(:,k+1))^2);
    u_dual_57(k+1) = ((input_ref(k+1)-theta_57(1)*w_f'*h_f(:,k+1)-theta_57(3))*(theta_57(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P57(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P57(3,3,k+1)+(theta_57(2)*w_g'*h_g(:,k+1))^2);
    u_dual_58(k+1) = ((input_ref(k+1)-theta_58(1)*w_f'*h_f(:,k+1)-theta_58(3))*(theta_58(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P58(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P58(3,3,k+1)+(theta_58(2)*w_g'*h_g(:,k+1))^2);
    u_dual_59(k+1) = ((input_ref(k+1)-theta_59(1)*w_f'*h_f(:,k+1)-theta_59(3))*(theta_59(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P59(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P59(3,3,k+1)+(theta_59(2)*w_g'*h_g(:,k+1))^2);
    u_dual_60(k+1) = ((input_ref(k+1)-theta_60(1)*w_f'*h_f(:,k+1)-theta_60(3))*(theta_60(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P60(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P60(3,3,k+1)+(theta_60(2)*w_g'*h_g(:,k+1))^2);
    u_dual_61(k+1) = ((input_ref(k+1)-theta_61(1)*w_f'*h_f(:,k+1)-theta_61(3))*(theta_61(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P61(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P61(3,3,k+1)+(theta_61(2)*w_g'*h_g(:,k+1))^2);
    u_dual_62(k+1) = ((input_ref(k+1)-theta_62(1)*w_f'*h_f(:,k+1)-theta_62(3))*(theta_62(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P62(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P62(3,3,k+1)+(theta_62(2)*w_g'*h_g(:,k+1))^2);
    u_dual_63(k+1) = ((input_ref(k+1)-theta_63(1)*w_f'*h_f(:,k+1)-theta_63(3))*(theta_63(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P63(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P63(3,3,k+1)+(theta_63(2)*w_g'*h_g(:,k+1))^2);
    u_dual_64(k+1) = ((input_ref(k+1)-theta_64(1)*w_f'*h_f(:,k+1)-theta_64(3))*(theta_64(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P64(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P64(3,3,k+1)+(theta_64(2)*w_g'*h_g(:,k+1))^2);
    u_dual_65(k+1) = ((input_ref(k+1)-theta_65(1)*w_f'*h_f(:,k+1)-theta_65(3))*(theta_65(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P65(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P65(3,3,k+1)+(theta_65(2)*w_g'*h_g(:,k+1))^2);
    u_dual_66(k+1) = ((input_ref(k+1)-theta_66(1)*w_f'*h_f(:,k+1)-theta_66(3))*(theta_66(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P66(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P66(3,3,k+1)+(theta_66(2)*w_g'*h_g(:,k+1))^2);
    u_dual_67(k+1) = ((input_ref(k+1)-theta_67(1)*w_f'*h_f(:,k+1)-theta_67(3))*(theta_67(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P67(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P67(3,3,k+1)+(theta_67(2)*w_g'*h_g(:,k+1))^2);
    u_dual_68(k+1) = ((input_ref(k+1)-theta_68(1)*w_f'*h_f(:,k+1)-theta_68(3))*(theta_68(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P68(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P68(3,3,k+1)+(theta_68(2)*w_g'*h_g(:,k+1))^2);
    u_dual_69(k+1) = ((input_ref(k+1)-theta_69(1)*w_f'*h_f(:,k+1)-theta_69(3))*(theta_69(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P69(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P69(3,3,k+1)+(theta_69(2)*w_g'*h_g(:,k+1))^2);
    u_dual_70(k+1) = ((input_ref(k+1)-theta_70(1)*w_f'*h_f(:,k+1)-theta_70(3))*(theta_70(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P70(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P70(3,3,k+1)+(theta_70(2)*w_g'*h_g(:,k+1))^2);
    u_dual_71(k+1) = ((input_ref(k+1)-theta_71(1)*w_f'*h_f(:,k+1)-theta_71(3))*(theta_71(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P71(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P71(3,3,k+1)+(theta_71(2)*w_g'*h_g(:,k+1))^2);
    u_dual_72(k+1) = ((input_ref(k+1)-theta_72(1)*w_f'*h_f(:,k+1)-theta_72(3))*(theta_72(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P72(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P72(3,3,k+1)+(theta_72(2)*w_g'*h_g(:,k+1))^2);
    u_dual_73(k+1) = ((input_ref(k+1)-theta_73(1)*w_f'*h_f(:,k+1)-theta_73(3))*(theta_73(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P73(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P73(3,3,k+1)+(theta_73(2)*w_g'*h_g(:,k+1))^2);
    u_dual_74(k+1) = ((input_ref(k+1)-theta_74(1)*w_f'*h_f(:,k+1)-theta_74(3))*(theta_74(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P74(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P74(3,3,k+1)+(theta_74(2)*w_g'*h_g(:,k+1))^2);
    u_dual_75(k+1) = ((input_ref(k+1)-theta_75(1)*w_f'*h_f(:,k+1)-theta_75(3))*(theta_75(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P75(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P75(3,3,k+1)+(theta_75(2)*w_g'*h_g(:,k+1))^2);
    u_dual_76(k+1) = ((input_ref(k+1)-theta_76(1)*w_f'*h_f(:,k+1)-theta_76(3))*(theta_76(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P76(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P76(3,3,k+1)+(theta_76(2)*w_g'*h_g(:,k+1))^2);
    u_dual_77(k+1) = ((input_ref(k+1)-theta_77(1)*w_f'*h_f(:,k+1)-theta_77(3))*(theta_77(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P77(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P77(3,3,k+1)+(theta_77(2)*w_g'*h_g(:,k+1))^2);
    u_dual_78(k+1) = ((input_ref(k+1)-theta_78(1)*w_f'*h_f(:,k+1)-theta_78(3))*(theta_78(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P78(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P78(3,3,k+1)+(theta_78(2)*w_g'*h_g(:,k+1))^2);
    u_dual_79(k+1) = ((input_ref(k+1)-theta_79(1)*w_f'*h_f(:,k+1)-theta_79(3))*(theta_79(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P79(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P79(3,3,k+1)+(theta_79(2)*w_g'*h_g(:,k+1))^2);
    u_dual_80(k+1) = ((input_ref(k+1)-theta_80(1)*w_f'*h_f(:,k+1)-theta_80(3))*(theta_80(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P80(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P80(3,3,k+1)+(theta_80(2)*w_g'*h_g(:,k+1))^2);
    u_dual_81(k+1) = ((input_ref(k+1)-theta_81(1)*w_f'*h_f(:,k+1)-theta_81(3))*(theta_81(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P81(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P81(3,3,k+1)+(theta_81(2)*w_g'*h_g(:,k+1))^2);
    u_dual_82(k+1) = ((input_ref(k+1)-theta_82(1)*w_f'*h_f(:,k+1)-theta_82(3))*(theta_82(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P82(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P82(3,3,k+1)+(theta_82(2)*w_g'*h_g(:,k+1))^2);
    u_dual_83(k+1) = ((input_ref(k+1)-theta_83(1)*w_f'*h_f(:,k+1)-theta_83(3))*(theta_83(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P83(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P83(3,3,k+1)+(theta_83(2)*w_g'*h_g(:,k+1))^2);
    u_dual_84(k+1) = ((input_ref(k+1)-theta_84(1)*w_f'*h_f(:,k+1)-theta_84(3))*(theta_84(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P84(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P84(3,3,k+1)+(theta_84(2)*w_g'*h_g(:,k+1))^2);
    u_dual_85(k+1) = ((input_ref(k+1)-theta_85(1)*w_f'*h_f(:,k+1)-theta_85(3))*(theta_85(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P85(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P85(3,3,k+1)+(theta_85(2)*w_g'*h_g(:,k+1))^2);
    u_dual_86(k+1) = ((input_ref(k+1)-theta_86(1)*w_f'*h_f(:,k+1)-theta_86(3))*(theta_86(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P86(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P86(3,3,k+1)+(theta_86(2)*w_g'*h_g(:,k+1))^2);
    u_dual_87(k+1) = ((input_ref(k+1)-theta_87(1)*w_f'*h_f(:,k+1)-theta_87(3))*(theta_87(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P87(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P87(3,3,k+1)+(theta_87(2)*w_g'*h_g(:,k+1))^2);
    u_dual_88(k+1) = ((input_ref(k+1)-theta_88(1)*w_f'*h_f(:,k+1)-theta_88(3))*(theta_88(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P88(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P88(3,3,k+1)+(theta_88(2)*w_g'*h_g(:,k+1))^2);
    u_dual_89(k+1) = ((input_ref(k+1)-theta_89(1)*w_f'*h_f(:,k+1)-theta_89(3))*(theta_89(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P89(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P89(3,3,k+1)+(theta_89(2)*w_g'*h_g(:,k+1))^2);
    u_dual_90(k+1) = ((input_ref(k+1)-theta_90(1)*w_f'*h_f(:,k+1)-theta_90(3))*(theta_90(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P90(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P90(3,3,k+1)+(theta_90(2)*w_g'*h_g(:,k+1))^2);
    u_dual_91(k+1) = ((input_ref(k+1)-theta_91(1)*w_f'*h_f(:,k+1)-theta_91(3))*(theta_91(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P91(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P91(3,3,k+1)+(theta_91(2)*w_g'*h_g(:,k+1))^2);
    u_dual_92(k+1) = ((input_ref(k+1)-theta_92(1)*w_f'*h_f(:,k+1)-theta_92(3))*(theta_92(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P92(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P92(3,3,k+1)+(theta_92(2)*w_g'*h_g(:,k+1))^2);
    u_dual_93(k+1) = ((input_ref(k+1)-theta_93(1)*w_f'*h_f(:,k+1)-theta_93(3))*(theta_93(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P93(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P93(3,3,k+1)+(theta_93(2)*w_g'*h_g(:,k+1))^2);
    u_dual_94(k+1) = ((input_ref(k+1)-theta_94(1)*w_f'*h_f(:,k+1)-theta_94(3))*(theta_94(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P94(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P94(3,3,k+1)+(theta_94(2)*w_g'*h_g(:,k+1))^2);
    u_dual_95(k+1) = ((input_ref(k+1)-theta_95(1)*w_f'*h_f(:,k+1)-theta_95(3))*(theta_95(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P95(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P95(3,3,k+1)+(theta_95(2)*w_g'*h_g(:,k+1))^2);
    u_dual_96(k+1) = ((input_ref(k+1)-theta_96(1)*w_f'*h_f(:,k+1)-theta_96(3))*(theta_96(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P96(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P96(3,3,k+1)+(theta_96(2)*w_g'*h_g(:,k+1))^2);
    u_dual_97(k+1) = ((input_ref(k+1)-theta_97(1)*w_f'*h_f(:,k+1)-theta_97(3))*(theta_97(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P97(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P97(3,3,k+1)+(theta_97(2)*w_g'*h_g(:,k+1))^2);
    u_dual_98(k+1) = ((input_ref(k+1)-theta_98(1)*w_f'*h_f(:,k+1)-theta_98(3))*(theta_98(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P98(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P98(3,3,k+1)+(theta_98(2)*w_g'*h_g(:,k+1))^2);
    u_dual_99(k+1) = ((input_ref(k+1)-theta_99(1)*w_f'*h_f(:,k+1)-theta_99(3))*(theta_99(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P99(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P99(3,3,k+1)+(theta_99(2)*w_g'*h_g(:,k+1))^2);
    u_dual_100(k+1) = ((input_ref(k+1)-theta_100(1)*w_f'*h_f(:,k+1)-theta_100(3))*(theta_100(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P100(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P100(3,3,k+1)+(theta_100(2)*w_g'*h_g(:,k+1))^2);
    u_dual_101(k+1) = ((input_ref(k+1)-theta_101(1)*w_f'*h_f(:,k+1)-theta_101(3))*(theta_101(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P101(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P101(3,3,k+1)+(theta_101(2)*w_g'*h_g(:,k+1))^2);
    u_dual_102(k+1) = ((input_ref(k+1)-theta_102(1)*w_f'*h_f(:,k+1)-theta_102(3))*(theta_102(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P102(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P102(3,3,k+1)+(theta_102(2)*w_g'*h_g(:,k+1))^2);
    u_dual_103(k+1) = ((input_ref(k+1)-theta_103(1)*w_f'*h_f(:,k+1)-theta_103(3))*(theta_103(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P103(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P103(3,3,k+1)+(theta_103(2)*w_g'*h_g(:,k+1))^2);
    u_dual_104(k+1) = ((input_ref(k+1)-theta_104(1)*w_f'*h_f(:,k+1)-theta_104(3))*(theta_104(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P104(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P104(3,3,k+1)+(theta_104(2)*w_g'*h_g(:,k+1))^2);
    u_dual_105(k+1) = ((input_ref(k+1)-theta_105(1)*w_f'*h_f(:,k+1)-theta_105(3))*(theta_105(2)*w_g'*h_g(:,k+1))-(1-lamda_dual)*[w_f'*h_f(:,k+1) 1]*P105(1:2,3,k+1)*w_g'*h_g(:,k+1))/((1-lamda_dual)*(w_g'*h_g(:,k+1))^2*P105(3,3,k+1)+(theta_105(2)*w_g'*h_g(:,k+1))^2);


    u_opt(k+1) = (input_ref(k+2)-alpha_real(k+1)*w_f'*h_f(:,k+1)-gamma_real(k+1))/(beta_real(k+1)*w_g'*h_g(:,k+1));

    u_q(k+1) = q_1*u_dual_1(k+1)+q_2*u_dual_2(k+1)+q_3*u_dual_3(k+1)+q_4*u_dual_4(k+1)+q_5*u_dual_5(k+1)+q_6*u_dual_6(k+1)+q_7*u_dual_7(k+1)+q_8*u_dual_8(k+1)+q_9*u_dual_9(k+1)+q_10*u_dual_10(k+1)...
         +q_11*u_dual_11(k+1)+q_12*u_dual_12(k+1)+q_13*u_dual_13(k+1)+q_14*u_dual_14(k+1)+q_15*u_dual_15(k+1)+q_16*u_dual_16(k+1)+q_17*u_dual_17(k+1)+q_18*u_dual_18(k+1)+q_19*u_dual_19(k+1)+q_20*u_dual_20(k+1)...
         +q_21*u_dual_21(k+1)+q_22*u_dual_22(k+1)+q_23*u_dual_23(k+1)+q_24*u_dual_24(k+1)+q_25*u_dual_25(k+1)+q_26*u_dual_26(k+1)+q_27*u_dual_27(k+1)+q_28*u_dual_28(k+1)+q_29*u_dual_29(k+1)+q_30*u_dual_30(k+1)...
         +q_31*u_dual_31(k+1)+q_32*u_dual_32(k+1)+q_33*u_dual_33(k+1)+q_34*u_dual_34(k+1)+q_35*u_dual_35(k+1)+q_36*u_dual_36(k+1)+q_37*u_dual_37(k+1)+q_38*u_dual_38(k+1)+q_39*u_dual_39(k+1)+q_40*u_dual_40(k+1)...
         +q_41*u_dual_41(k+1)+q_42*u_dual_42(k+1)+q_43*u_dual_43(k+1)+q_44*u_dual_44(k+1)+q_45*u_dual_45(k+1)+q_46*u_dual_46(k+1)+q_47*u_dual_47(k+1)+q_48*u_dual_48(k+1)+q_49*u_dual_49(k+1)+q_50*u_dual_50(k+1)...
         +q_51*u_dual_51(k+1)+q_52*u_dual_52(k+1)+q_53*u_dual_53(k+1)+q_54*u_dual_54(k+1)+q_55*u_dual_55(k+1)+q_56*u_dual_56(k+1)+q_57*u_dual_57(k+1)+q_58*u_dual_58(k+1)+q_59*u_dual_59(k+1)+q_60*u_dual_60(k+1)...
         +q_61*u_dual_61(k+1)+q_62*u_dual_62(k+1)+q_63*u_dual_63(k+1)+q_64*u_dual_64(k+1)+q_65*u_dual_65(k+1)+q_66*u_dual_66(k+1)+q_67*u_dual_67(k+1)+q_68*u_dual_68(k+1)+q_69*u_dual_69(k+1)+q_70*u_dual_70(k+1)...
         +q_71*u_dual_71(k+1)+q_72*u_dual_72(k+1)+q_73*u_dual_73(k+1)+q_74*u_dual_74(k+1)+q_75*u_dual_75(k+1)+q_76*u_dual_76(k+1)+q_77*u_dual_77(k+1)+q_78*u_dual_78(k+1)+q_79*u_dual_79(k+1)+q_80*u_dual_80(k+1)...
         +q_81*u_dual_81(k+1)+q_82*u_dual_82(k+1)+q_83*u_dual_83(k+1)+q_84*u_dual_84(k+1)+q_85*u_dual_85(k+1)+q_86*u_dual_86(k+1)+q_87*u_dual_87(k+1)+q_88*u_dual_88(k+1)+q_89*u_dual_89(k+1)+q_90*u_dual_90(k+1)...
         +q_91*u_dual_91(k+1)+q_92*u_dual_92(k+1)+q_93*u_dual_93(k+1)+q_94*u_dual_94(k+1)+q_95*u_dual_95(k+1)+q_96*u_dual_96(k+1)+q_97*u_dual_97(k+1)+q_98*u_dual_98(k+1)+q_99*u_dual_99(k+1)+q_100*u_dual_100(k+1)...
         +q_101*u_dual_101(k+1)+q_102*u_dual_102(k+1)+q_103*u_dual_103(k+1)+q_104*u_dual_104(k+1)+q_105*u_dual_105(k+1);
   

    if y_error(k+1) >2
        if q_1>0.98 || q_2>0.98 || q_3>0.98 || q_4>0.98 || q_5>0.98 || q_6>0.98 || q_7>0.98 || q_8>0.98 || q_9>0.98 || q_10>0.98 ...
                || q_11>0.98 || q_12>0.98 || q_13>0.98 || q_14>0.98 || q_15>0.98 || q_16>0.98 || q_17>0.98 || q_18>0.98 || q_19>0.98 || q_20>0.98 ...
                || q_21>0.98 || q_22>0.98 || q_23>0.98 || q_24>0.98 || q_25>0.98 || q_26>0.98 || q_27>0.98 || q_28>0.98 || q_29>0.98 || q_30>0.98 ...
                || q_31>0.98 || q_32>0.98 || q_33>0.98 || q_34>0.98 || q_35>0.98 || q_36>0.98 || q_37>0.98 || q_38>0.98 || q_39>0.98 || q_40>0.98 ...
                || q_41>0.98 || q_42>0.98 || q_43>0.98 || q_44>0.98 || q_45>0.98 || q_46>0.98 || q_47>0.98 || q_48>0.98 || q_49>0.98 || q_50>0.98 ...
                || q_51>0.98 || q_52>0.98 || q_53>0.98 || q_54>0.98 || q_55>0.98 || q_56>0.98 || q_57>0.98 || q_58>0.98 || q_59>0.98 || q_60>0.98 ...
                || q_61>0.98 || q_62>0.98 || q_63>0.98 || q_64>0.98 || q_65>0.98 || q_66>0.98 || q_67>0.98 || q_68>0.98 || q_69>0.98 || q_70>0.98 ...
                || q_71>0.98 || q_72>0.98 || q_73>0.98 || q_74>0.98 || q_75>0.98 || q_76>0.98 || q_77>0.98 || q_78>0.98 || q_79>0.98 || q_80>0.98 ...
                || q_81>0.98 || q_82>0.98 || q_83>0.98 || q_84>0.98 || q_85>0.98 || q_86>0.98 || q_87>0.98 || q_88>0.98 || q_89>0.98 || q_90>0.98 ...
                || q_91>0.98 || q_92>0.98 || q_93>0.98 || q_94>0.98 || q_95>0.98 || q_96>0.98 || q_97>0.98 || q_98>0.98 || q_99>0.98 || q_100>0.98 ...
                || q_101>0.98 || q_102>0.98 || q_103>0.98 || q_104>0.98 || q_105>0.98
                
            flag_reset = 1;

            q_1 = 1/105;
            q_2 = 1/105;
            q_3 = 1/105;
            q_4 = 1/105;
            q_5 = 1/105;
            q_6 = 1/105;
            q_7 = 1/105;
            q_8 = 1/105;
            q_9 = 1/105;
            q_10 = 1/105;
            q_11 = 1/105;
            q_12 = 1/105;
            q_13 = 1/105;
            q_14 = 1/105;
            q_15 = 1/105;
            q_16 = 1/105;
            q_17 = 1/105;
            q_18 = 1/105;
            q_19 = 1/105;
            q_20 = 1/105;
            q_21 = 1/105;
            q_22 = 1/105;
            q_23 = 1/105;
            q_24 = 1/105;
            q_25 = 1/105;
            q_26 = 1/105;
            q_27 = 1/105;
            q_28 = 1/105;
            q_29 = 1/105;
            q_30 = 1/105;
            q_31 = 1/105;
            q_32 = 1/105;
            q_33 = 1/105;
            q_34 = 1/105;
            q_35 = 1/105;
            q_36 = 1/105;
            q_37 = 1/105;
            q_38 = 1/105;
            q_39 = 1/105;
            q_40 = 1/105;
            q_41 = 1/105;
            q_42 = 1/105;
            q_43 = 1/105;
            q_44 = 1/105;
            q_45 = 1/105;
            q_46 = 1/105;
            q_47 = 1/105;
            q_48 = 1/105;
            q_49 = 1/105;
            q_50 = 1/105;
            q_51 = 1/105;
            q_52 = 1/105;
            q_53 = 1/105;
            q_54 = 1/105;
            q_55 = 1/105;
            q_56 = 1/105;
            q_57 = 1/105;
            q_58 = 1/105;
            q_59 = 1/105;
            q_60 = 1/105;
            q_61 = 1/105;
            q_62 = 1/105;
            q_63 = 1/105;
            q_64 = 1/105;
            q_65 = 1/105;
            q_66 = 1/105;
            q_67 = 1/105;
            q_68 = 1/105;
            q_69 = 1/105;
            q_70 = 1/105;
            q_71 = 1/105;
            q_72 = 1/105;
            q_73 = 1/105;
            q_74 = 1/105;
            q_75 = 1/105;
            q_76 = 1/105;
            q_77 = 1/105;
            q_78 = 1/105;
            q_79 = 1/105;
            q_80 = 1/105;
            q_81 = 1/105;
            q_82 = 1/105;
            q_83 = 1/105;
            q_84 = 1/105;
            q_85 = 1/105;
            q_86 = 1/105;
            q_87 = 1/105;
            q_88 = 1/105;
            q_89 = 1/105;
            q_90 = 1/105;
            q_91 = 1/105;
            q_92 = 1/105;
            q_93 = 1/105;
            q_94 = 1/105;
            q_95 = 1/105;
            q_96 = 1/105;
            q_97 = 1/105;
            q_98 = 1/105;
            q_99 = 1/105;
            q_100 = 1/105;
            q_101 = 1/105;
            q_102 = 1/105;
            q_103 = 1/105;
            q_104 = 1/105;
            q_105 = 1/105;

            P1(:,:,k+2) = var_P_V*eye(3,3);
            P2(:,:,k+2) = var_P_V*eye(3,3);
            P3(:,:,k+2) = var_P_V*eye(3,3);
            P4(:,:,k+2) = var_P_V*eye(3,3);
            P5(:,:,k+2) = var_P_V*eye(3,3);
            P6(:,:,k+2) = var_P_V*eye(3,3);
            P7(:,:,k+2) = var_P_V*eye(3,3);
            P8(:,:,k+2) = var_P_V*eye(3,3);
            P9(:,:,k+2) = var_P_V*eye(3,3);
            P10(:,:,k+2) = var_P_V*eye(3,3);
            P11(:,:,k+2) = var_P_V*eye(3,3);
            P12(:,:,k+2) = var_P_V*eye(3,3);
            P13(:,:,k+2) = var_P_V*eye(3,3);
            P14(:,:,k+2) = var_P_V*eye(3,3);
            P15(:,:,k+2) = var_P_V*eye(3,3);
            P16(:,:,k+2) = var_P_V*eye(3,3);
            P17(:,:,k+2) = var_P_V*eye(3,3);
            P18(:,:,k+2) = var_P_V*eye(3,3);
            P19(:,:,k+2) = var_P_V*eye(3,3);
            P20(:,:,k+2) = var_P_V*eye(3,3);
            P21(:,:,k+2) = var_P_V*eye(3,3);
            P22(:,:,k+2) = var_P_V*eye(3,3);
            P23(:,:,k+2) = var_P_V*eye(3,3);
            P24(:,:,k+2) = var_P_V*eye(3,3);
            P25(:,:,k+2) = var_P_V*eye(3,3);
            P26(:,:,k+2) = var_P_V*eye(3,3);
            P27(:,:,k+2) = var_P_V*eye(3,3);
            P28(:,:,k+2) = var_P_V*eye(3,3);
            P29(:,:,k+2) = var_P_V*eye(3,3);
            P30(:,:,k+2) = var_P_V*eye(3,3);
            P31(:,:,k+2) = var_P_V*eye(3,3);
            P32(:,:,k+2) = var_P_V*eye(3,3);
            P33(:,:,k+2) = var_P_V*eye(3,3);
            P34(:,:,k+2) = var_P_V*eye(3,3);
            P35(:,:,k+2) = var_P_V*eye(3,3);
            P36(:,:,k+2) = var_P_V*eye(3,3);
            P37(:,:,k+2) = var_P_V*eye(3,3);
            P38(:,:,k+2) = var_P_V*eye(3,3);
            P39(:,:,k+2) = var_P_V*eye(3,3);
            P40(:,:,k+2) = var_P_V*eye(3,3);
            P41(:,:,k+2) = var_P_V*eye(3,3);
            P42(:,:,k+2) = var_P_V*eye(3,3);
            P43(:,:,k+2) = var_P_V*eye(3,3);
            P44(:,:,k+2) = var_P_V*eye(3,3);
            P45(:,:,k+2) = var_P_V*eye(3,3);
            P46(:,:,k+2) = var_P_V*eye(3,3);
            P47(:,:,k+2) = var_P_V*eye(3,3);
            P48(:,:,k+2) = var_P_V*eye(3,3);
            P49(:,:,k+2) = var_P_V*eye(3,3);
            P50(:,:,k+2) = var_P_V*eye(3,3);
            P51(:,:,k+2) = var_P_V*eye(3,3);
            P52(:,:,k+2) = var_P_V*eye(3,3);
            P53(:,:,k+2) = var_P_V*eye(3,3);
            P54(:,:,k+2) = var_P_V*eye(3,3);
            P55(:,:,k+2) = var_P_V*eye(3,3);
            P56(:,:,k+2) = var_P_V*eye(3,3);
            P57(:,:,k+2) = var_P_V*eye(3,3);
            P58(:,:,k+2) = var_P_V*eye(3,3);
            P59(:,:,k+2) = var_P_V*eye(3,3);
            P60(:,:,k+2) = var_P_V*eye(3,3);
            P61(:,:,k+2) = var_P_V*eye(3,3);
            P62(:,:,k+2) = var_P_V*eye(3,3);
            P63(:,:,k+2) = var_P_V*eye(3,3);
            P64(:,:,k+2) = var_P_V*eye(3,3);
            P65(:,:,k+2) = var_P_V*eye(3,3);
            P66(:,:,k+2) = var_P_V*eye(3,3);
            P67(:,:,k+2) = var_P_V*eye(3,3);
            P68(:,:,k+2) = var_P_V*eye(3,3);
            P69(:,:,k+2) = var_P_V*eye(3,3);
            P70(:,:,k+2) = var_P_V*eye(3,3);
            P71(:,:,k+2) = var_P_V*eye(3,3);
            P72(:,:,k+2) = var_P_V*eye(3,3);
            P73(:,:,k+2) = var_P_V*eye(3,3);
            P74(:,:,k+2) = var_P_V*eye(3,3);
            P75(:,:,k+2) = var_P_V*eye(3,3);
            P76(:,:,k+2) = var_P_V*eye(3,3);
            P77(:,:,k+2) = var_P_V*eye(3,3);
            P78(:,:,k+2) = var_P_V*eye(3,3);
            P79(:,:,k+2) = var_P_V*eye(3,3);
            P80(:,:,k+2) = var_P_V*eye(3,3);
            P81(:,:,k+2) = var_P_V*eye(3,3);
            P82(:,:,k+2) = var_P_V*eye(3,3);
            P83(:,:,k+2) = var_P_V*eye(3,3);
            P84(:,:,k+2) = var_P_V*eye(3,3);
            P85(:,:,k+2) = var_P_V*eye(3,3);
            P86(:,:,k+2) = var_P_V*eye(3,3);
            P87(:,:,k+2) = var_P_V*eye(3,3);
            P88(:,:,k+2) = var_P_V*eye(3,3);
            P89(:,:,k+2) = var_P_V*eye(3,3);
            P90(:,:,k+2) = var_P_V*eye(3,3);
            P91(:,:,k+2) = var_P_V*eye(3,3);
            P92(:,:,k+2) = var_P_V*eye(3,3);
            P93(:,:,k+2) = var_P_V*eye(3,3);
            P94(:,:,k+2) = var_P_V*eye(3,3);
            P95(:,:,k+2) = var_P_V*eye(3,3);
            P96(:,:,k+2) = var_P_V*eye(3,3);
            P97(:,:,k+2) = var_P_V*eye(3,3);
            P98(:,:,k+2) = var_P_V*eye(3,3);
            P99(:,:,k+2) = var_P_V*eye(3,3);
            P100(:,:,k+2) = var_P_V*eye(3,3);
            P101(:,:,k+2) = var_P_V*eye(3,3);
            P102(:,:,k+2) = var_P_V*eye(3,3);
            P103(:,:,k+2) = var_P_V*eye(3,3);
            P104(:,:,k+2) = var_P_V*eye(3,3);
            P105(:,:,k+2) = var_P_V*eye(3,3);
        end
    end


end

y_q = y;

clear x y

nu=1;
eita =1;
miu =1;
rou=50;
lamda =0.1;


%y(1:nu+1)=0;u(1:nu)=0;du(1:nu,1:nu)=0;
y(1)=270;y(2)=270;y(3)=270;
u(1:2)=0;
du(1:2,1:nu)=0;

k = 0:0.02:12;
yd(1:601) = 270+50*(1-exp(-k));

I=eye(nu);


fai(1:2,1) =2;
fai(1:2,2:nu)=0;

for k=3:N-1
    a(k)=1+round(k/500);
    fai(k,1:nu)=fai(k-1,1:nu)+eita*(y(k)-y(k-1)-fai(k-1,1:nu)*du(k-1,1:nu)')*du(k-1,1:nu)/(miu+du(k-1,1:nu)*du(k-1,1:nu)');
    if (fai(k,1)<10^(-5)) || ((du(k-1,1:nu)*du(k-1,1:nu)')^0.5<10^(-5))
        fai(k,1)=0.5;
    end
    if nu==1
        u(k) = u(k-1)+rou*fai(k,1)*(yd(k+1)-y(k))/(lamda+fai(k,1).^2);        
    else
        u(k) = u(k-1)+rou*fai(k,1)*(yd(k+1)-y(k)-fai(k,2:nu)*du(k-1,1:nu-1)')/(lamda+fai(k,1).^2); 
    end
    %model

         y(k+1) = alpha_real(k)*(y(k)+xi*T*(-c0-c1*y(k)-c2*y(k)^2))+beta_real(k)*(xi*T)*u(k)+gamma_real(k)+e(k);

    for i=1:nu
        du(k,i)=u(k-i+1)-u(k-i);
    end
    emax(k+1)=yd(k+1)-y(k+1);
end

y_MFAC = y;
u_MFAC = u;



figure(1);
plot(input_ref,'--','LineWidth',2);hold on;
plot(y_opt,'LineWidth',1);hold on;
plot(y_q,'.-','LineWidth',1);hold on;
plot(y_MFAC,'-','LineWidth',1);hold off;
set(gca,'FontSize',12);
xlabel('k','FontSize',12);
ylabel('y(k)','FontSize',12)
legend('reference trajectory','optimal control','active learning control','model-free adaptive cotrol')
axis([0 600 260 380])

figure(5)
subplot(3,1,1);
plot(input_ref,'--','LineWidth',2);hold on;
plot(y_opt,'LineWidth',1);hold off;
set(gca,'FontSize',12);
xlabel('k','FontSize',12);
ylabel('y(k)','FontSize',12)
legend('reference trajectory','optimal control')
axis([0 600 260 380])
subplot(3,1,2);
plot(input_ref,'--','LineWidth',2);hold on;
plot(y_q,'LineWidth',1);hold off;
set(gca,'FontSize',12);
xlabel('k','FontSize',12);
ylabel('y(k)','FontSize',12)
legend('reference trajectory','active learning control')
axis([0 600 260 380])
subplot(3,1,3);
plot(input_ref,'--','LineWidth',2);hold on;
plot(y_MFAC,'LineWidth',1);hold off;
set(gca,'FontSize',12);
xlabel('k','FontSize',12);
ylabel('y(k)','FontSize',12)
legend('reference trajectory','model-free adaptive cotrol')
axis([0 600 260 380])

figure(6)
subplot(3,1,1);
plot(alpha_real,'LineWidth',2);
xlabel('k','FontSize',12);
ylabel('\alpha(k)','FontSize',12)
axis([0 600 0.85 1.1])
subplot(3,1,2);
plot(beta_real,'LineWidth',2);
xlabel('k','FontSize',12);
ylabel('\beta(k)','FontSize',12)
axis([0 600 0.85 1.2])
subplot(3,1,3);
plot(gamma_real,'LineWidth',2);
xlabel('k','FontSize',12);
ylabel('\gamma(k)','FontSize',12)
axis([0 600 -18 3])

figure(3);
plot(u_opt,'-','LineWidth',1); hold on;
plot(u_q,'-','LineWidth',1); hold on;
plot(u_MFAC,'-','LineWidth',1); hold off;
set(gca,'FontSize',12);
xlabel('k','FontSize',12);
ylabel('u(k)','FontSize',12)
legend('optimal control','active learning control','model-free adaptive cotrol') 

figure(2);
plot(q_1_plot,'+-');hold on;
plot(q_2_plot,'o-');hold on;
plot(q_3_plot,'*-');hold on;
plot(q_4_plot,'.-');hold on;
plot(q_5_plot,'x-');hold on;
plot(q_6_plot,'s-');hold on;
plot(q_7_plot,'d-');hold on;
plot(q_8_plot,'v-');hold on;
plot(q_9_plot,'^-');hold on;
plot(q_10_plot,'<-');hold on;
plot(q_11_plot,'>-');hold on;
plot(q_12_plot,'p-');hold on;
plot(q_13_plot,'h-');hold on;
plot(q_14_plot,'|-');hold on;
plot(q_15_plot);hold on;
plot(q_16_plot,'+-');hold on;
plot(q_17_plot,'o-');hold on;
plot(q_18_plot,'*-');hold on;
plot(q_19_plot,'.-');hold on;
plot(q_20_plot,'x-');hold on;
plot(q_21_plot,'s-');hold on;
plot(q_22_plot,'d-');hold on;
plot(q_23_plot,'v-');hold on;
plot(q_24_plot,'^-');hold on;
plot(q_25_plot,'<-');hold on;
plot(q_26_plot,'>-');hold on;
plot(q_27_plot,'p-');hold on;
plot(q_28_plot,'h-');hold on;
plot(q_29_plot,'|-');hold on;
plot(q_30_plot);hold on;
plot(q_31_plot,'+-');hold on;
plot(q_32_plot,'o-');hold on;
plot(q_33_plot,'*-');hold on;
plot(q_34_plot,'.-');hold on;
plot(q_35_plot,'x-');hold on;
plot(q_36_plot,'s-');hold on;
plot(q_37_plot,'d-');hold on;
plot(q_38_plot,'v-');hold on;
plot(q_39_plot,'^-');hold on;
plot(q_40_plot,'<-');hold on;
plot(q_41_plot,'>-');hold on;
plot(q_42_plot,'p-');hold on;
plot(q_43_plot,'h-');hold on;
plot(q_44_plot,'|-');hold on;
plot(q_45_plot);hold on;
plot(q_46_plot,'+-');hold on;
plot(q_47_plot,'o-');hold on;
plot(q_48_plot,'*-');hold on;
plot(q_49_plot,'.-');hold on;
plot(q_50_plot,'x-');hold on;
plot(q_51_plot,'s-');hold on;
plot(q_52_plot,'d-');hold on;
plot(q_53_plot,'v-');hold on;
plot(q_54_plot,'^-');hold on;
plot(q_55_plot,'<-');hold on;
plot(q_56_plot,'>-');hold on;
plot(q_57_plot,'p-');hold on;
plot(q_58_plot,'h-');hold on;
plot(q_59_plot,'|-');hold on;
plot(q_60_plot);hold on;
plot(q_61_plot,'+-');hold on;
plot(q_62_plot,'o-');hold on;
plot(q_63_plot,'*-');hold on;
plot(q_64_plot,'.-');hold on;
plot(q_65_plot,'x-');hold on;
plot(q_66_plot,'s-');hold on;
plot(q_67_plot,'d-');hold on;
plot(q_68_plot,'v-');hold on;
plot(q_69_plot,'^-');hold on;
plot(q_70_plot,'<-');hold on;
plot(q_71_plot,'>-');hold on;
plot(q_72_plot,'p-');hold on;
plot(q_73_plot,'h-');hold on;
plot(q_74_plot,'|-');hold on;
plot(q_75_plot);hold on;
plot(q_76_plot,'+-');hold on;
plot(q_77_plot,'o-');hold on;
plot(q_78_plot,'*-');hold on;
plot(q_79_plot,'.-');hold on;
plot(q_80_plot,'x-');hold on;
plot(q_81_plot,'s-');hold on;
plot(q_82_plot,'d-');hold on;
plot(q_83_plot,'v-');hold on;
plot(q_84_plot,'^-');hold on;
plot(q_85_plot,'<-');hold on;
plot(q_86_plot,'>-');hold on;
plot(q_87_plot,'p-');hold on;
plot(q_88_plot,'h-');hold on;
plot(q_89_plot,'|-');hold on;
plot(q_90_plot);hold on;
plot(q_91_plot,'+-');hold on;
plot(q_92_plot,'o-');hold on;
plot(q_93_plot,'*-');hold on;
plot(q_94_plot,'.-');hold on;
plot(q_95_plot,'x-');hold on;
plot(q_96_plot,'s-');hold on;
plot(q_97_plot,'d-');hold on;
plot(q_98_plot,'v-');hold on;
plot(q_99_plot,'^-');hold on;
plot(q_100_plot,'<-');hold on;
plot(q_101_plot,'>-');hold on;
plot(q_102_plot,'p-');hold on;
plot(q_103_plot,'h-');hold on;
plot(q_104_plot,'|-');hold on;
plot(q_105_plot);hold off;

legend('\pi(\theta_1)','\pi(\theta_2)','\pi(\theta_3)','\pi(\theta_4)','\pi(\theta_5)',...
    '\pi(\theta_6)','\pi(\theta_7)','\pi(\theta_8)','\pi(\theta_9)','\pi(\theta_{10})',...
    '\pi(\theta_{11})','\pi(\theta_{12})','\pi(\theta_{13})','\pi(\theta_{14})','\pi(\theta_{15})',...
    '\pi(\theta_{16})','\pi(\theta_{17})','\pi(\theta_{18})','\pi(\theta_{19})','\pi(\theta_{20})',...
    '\pi(\theta_{21})','\pi(\theta_{22})','\pi(\theta_{23})','\pi(\theta_{24})','\pi(\theta_{25})',...
    '\pi(\theta_{26})','\pi(\theta_{27})','\pi(\theta_{28})','\pi(\theta_{29})','\pi(\theta_{30})',...
    '\pi(\theta_{31})','\pi(\theta_{32})','\pi(\theta_{33})','\pi(\theta_{34})','\pi(\theta_{35})',...
    '\pi(\theta_{36})','\pi(\theta_{37})','\pi(\theta_{38})','\pi(\theta_{39})','\pi(\theta_{40})',...
    '\pi(\theta_{41})','\pi(\theta_{42})','\pi(\theta_{43})','\pi(\theta_{44})','\pi(\theta_{45})',...
    '\pi(\theta_{46})','\pi(\theta_{47})','\pi(\theta_{48})','\pi(\theta_{49})','\pi(\theta_{50})',...
    '\pi(\theta_{51})','\pi(\theta_{52})','\pi(\theta_{53})','\pi(\theta_{54})','\pi(\theta_{55})',...
    '\pi(\theta_{56})','\pi(\theta_{57})','\pi(\theta_{58})','\pi(\theta_{59})','\pi(\theta_{60})',...
    '\pi(\theta_{61})','\pi(\theta_{62})','\pi(\theta_{63})','\pi(\theta_{64})','\pi(\theta_{65})',...
    '\pi(\theta_{66})','\pi(\theta_{67})','\pi(\theta_{68})','\pi(\theta_{69})','\pi(\theta_{70})',...
    '\pi(\theta_{71})','\pi(\theta_{72})','\pi(\theta_{73})','\pi(\theta_{74})','\pi(\theta_{75})',...
    '\pi(\theta_{76})','\pi(\theta_{77})','\pi(\theta_{78})','\pi(\theta_{79})','\pi(\theta_{80})',...
    '\pi(\theta_{81})','\pi(\theta_{82})','\pi(\theta_{83})','\pi(\theta_{84})','\pi(\theta_{85})',...
    '\pi(\theta_{86})','\pi(\theta_{87})','\pi(\theta_{88})','\pi(\theta_{89})','\pi(\theta_{90})',...
    '\pi(\theta_{91})','\pi(\theta_{92})','\pi(\theta_{93})','\pi(\theta_{94})','\pi(\theta_{95})',...
    '\pi(\theta_{96})','\pi(\theta_{97})','\pi(\theta_{98})','\pi(\theta_{99})','\pi(\theta_{100})');
axis([0 600 -0.1 1.4])
set(gca,'FontSize',12);
xlabel('k','FontSize',12);
ylabel('Bayesian posterior probability','FontSize',12)


xx=1:350;
yy=1:350;
figure(7);
plot(xx,yy);hold on;
plot(y_q(1:99),y_hat_q(1:99),'*');hold on;
plot(y_q(100:249),y_hat_q(100:249),'o');hold on;
plot(y_q(250:349),y_hat_q(250:349),'<');hold on;
plot(y_q(350:499),y_hat_q(350:499),'h');hold on;
plot(y_q(500:599),y_hat_q(500:599),'s');hold off;
axis([270 350 270 350])

axes('position', [0.3 0.3 0.1 0.1]);
box on
plot(xx,yy);hold on;
refline([1 1]);
refline([1 -1]);
plot(y_q(1:99),y_hat_q(1:99),'*');hold on;
plot(y_q(100:249),y_hat_q(100:249),'o');hold on;
plot(y_q(250:349),y_hat_q(250:349),'<');hold on;
plot(y_q(350:499),y_hat_q(350:499),'h');hold on;
plot(y_q(500:599),y_hat_q(500:599),'s');hold off;
axis([270 350 270 350])









