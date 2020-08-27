# tensoRflowLite
porting of tensorflow lite for R [![experimental](http://badges.github.io/stability-badges/dist/experimental.svg)](http://github.com/badges/stability-badges)

## Why this repo

## Documentation

For my first test I train a machine learning model with keras + tensorflow over R, to convert it to a tensorflow lite file format.
You can find the code in the notebook Keras_Demo_R_.ipynb which you can [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/anadiedrichs/tensoRflowLite/blob/master/Keras_Demo_R_.ipynb)

Then I tried different things to convert this binary file on R (see tutorial.R) to a C file which has the specification indicated in the tensorflow lite documentation:

* https://www.tensorflow.org/lite/microcontrollers/build_convert#model_conversion
* https://www.tensorflow.org/lite/microcontrollers/build_convert#convert_to_a_c_array

### Recomended developer workflow in tensorflow lite

To deploy a TensorFlow model to a microcontroller, you will need to follow this process:

#### 1) Create or obtain a TensorFlow model

DONE: example done in [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/anadiedrichs/tensoRflowLite/blob/master/Keras_Demo_R_.ipynb)

The model must be small enough to fit on your target device after conversion, and it can only use supported operations. If you want to use operations that are not currently supported, you can provide your own implementations.

#### 2) Convert the model to a TensorFlow Lite FlatBuffer

tensoRflowLite_SHOULD_Help_HEre 

You will convert your model into the standard TensorFlow Lite format using the TensorFlow Lite converter. You may wish to output a quantized model, since these are smaller in size and more efficient to execute.

#### 3) Convert the FlatBuffer to a C byte array

tensoRflowLite_SHOULD_Help_HEre 
Models are kept in read-only program memory and provided in the form of a simple C file. Standard tools can be used to convert the FlatBuffer into a C array.

#### 4) Integrate the TensorFlow Lite for Microcontrollers C++ library

TO_BE_DONE Write your microcontroller code to collect data, perform inference using the C++ library, and make use of the results.

#### 5) Deploy to your device

TO_BE_DONE Build and deploy the program to your device.
