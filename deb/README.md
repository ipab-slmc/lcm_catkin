# Compiling LCM as a debian
Just run ```./lcm_deb.bash```.
This will download, compile and package LCM in the current directory. Remember not to commit generated files if you run the file within the source directory!

This debian package is hosted on terminator.robots.inf.ed.ac.uk/apt. Run this command to add it to your sources:
```echo deb http://terminator.robots.inf.ed.ac.uk/apt/ ./ | sudo tee -a /etc/apt/sources.list```

Then to install run:
```sudo apt-get install liblcm```

To update this debian, edit the ```lcm_deb.bash```, compile and package the debian, copy it onto the server and run ```update-apt``` (a script on the terminator server, you'll have to ssh in for this).
