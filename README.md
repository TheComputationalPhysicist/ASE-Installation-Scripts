# ASE-Installation-Scripts
This repository provides scripts to install and remove the Atomic Simulation Environment (ASE) version 3.23 on Ubuntu 18.04, along with Python 3.9 and all necessary dependencies (NumPy, SciPy, and Matplotlib). These scripts automate the process, ensuring you have a clean and effective setup for ASE, widely used in computational materials science and physics simulations.

**Contents:**

**ase_installation.sh:** A comprehensive script that installs Python 3.9 (if not already installed), sets up a virtual environment, installs ASE, and configures the PATH.

**remove_ase.sh:** A cleanup script that removes the ASE virtual environment and optionally removes Python 3.9 installed from source.

Installation Steps

**bash ase_installation.sh
**The script will check for Python 3.9, install it if needed, and set up ASE in a virtual environment.
After completion, ASE commands like ase gui will be available globally.

Removing ASE: To remove ASE and its environment, run:
**bash remove_ase_env.sh
**This script will delete the virtual environment and optional Python 3.9 components, restoring your system to its pre-installation state.

Requirements
Ubuntu 18.04
Python 3.9 (installed by the script if not present)
Additional Packages: NumPy, SciPy, Matplotlib (installed in the virtual environment)
Learn More About ASE and Computational Physics
For a detailed guide and walkthrough, check out the corresponding video on my YouTube channel The Computational Physicist:

[ASE 3.23 Installation and Removal on Ubuntu](YouTube Link)
Also, explore more computational physics tutorials, including:

SIESTA Installation for parallel computing
Band Structure & DOS Plotting using Xmgrace
Custom Gnuplot Scripts for visualizing high-symmetry points and electronic structures
License
This repository is licensed under the MIT License.
