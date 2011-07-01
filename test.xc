#include <platform.h>
#include <xs1.h>
#include <print.h>

out port bled = PORT_BUTTONLED_0;
out port bled1 = PORT_BUTTONLED_1;

void one( chanend outChan, chanend andBackChan )
{
  int a=23;
  printstr("Message sent\n");
  outChan <: a;
  andBackChan :> a;
  printstr("Reply received\n");
  bled <: 0b1111;
  while (1)
    ;
}

void two( chanend outChan, chanend andBackChan )
{
  int a;
  outChan :> a;
  printstr("Message received\n");
  printstr("Reply sent\n");
  andBackChan <: a;
  bled1 <: 0b1111;
  while (1)
    ;
}

int main()
{
  chan outChan, andBackChan;
  par
  {
    on stdcore[0]: one(outChan,andBackChan);
    on stdcore[4]: two(outChan,andBackChan);
  }
  return( 0 );
}

