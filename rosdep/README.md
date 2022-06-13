# Using rosdep to handle catkin dependencies
Every catkin package declares it dependencies. Other catkin package dependencies get resolved from within the workspace (or parent workspaces). System dependencies can be checked and installed using rosdep.

Most system libraries are already supported by rosdep ([base](https://raw.githubusercontent.com/ros/rosdistro/master/rosdep/base.yaml), [python](https://raw.githubusercontent.com/ros/rosdistro/master/rosdep/python.yaml)).
System dependencies that are not on one of these lists have to be added, e.g. LCM.

To do this, run
```./update-rosdep.bash```
which will indeed call:
```sudo sh -c 'echo "yaml http://terminator.robots.inf.ed.ac.uk/apt/rosdep.yaml" > /etc/ros/rosdep/sources.list.d/30-oh.list'```
This will create a config file to help rosdep locate libraries hosted on local servers.
Don't forget to then run:
```rosdep update```

Either of this should be able to check/install dependencies for a catkin workspace by running:
```rosdep check --from-paths src/ -i -y```
or
```rosdep install --from-paths src/ -i -y```
from the root of the workspace.

If you get the warning
```
WARNING: The following packages cannot be authenticated!
  liblcm
```
you will need to enforce the installation manually by
```
sudo -H apt-get install -y liblcm --force-yes
```
