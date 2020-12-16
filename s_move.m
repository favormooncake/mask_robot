function  vs=s_move(s)

j_max=0.2;
a_max=0.25;
v_max=0.8;

double s1; 
double s2; 
double a_max_sub; 
double v_max_sub;

vs=[];
s1=(v_max^2*j_max+v_max*a_max^2)/(2*a_max*j_max);
s2=(a_max^3)/(j_max^2);

if(s>=s1*2)
        t1=a_max/j_max;
        t2=(v_max-a_max^2/j_max)/a_max;
        t3=t1;       
        t5=t3;
        t6=t2;
        t7=t1;       
        t4=(s-s1*2)/v_max;
        for t=0:0.01:(t1+t2+t3+t4+t5+t6+t7+1)
            if(t<=t1)
                v=j_max*t^2/2;
            elseif(t>t1 && t<=(t1+t2) )
                v=j_max*t1^2/2+a_max*(t-t1);
            elseif(t>(t1+t2) && t<=(t1+t2+t3) )
                v=v_max-j_max*(t1+t2+t3-t)^2/2;
            elseif(t>(t1+t2+t3) && t<=(t1+t2+t3+t4) )  
                v=v_max;
            elseif(t>(t1+t2+t3+t4) && t<=(t1+t2+t3+t4+t5) )
                v=v_max-j_max*(t-(t1+t2+t3+t4) )^2/2;
            elseif(t>(t1+t2+t3+t4+t5) && t<=(t1+t2+t3+t4+t5+t6) )
                v=v_max-j_max*t5^2/2-a_max*(t-(t1+t2+t3+t4+t5));
            elseif(t>(t1+t2+t3+t4+t5+t6) && t<=(t1+t2+t3+t4+t5+t6+t7) )  
                v=j_max*((t1+t2+t3+t4+t5+t6+t7)-t)^2/2;
            else
                v=0;         
            end
            vs=[vs;v];
        end
elseif(s>=s2*2 && s<s1*2)   
        v_max_sub=(-a_max^2+sqrt(a_max^4+4*j_max^2*s*a_max))/(2*j_max);        
        t1=a_max/j_max;
        t2=(v_max_sub-a_max^2/j_max)/a_max;
        t3=t1;       
        t5=t3;
        t6=t2;
        t7=t1;       
        t4=0;
        for t=0:0.01:(t1+t2+t3+t4+t5+t6+t7+1)
            if(t<=t1)
                v=j_max*t^2/2;
            elseif(t>t1 && t<=(t1+t2) )
                v=j_max*t1^2/2+a_max*(t-t1);
            elseif(t>(t1+t2) && t<=(t1+t2+t3) )
                v=v_max_sub-j_max*(t1+t2+t3-t)^2/2;
            elseif(t>(t1+t2+t3+t4) && t<=(t1+t2+t3+t4+t5) )
                v=v_max_sub-j_max*(t-(t1+t2+t3+t4) )^2/2;
            elseif(t>(t1+t2+t3+t4+t5) && t<=(t1+t2+t3+t4+t5+t6) )
                v=v_max_sub-j_max*t5^2/2-a_max*(t-(t1+t2+t3+t4+t5));
            elseif(t>(t1+t2+t3+t4+t5+t6) && t<=(t1+t2+t3+t4+t5+t6+t7) )  
                v=j_max*((t1+t2+t3+t4+t5+t6+t7)-t)^2/2;
            else
                v=0;
            end
            vs=[vs;v];
       end
elseif(s<s2*2)
        a_max_sub = (s*j_max^2/2)^(1/3);    
        t1=a_max_sub/j_max;
        t2= 0;
        t3=t1;        
        t5=t3;
        t6=0;
        t7=t1;        
        t4=0;        
        v_max_sub=j_max*t1^2;
        for t=0:0.01:(t1+t2+t3+t4+t5+t6+t7+1)
            if(t<=t1)
                v=j_max*t^2/2;
            elseif(t>(t1+t2) && t<=(t1+t2+t3) )
                v=v_max_sub-j_max*(t1+t2+t3-t)^2/2;
            elseif(t>(t1+t2+t3+t4) && t<=(t1+t2+t3+t4+t5) )
                v=v_max_sub-j_max*(t-(t1+t2+t3+t4) )^2/2;
            elseif(t>(t1+t2+t3+t4+t5+t6) && t<=(t1+t2+t3+t4+t5+t6+t7) )  
                v=j_max*((t1+t2+t3+t4+t5+t6+t7)-t)^2/2;
            else
                v=0;
            end
            vs=[vs;v];
       end
end
end



