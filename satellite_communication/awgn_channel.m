function noisy_signal = awgn_channel(signal, SNR_dB)
    SNR = 10^(SNR_dB/10);
    noise_power = 1/SNR;
    noise = sqrt(noise_power/2) * randn(size(signal));
    noisy_signal = signal + noise;
end
