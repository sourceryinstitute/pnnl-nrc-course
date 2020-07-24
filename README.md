Fortran 2018: Basic Programming and Advanced Paradigms
======================================================

Directories
-----------

* [Day 1](./src/day-1)
* [Day 2](./src/day-2)
* [Day 3](./src/day-3)
* [Day 4](./src/day-4)


Useful Notes
------------

### Virtual Machine
A new virtual machine is available at [Sourcery Institute](http://www.sourceryinstitute.org/store) with 
  - [GCC] 10.1.0 in the PATH
  - [OpenCoarrays] 2.9.1
  - [FORD] fixed
  - [Geany] integrated development environment (IDE) installed

If you're using the original virtual machine downloaded before 7/20/2020,
you can install Geany by typing the following command in a terminal window
```bash
sudo apt install geany
```
and enter your account password.  If you're using the virtual machine guest
account and haven't changed the password, then the password is "U-Guest-It"
without quotes.

Fixing FORD in the original virtual machine requires more work so it's 
probably best to install the new virtual machine to run FORD.

### Git 
There are many complex and sophisticated git workflows that are worth reading
about and taking time to digest.  Several useful ones are described on
Atlassian's [Comparing Workflows] resource.  With any of these workflows,
my recommended "inner loop" that one is always using, even in the context of
the others, is the [Gitflow workflow].

[GCC]: https://gcc.gnu.org
[OpenCoarrays]: https://github.com/sourceryinstitute/opencoarrays
[FORD]: https://github.com/Fortran-FOSS-Programmers/ford 
[Geany]: https://www.geany.org/ 
[Comparing Workflows]: https://www.atlassian.com/git/tutorials/comparing-workflows
[Gitflow workflow]: https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow
