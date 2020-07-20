
Overall structure
-----------------
main: fast/driver.f90

Refactored Thermal_mesh module has data structures that mirror the design of FD.

Control Constructs
------------------

* CASE statements: see src/vars/Grid_Cylindrical_implementation.f90, line 537
* DO CONCURRENT: see fast/Conduction_pde_implementation.f90, line 936 -- setting up source term, e.g., qoxr = heat source in oxidation layer on right edge
* WHILE: fast/Timestep_implementation.f90, line 104 -- main time step loop

Code Structure
--------------
* MODULE/SUBMODULE:

    Module vars/Thermal_Mesh.f90
    |
    |  submodules
    |---------------> Thermal_Mesh_implementation.f90     <--- general
                      Grid_Cartesian_implementation.f90    |
                      Grid_Cylindrical_implementation.f90  | <-- geometry-specific
                      Grid_Spherical_implementation.f90    |
* BLOCK: Timestep_implementation.f90, line 373

### Overloading interfaces
* (Overloading) non-type-bound generic interface:
  - INTERFACE cos in vars/Thermal_Mesh.f90, line 44 applies cosine to a derived type
  - non-type-bound OPERATOR in Math/Funtions defines OPERATOR(.avg.)
* Type-bound generic interfaces
  - vars/Thermal_Mesh.f90 defines ASSIGNMENT(=), OPERATOR(+)
  - Math/Interpolation.f90 READ(FORMATTED) reads a derived type in a namelist
