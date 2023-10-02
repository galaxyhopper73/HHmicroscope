function img_out = set_linear_contrast(img_in,lower,upper,out_bit) % out_bit can only be 8 bits or 16 bits
img_in = double(img_in);
img_in(img_in<lower) = lower;
img_in(img_in>upper) = upper;
img_in = img_in-lower;
img_in = img_in/(upper-lower);
if out_bit == 8
    img_out = uint8(img_in*255);
else
    img_out = uint16(img_in*65535);
end
end