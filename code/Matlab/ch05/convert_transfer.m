%% 模拟滤波器设计
% 巴特沃斯滤波器
fc = 2000; % 截至频率
fs = 5000; % 模拟采样频率
wp = 2 * pi * fc; % 截至频率
ws = 2 * pi * fs; % 阻带起始频率
rp = 3; % 截至阻带增益
rs = 15; % 阻带起始增益
n1 = 3; % 巴特沃斯滤波器阶数
wn1 = wp; % 巴特沃斯滤波器截至频率
[b1, a1] = butter(n1, wn1 / (ws / 2), 's'); % 巴特沃斯滤波器
[h1, w1] = freqs(b1, a1); % 巴特沃斯滤波器频域函数
[n2, wn2] = buttord(wp, ws, rp, rs); % 巴特沃斯滤波器的设计参数求解
[b2, a2] = butter(n2, wn2 / (ws / 2), 's'); % 巴特沃斯滤波器
[h2, w2] = freqs(b2, a2); % 巴特沃斯滤波器频域函数
f1 = w1 / (2 * pi); % 巴特沃斯滤波器频率
f2 = w2 / (2 * pi); % 巴特沃斯滤波器频率
amp_dB1 = 20 * log10(abs(h1)); % 巴特沃斯滤波器频域函数的振幅
amp_dB2 = 20 * log10(abs(h2)); % 巴特沃斯滤波器频域函数的振幅
plot(f1, amp_dB1, f2, amp_dB2, '--'); % 巴特沃斯滤波器频域函数的振幅