# Installation of GDAL in a Clean Conda Environment

he attempt to install gdal by calling `conda install -c conda-forge gdal` in the base environment of conda leads often to conflicts and is refused. But if this installation works for you do not need to create another environment and coud stop reading.

Environments are very useful and highly recommended anyway to have full control of kernel and package versions. Some software development projects require the combination of packages with dedicated version numbers. A virtual environment provides a fully controlled and independent sandbox of installed components.

The following steps explain how to set up a new conda environment and to install software into it. It is demonstrated how **Jupyter-Lab** can be started in this environment. Environment setup as well as software installation can be performed with command line or with the Anaconda Navigator.

Please consult the very useful conda cheat sheet:<br>
https://kapeli.com/cheat_sheets/Conda.docset/Contents/Resources/Documents/index

## Create a New Conda Environment

On Windows: Open either an Anaconda Prompt or a Powershell Prompt (Start -> Anaconda3 -> Anaconda Powershell Prompt). On other operating systems open a terminal. On the command line prompt you should see an indicator which Python environment is currently active, e.g. `(base) PS C:\Users\me`

The token `(base)` shows the active environment.

```bash
conda info --envs

conda create --name geo

conda activate geo


```






## Start Jupyter-Lab and Test the Installation ##

Open an Anaconda terminal, activate the new environment by calling `conda activate geo` on the command line and start Jupyter lab in the browser by calling `jupyter-lab` on the command line. This causes Jupyter-Lab to tun in the new environment where gdal is insatlled. In Jupyter Lab create a new notebook and check, whether you can execute the following command: <br>`from osgeo import osr, ogr, gdal`.