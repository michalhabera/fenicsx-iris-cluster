#!/bin/bash
source env-build-fenics.sh

export PETSC_DIR=${PREFIX}
export SLEPC_DIR=${PREFIX}

PETSC4PY_VERSION=3.13.0

python3 -m pip install --user virtualenv virtualenvwrapper

source $HOME/.local/bin/virtualenvwrapper.sh
mkvirtualenv --no-site-packages --python=python3 fenics-${TAG}
workon fenics-${TAG}

python3 -m pip install --no-cache-dir mpi4py numba
python3 -m pip install --no-cache-dir petsc4py==${PETSC4PY_VERSION}
python3 -m pip install --no-cache-dir cffi
export HDF5_MPI="ON" && export CC=mpicc && python3 -m pip install --no-cache-dir --no-binary=h5py h5py meshio
