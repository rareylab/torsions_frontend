# Torsions Frontend

The torsions fronted serves as the frontend of the torsions server. Furthermore, it is also the basis to generate the
local GUI application for the TorsionAnalyzer. More information can be found in the following publication:

Patrick Penner, Wolfgang Guba, Robert Schmidt, Agnes Meyder, Martin Stahl, and Matthias Rarey. (submitted).
The Torsion Library: Semi-automated Improvement of Torsion Rules with SMARTScompare.

Patrick Penner, Wolfgang Guba, Robert Schmidt, Agnes Meyder, Martin Stahl, and Matthias Rarey. (2022). The Torsion Library: Semi-
automated Improvement of Torsion Rules with SMARTScompare. J.Chem.Inf.Model. [https://doi.org/10.1021/acs.jcim.2c00043](https://doi.org/10.1021/acs.jcim.2c00043)

The backend can be found here: [https://github.com/rareylab/torsions](https://github.com/rareylab/torsions)

A running instance can be found here: [https://torsions.zbh.uni-hamburg.de/](https://torsions.zbh.uni-hamburg.de/)

This particular frontend was an experiment in low-tech JS development. As such it explicitly avoids node and npm as
much as possible. The local branch does use node and [electron](https://www.electronjs.org/) to deploy the static JS
frontend as a standalone GUI.

# Testing

Tests are based on the standalone version of the [jasmine](https://jasmine.github.io/) testing framework. They can be
run by opening the `SpecRunner.html` in the browser of your choice, for example:
```bash
firefox test/SpecRunner.html
```

One file on the `local` branch hast to be tested with node integration. While on the `local` branch, this can be done
with either:
```bash
npm run test
```
... or with:
```bash
npx jasmine test/TorsionAnalyzerWrapperSpec.js
```

# Deployment

## Server-Side

JS code on the main branch can be built into a distributable package with the make_dist.sh script:
```bash
./make_dist.sh
```
This will fill the `dist` directory with all static files that need to be served in order for the frontend to work.

## Local Application

Switch to the `local` branch and install the npm dependencies. These are necessary to package code into an electron app.
To correctly package the electron app ensure that the `bin/` directory exists and contains a TorsionAnalyzer binary for
the target platform. Furthermore, check that there is a distributable version of the Torsion Library in `torsion_lib/`,
as well as CSD and PDB plots for all the torsion rules. An electron app can then be packaged using:
```bash
npx electron-packager ./ --platform=<linux,darwin,win32>
```
This should produce a `torsion_analyzer_local*` directory that contains everything the local application needs to run.
