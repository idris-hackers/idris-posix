#include <signal.h>

inline int install_handler (int signum, void (*handler)(int))
{
  int rc;
  struct sigaction *act;
  act = calloc (1, sizeof (struct sigaction));
  if (act == NULL)
    return -1;
  act->sa_handler = handler;
  rc = sigaction (signum, act, NULL);
  free (act);
  return rc;  
}
