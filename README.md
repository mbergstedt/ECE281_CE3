ECE281_CE3
==========

Moore and Mealy controllers

####Moore Controller
Controller Shell: The reset is synchronous because it looks at the clock before looking at reset.  After getting it to
work as it was initially written, I changed the coding to work through the next state logic, then the state memory, and
then finally the output logic.  After changing the code, I commented out the original work to keep it with my code so
that I can see it when I look back later, but so that it would not run.

Testbench: With a 10 ns period, the frequency is 100 MHz.  To get a frequency of 50 MHz, use a period of 20 ns.  In the
simulation, the reset is initially set at 1 and then changed to 0.  After one clock cycle, the elevator is set to move
up, after going up for one cycle the elevator is stopped.  Halfway up before being stopped, the output floor changes
from 0001 to 0010, showing the elevator is recognizing the change of floors.  This continues up to the top floor.  When
the elevator reaches the top floor, it is set to move down and not stop.  As the clock cycles, the floor shifts which
one it is reading until it reaches the bottom.
![alt text](https://github.com/mbergstedt/ECE281_CE3/blob/master/Moore_screenshot.JPG?raw=true)

####Mealy Controller
Controller Shell: The next state logic and state memory are the same as for the Moore controller.  Initially I just
copied over the code that combined the two boxes.  Later, I copied the second coding for the Moore controller for more
logical flow.  The output logic for floor was the same as well, but the output logic for next floor was dependent on
the current floor and the direction being traveled.  The next floor must show correctly for going up and down.

Testbench: The testbench for the Mealy controller was the exact same as the one for the Moore controller.  The
difference came in the simulation, where the Mealy controller also displayed the next floor.  Before the controller has
any input and after all input has been taken, the next floor shows floor one, which is also the current floor.  As soon
as there has been input, the next floor switches to showing floor two on the way up.  When the value shown in floor
changes, the value for next floor also changes.  Initially, I didn't account for on top floor and still going up.  This
was fixed so that while it reads the top floor and still going up, it shows next floor as the top floor.  After the
input is changed to go down, next floor displays the floor below until it returns to floor one.
![alt text](https://github.com/mbergstedt/ECE281_CE3/blob/master/Mealy_screenshot.JPG?raw=true)
