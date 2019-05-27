/*
Hello World

  To compile and run this program:

  1. Save the code in a file with name "hello_world.cpp"
  2. Execute the following command in a terminal window:

    $ g++ -o /tmp/hello_world hello_world.cpp

      ..which invokes the Gnu C++ compiler, asking it to output
      an executable file into /tmp with name "hello_world".

  3. Execute the following command in a terminal window:

    $ /tmp/hello_world

      ..which will then run the program, causing the message
      "Hello World!" to be written to the terminal.
*/

#include <iostream>

int main()
{
   std::cout << "Hello World!" << std::endl;

   return 0;
}