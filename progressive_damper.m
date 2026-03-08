function C = fcn(Zrel, Zreldot)

%%%%%%%%

Cc = 20; % compression damping
Cr = 50; % rebound damping
k = 5;   % progressive stiffness factor

%%%%%

% Select damping depending on suspension velocity

if Zreldot > 0

    C_base = Cc;

else
   
    C_base = Cr;

end

%%%%%%Progressive Stroke Effect

C = C_base + k*abs(Zrel);

end
