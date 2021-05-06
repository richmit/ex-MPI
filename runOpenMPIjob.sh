#!/bin/sh
#
#  Author:   Mitch Richling<https://www.mitchr.me/>
#  IP:       Copyright 2006 by Mitch Richling.  All rights reserved.
#  Key word: OpenMPI mpi run mpirun
#  Notes:    This simple little script will fire off 10 copies of
#            the program given on the command line -- only works
#            with OpenMPI...

# Note the host file is required to tell OpenMPI we only have 1 CPU.
# Otherwise, agressive mode will be used and all CPU will be slurped
# up on the local node...

# Create the file 'hostnames' with the local host in it with some CPUs
# The larger the count, the more MPI processes by default.
echo 'localhost slots=1' > hostnames

# Start it up...
mpirun -np 10 --hostfile hostnames $1

# Clean up our host file too.
rm -f hostnames
