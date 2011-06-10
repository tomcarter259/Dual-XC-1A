#include <print.h>
#include "pair.h"

void one( chanend outChan, chanend andBackChan )
{
  int a=23;
  printstr("Message sent\n");
  outChan <: a;
  andBackChan :> a;
  printstr("Reply received\n");
}

void two( chanend outChan, chanend andBackChan )
{
  int a;
  outChan :> a;
  printstr("Message received\n");
  printstr("Reply sent\n");
  andBackChan <: a;
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

