# Creating a new  Layer

It is suggested to create a layer when creating or modifying any metadata file (recipe,
configuration file or class). The main reason is simple: modularity. Follow  these
steps

1. To have access to Yocto scripts, setup the enviroment from the BASE folder

~~~~{.bash}
fsl-community-bsp $ . setup-environment build
~~~~

2. Move to the place you want to create your layer and choose a name (e.g. `fsl-custom`) 

~~~~{.bash}
sources $ yocto-layer create fsl-custom
# Answer the questions. Make sure the priority is set correctly (higher numbers,
# higher priorities). Set the priority equal to the lowest already present, except
# when you have introduce a new recipe with the same name as other and want to shadow
# the original one.
~~~~

3. Add any metadata contect. Suggestion: Version the layer with Git and upload your local git
repo to a server

4. Edit and add the layer to the `build/conf/bblayers.conf` file

5. To verify that your layer is *seen* by BitBake, run the following command under the
BUILD folder

~~~~{.bash}
build $ bitbake-layers show-layers
~~~~
