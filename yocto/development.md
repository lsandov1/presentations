# Creating a new (Board Specific Package) Layer

1. Check existing [layers](http://layers.openembedded.org/layerindex/layers/)
2. Create a folder (e.g. `meta-mybsp`)
3. Create a layer configuration folder (e.g. `mkdir meta-mybsp/conf`) and inside
create a `layer.conf`, like the previous one
4. Add content (machines, .bb and .bbapend)
5. Add the layer to the `build/conf/bblayers.conf` file
