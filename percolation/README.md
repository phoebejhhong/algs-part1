# Percolation
http://coursera.cs.princeton.edu/algs4/assignments/percolation.html
* Write a program to estimate the value of the percolation threshold via Monte Carlo simulation.


### Percolation
* Given a composite systems comprised of randomly distributed insulating and metallic materials: what fraction of the materials need to be metallic so that the composite system is an electrical conductor? Given a porous landscape with water on the surface (or oil below), under what conditions will the water be able to drain through to the bottom (or the oil to gush through to the surface)? Scientists have defined an abstract process known as percolation to model such situations.

### The Problem
* The problem. In a famous scientific problem, researchers are interested in the following question: if sites are independently set to be open with probability p (and therefore blocked with probability 1 − p), what is the probability that the system percolates? When p equals 0, the system does not percolate; when p equals 1, the system percolates. The plots below show the site vacancy probability p versus the percolation probability for 20-by-20 random grid (left) and 100-by-100 random grid (right).

### Monte Carlo simulation
* To estimate the percolation threshold, consider the following computational experiment:

 * Initialize all sites to be blocked.
 * Repeat the following until the system percolates:
    * Choose a site (row i, column j) uniformly at random among all blocked sites.
    * Open the site (row i, column j).
 * The fraction of sites that are opened when the system percolates provides an estimate of the percolation threshold.
