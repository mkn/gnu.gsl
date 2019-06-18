
#include <iostream>
#include <vector>

#include "gsl/gsl_randist.h"
#include <gsl/gsl_math.h>
#include <gsl/gsl_rng.h>

#include "kul/log.hpp"

// void
// gsl_ran_multinomial (const gsl_rng * r, const size_t K,
//                      const unsigned int N, const double p[], unsigned int n[]);

int main(){
  KLOG(INF);
  double p[6]{1, 2, 3, 4, 5, 6};
  KLOG(INF);
  unsigned int n[6];

  KLOG(INF);

  const gsl_rng_type * T = gsl_rng_default; // Generator setup

  KLOG(INF);

  gsl_rng_env_setup();

  KLOG(INF);
  gsl_rng * r = gsl_rng_alloc (T);
  KLOG(INF);
  gsl_rng_set(r, 13333337);
  KLOG(INF);

  gsl_ran_multinomial(r, 10, 6, p, n);
  KLOG(INF);
  for(size_t i = 0l; i < 6; i++)
    std::cout << __FILE__ << " " << __LINE__ << " " << n[i] << std::endl;
  KLOG(INF);
  gsl_rng_free (r);
  KLOG(INF);

  return 0;
}
