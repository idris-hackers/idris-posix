#include <signal.h>

inline struct sigaction * install_handler (int signum, void (*handler)(int))
{
  int rc;
  struct sigaction *act;
  act = calloc (1, sizeof (struct sigaction));
  if (act == NULL)
    return act;
  act->sa_handler = handler;
  rc = sigaction (signum, act, NULL);
  if (rc == 0)
    return act;
  return NULL;  
}
