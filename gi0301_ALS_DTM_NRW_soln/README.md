# Digital Terrain Model

In this activity we cover the topic "Digital Terrain Models (DTM)" using the example of the official DTM provided by our federal state of Nordrhein-Westfalen (NRW). The DTM is derived from Airborne Laser Scanning.

Browse the data archive providing Airborne Laser Scan data of the Federal State of Nordrhein-Westfalen.

DO NOT DOWNLOAD THE DATA RANDOMLY DURING CLASS! IT IS TOO BIG!!! Just have a look!

Have a look at the SIZE of the following data sources, the description of which unfortunately being in German. It contains raw and processed data from aerial laser scanning (ALS).

Raw laser scanning data: https://www.opengeodata.nrw.de/produkte/geobasis/dgm/dgm1l/

Interpolated data on a regular 1m x 1m grid: https://www.opengeodata.nrw.de/produkte/geobasis/dgm/dgm1/

The ALS data is organized in tiles which are bundled in zip archives for each municipality (in our case "Xanten"). The original file format of each tile is a formatted text file with three columns for the x-y-z coordinates denoted as XYZ file format. Each row represents one grid point in space.

In fact all points of a single tile form a regular grid of 2000 x 2000 points with 1m distance between points in x- and y-direction leading to a text file with 4'000'000 rows!

Obviously the XYZ text files are not suitable for being processed in QGIS. Therefore we have to convert the XYZ format into a geoTiff format and use Python to perform the task.

Before we know which of the tiles have to be processed - i.e. are located in our region of interest (ROI) - we have to create a bounding box (georeferenced squared polygon) for all tiles (XYZ files) in the archive. These polygons are added to a shapefile which is used in QGIS later on to identify the interesting tiles in the ROI.

## Exercise 2

You have to identify the three tiles which are touching the walking path (GPS track) discussed before. It is in the the region of the forest area Hees. Add another tile such that you have a 2x2 tile arrangement.

Use the Python notebook to create a geoTiff from each of the four XYZ DTM tiles. Add these raster files to QGIS.

Use merge in QGIS to merge the four tiles to one. `merge` creates a temporary layer by default. Change t in the creation options or export the layer explicitly.
### Bug / Workaround with gdal_merge

In case you want to use the merge function from the GDAL package in QGIS the following error may occur:

```
Loading resulting layers
The following layers were not correctly generated.<ul><li>C:/Users/rb/AppData/Local/Temp/processing_58db30a795ce4313b44c86cc7d532f30/4f0ee0869b39443090c70138b8df76ec/OUTPUT.tif</li></ul>You can check the 'Log Messages Panel' in QGIS main window to find more information about the execution of the algorithm.
```

If you open in the menu `View -> Panels -> Log Messages` it reports:

```
2020-12-03T22:37:34     INFO    python3 -m gdal_merge -ot Float32 -of GTiff -o C:/Users/rb/AppData/Local/Temp/processing_58db30a795ce4313b44c86cc7d532f30/4f0ee0869b39443090c70138b8df76ec/OUTPUT.tif --optfile C:/Users/rb/AppData/Local/Temp/processing_58db30a795ce4313b44c86cc7d532f30/086903d548304f34b6db8c98339f9529/mergeInputFiles.txt
2020-12-03T22:37:34     INFO    GDAL execution console output
             C:\PROGRA~1\QGIS3~1.10\bin\python3.exe: No module named gdal_merge
```

Python raises an error: **No module named gdal_merge**

The problem is, that the path to the gdal Python scripts is not set of wrong. Python started from QGIS does not find the scripts.

But they are available and reside in a directory similar to `C:\Program Files\QGIS 3.10\apps\Python37\Scripts`.

Should this error occur you have to add the Python path to the environment files which are sourced when QGIS is started.

Open the file (or a similar file) **`C:\Program Files\QGIS 3.10\bin\qgis-bin.env`** as Administrator and insert the line `PYTHONPATH=C:\PROGRA~1\QGIS3~1.10\apps\Python37\Scripts`.

Save it and restart QGIS. That should solve the problem.


