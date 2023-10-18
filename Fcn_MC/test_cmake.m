clear;clc
[handle prop] = MC_init;
MC_select(handle,prop(1));
os = MC_read_pipette_os(handle);
MC_set_pipette_os(handle,-1e-3);