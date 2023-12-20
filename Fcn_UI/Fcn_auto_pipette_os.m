function state_flag = Fcn_auto_pipette_os(dev_handle,input, output)
zero_idx = input==input(1);
error = sum(output(zero_idx))/sum(double(zero_idx)); % err = 0.1 offset = -1.92e-3
if abs(error)>1e-3
    cur_os = MC_read_pipette_os(dev_handle); %
    P = (-1.92e-3)/0.1/2;
    os_update = cur_os + error * P;
    MC_set_pipette_os(dev_handle, os_update);
    state_flag = true;
else 
    state_flag = false;
end
end