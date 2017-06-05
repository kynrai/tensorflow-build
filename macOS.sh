#!/usr/bin/env bash

# Build with macbook optimisations
bazel build -c opt --copt=-mavx --copt=-mavx2 --copt=-mfma  --copt=-msse4.1 --copt=-msse4.2 //tensorflow/tools/pip_package:build_pip_package

# Make a pip whl package
bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg

# Install the package
pip install /tmp/tensorflow_pkg/tensorflow-1.2.0rc1-cp27-cp27m-macosx_10_12_x86_64.whl
