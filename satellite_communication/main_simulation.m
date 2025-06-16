clc; clear; close all;

N = 1e5;                     % Number of bits
data = randi([0 1], 1, N);   % Random binary data

modulated = bpsk_modulate(data);               % BPSK Modulation
SNR_dB = 0:1:20;                               % Range of SNRs in dB
ber = zeros(size(SNR_dB));

for i = 1:length(SNR_dB)
    noisy_signal = awgn_channel(modulated, SNR_dB(i));
    received = bpsk_demodulate(noisy_signal);
    ber(i) = sum(data ~= received) / N;       % Bit Error Rate
end

% Plotting
figure;
semilogy(SNR_dB, ber, '-o','LineWidth', 2);
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
title('BER vs SNR for BPSK over AWGN');
grid on;
