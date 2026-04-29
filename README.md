# Tracking-Project
MATLAB: Creates an object flying in a random path. Creates another object that tracks and intercepts the first object
This MATLAB simulation models a 2D pursuit scenario in which a guided projectile autonomously tracks and intercepts a randomly moving aircraft (plane). The projectile continuously recalculates its heading angle to close the distance to the target each time step, while the target moves unpredictably. The simulation terminates when the two objects converge within a tolerance of 0.001 units, and the full trajectory of both objects is plotted.
System Setup
Projectile start
(-50, -50)

Plane start
(0, 0)

Convergence tolerance
1×10⁻³ units

Projectile speed
1 unit/step

The random motion is modeled by;
At each time step the plane moves by a random displacement sampled from a uniform distribution:
ΔX ∈ [−1, 2]  ·  randomX = 3·rand − 1
ΔY ∈ [−1, 1]  ·  randomY = 2·rand − 1

Guidance algorithm
The projectile implements a proportional pursuit (pure pursuit) law. Each step, the bearing angle θ to the current plane position is computed, and the projectile advances one unit along that bearing:
θ = atan2d(ΔY, ΔX)
X_proj ← X_proj + cos(θ)
Y_proj ← Y_proj + sin(θ)

Termination condition
The while loop continues until both the X and Y separation fall below 1×10⁻³, ensuring true two-dimensional convergence rather than just one axis closing. Because the plane moves randomly, the intercept time varies with each run.

OUTPUT
outputs two overlaid 2D line plots,  one for the projectile path, one for the plane path — showing how the pursuit unfolds over time.

//VERSION 2 UPDATES//
Updates the plot live with the Draw Now function:
Creates a plot before the while loop with the initial starting condition
adds a blue and red dot, respectively, to know where the tracker and projectile are
calls drawnow at the end of the while loop to update the plot

//VERSION 3 UPDATES//
Makes it track and update in 3d:
creates a Z position for the projectile and the tracker
randomizes Z coordinate with
ΔZ ∈ [−1, 1]  ·  randomZ = 2·rand − 1
uses the plot3 function to plot the data in 3d
calculates where to go by creating a unit vector from the tracker to the projectile ex:
UvecX=(planeXPOS-projectileXPOS)/magnitude;
Updates the position by going each direction in the unit vector

adds the coordnites that the target gets intercepted at









