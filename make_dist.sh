if [ -d dist ]; then
  echo "Removing previous dist"
  rm -r dist/vendor
  rm -r dist/*.css
  rm -r dist/*.js
fi

# css dependencies
mkdir -p dist/vendor/bootstrap/css/
cp vendor/bootstrap/css/bootstrap.min.css dist/vendor/bootstrap/css/bootstrap.min.css
cp vendor/datatables.min.css dist/vendor/datatables.min.css

# application.min.css
cat main.css >> dist/application.min.css

# js dependencies
cp vendor/jquery.min.js dist/vendor/jquery.min.js
cp vendor/ngl.js dist/vendor/ngl.js
cp vendor/datatables.min.js dist/vendor/datatables.min.js
mkdir -p dist/vendor/DataTables-1.10.21/images/
cp vendor/DataTables-1.10.21/images/sort_asc.png dist/vendor/DataTables-1.10.21/images/sort_asc.png
cp vendor/DataTables-1.10.21/images/sort_asc_disabled.png dist/vendor/DataTables-1.10.21/images/sort_asc_disabled.png
cp vendor/DataTables-1.10.21/images/sort_both.png dist/vendor/DataTables-1.10.21/images/sort_both.png
cp vendor/DataTables-1.10.21/images/sort_desc.png dist/vendor/DataTables-1.10.21/images/sort_desc.png
cp vendor/DataTables-1.10.21/images/sort_desc_disabled.png dist/vendor/DataTables-1.10.21/images/sort_desc_disabled.png
mkdir -p dist/vendor/bootstrap/js/
cp vendor/bootstrap/js/bootstrap.min.js dist/vendor/bootstrap/js/bootstrap.min.js
cp vendor/jquery.loading.min.js dist/vendor/jquery.loading.min.js

# application.min.js
cat src/ElementBuilder.js >> dist/application.min.js
cat src/Utils.js >> dist/application.min.js
cat src/TabPane.js >> dist/application.min.js
cat src/MoleculeUploadForm.js >> dist/application.min.js
cat src/MoleculeTable.js >> dist/application.min.js
cat src/TorsionResultsTable.js >> dist/application.min.js
cat src/TorsionPlot.js >> dist/application.min.js
cat src/TorsionMarker.js >> dist/application.min.js
cat src/TorsionAnalyzerApp.js >> dist/application.min.js

# help.html and images
cp -r images dist/
