function modulated = bpsk_modulate(data)
    modulated = 2*data - 1;  % Map 0 → -1, 1 → +1
end
