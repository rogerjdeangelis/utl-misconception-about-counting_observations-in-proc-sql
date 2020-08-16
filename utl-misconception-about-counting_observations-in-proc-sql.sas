Misconception about count(*) in proc sql to get record count                                         
                                                                                                     
It executes instataneously                                                                           
                                                                                                     
github                                                                                               
https://tinyurl.com/y4cn64uy                                                                         
https://github.com/rogerjdeangelis/utl-misconception-about-counting_observations-in-proc-sql         
                                                                                                     
Below I use 'proc sql; count(*)' to count the observations in a 70gb table.                          
The program executes instataneously(0.08 seconds).                                                   
Also does not count 'deleted' obs.                                                                   
                                                                                                     
                                                                                                     
Input is a 7gb datasets                                                                              
                                                                                                     
/*                   _                                                                               
(_)_ __  _ __  _   _| |_                                                                             
| | `_ \| `_ \| | | | __|                                                                            
| | | | | |_) | |_| | |_                                                                             
|_|_| |_| .__/ \__,_|\__|                                                                            
        |_|                                                                                          
*/                                                                                                   
                                                                                                     
data have;                                                                                           
                                                                                                     
  array chrs[38] $10 c1-c&vars (&vars*"A234567890");                                                 
                                                                                                     
  do rec=1 to 180000000;                                                                             
     output;                                                                                         
  end;                                                                                               
                                                                                                     
run;quit;                                                                                            
                                                                                                     
                                                                                                     
WORK.WANT                                                                                            
                                                                                                     
Filename                    f:\wrk\_TD4740_T7610_\have.sas7bdat                                      
                                                                                                     
Observations                180,000,000                                                              
Variables                   39                                                                       
File Size                   66GB                                                                     
                                                                                                     
File Size (bytes)           70,637,715,456                                                           
                                                                                                     
/*           _               _                                                                       
  ___  _   _| |_ _ __  _   _| |_                                                                     
 / _ \| | | | __| `_ \| | | | __|                                                                    
| (_) | |_| | |_| |_) | |_| | |_                                                                     
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                    
                |_|                                                                                  
*/                                                                                                   
                                                                                                     
70gb table has 180,000,000 observations                                                              
                                                                                                     
NOTE: PROCEDURE SQL used (Total process time):                                                       
      real time           0.08 seconds                                                               
      user cpu time       0.01 seconds                                                               
      system cpu time     0.06 seconds                                                               
                                                                                                     
/*                                                                                                   
 _ __  _ __ ___   ___ ___  ___ ___                                                                   
| `_ \| `__/ _ \ / __/ _ \/ __/ __|                                                                  
| |_) | | | (_) | (_|  __/\__ \__ \                                                                  
| .__/|_|  \___/ \___\___||___/___/                                                                  
|_|                                                                                                  
*/                                                                                                   
                                                                                                     
proc sql;                                                                                            
  select count(*) into :nobs from have                                                               
;quit;                                                                                               
                                                                                                     
%put 70gb table has %sysfunc(putn(&nobs,comma11.)) observations;                                     
                                                                                                     
                                                                                                     
