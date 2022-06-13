clear all
clc

g0 = 9.81;
R = 6.4e+6;
h = 0.1:1000:16500;
p0 = 1e+5;

for i=1:length(h)
    y = 0:0.01:h(i);
    g1 = (g0*R^2)./(R+y).^2;
    f = 1./(R+y).^2;
    p_ratio_num(i) = (1-((g0*R^2)*(0.4/1.4)/(288.87*288))*trapz(y,f)).^(1.4/0.4);
end

p_ratio_simpl = (1-g0*((0.4/1.4)/(288.7*288)).*(h)).^(1.4/0.4);
p_act = load('air_prop.txt');

figure(1)
plot(h/1000,p_ratio_simpl,h/1000,p_ratio_num,'*',p_act(:,1),p_act(:,3)/p_act(1,3),'o')
grid on
xlabel('Altitude, km');
ylabel('Pressure ratio');
legend('Simplified Numerical','Exact Numerical','Actual');
title('Pressure ratio in Troposphere');
saveas(figure(1),'plot_press.png');

figure(2)
plot(h/1000,p_ratio_simpl.^(0.4/1.4),h/1000,p_ratio_num.^(0.4/1.4),'*',p_act(:,1),p_act(:,2)/p_act(1,2),'o')
grid on
xlabel('Altitude, km');
ylabel('Temperature ratio');
legend('Simplified Numerical','Exact Numerical','Actual');
title('Temperature ratio in Troposphere');
saveas(figure(2),'plot_temp.png');

figure(3)
plot(h/1000,p_ratio_simpl.^(1/1.4),h/1000,p_ratio_num.^(1/1.4),'*',p_act(:,1),p_act(:,4)/p_act(1,4),'o')
grid on
xlabel('Altitude, km');
ylabel('Density ratio');
legend('Simplified Numerical','Exact Numerical','Actual');
title('Density ratio in Troposphere');
saveas(figure(3),'plot_dens.png');

