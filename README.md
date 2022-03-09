# Image techniques
> Techniques for processing images using matlab desing processes
 
  ## Table of contents
* [Labs](#labs)
   * [1](#color-models)
   * [2](#simple-image-processing-techniques)
   * [3](#fourier-transformation-2d)
   * [4](#image-restoration)
* [Prerequisites](#prerequisites)
* [How to run](#how-to-run)
* [Acknowledgments](#acknowledgments)

### Color Models
1. RGB model.
2. Pictures in Shades of Grey.	
3. HSI model. 
4. White balance. 

<br><br>


1. Convert 8-bit RGB to Shades of Grey
2. Convert HSI model to RGB
3. Fading Image
   * rgb2hsv
   * hsv2rgb
   * imshow
4. White balance 8-bit RGB image
  

### Simple Image Processing Techniques
1. Histogram. 
2. Spatial filters. 
3. Smoothing filters. 
4. Sharpening filters. 

<br><br>
1. Balance histogram of an image
   * imhist
2. Convert image to black & white
   * inspect histogram for threshold values
3. Median and Gaussian filters on brain.gif
   * medfilt2
   * fspecial & imfilter
4. Salt & pepper on brain.gif
   * imnoise
5. Noise reduction
   * median filter 
   * average filter (fspecial & imfilter)


### Fourier Transformation 2D
1. Discrete Fourier transformation. 
2. Fourier transformation presentation as image. 
<br><br>
1. Fourier Transformation on tools.bmp
   * fft2
2.
3. Fourier Transformation
   * vertical edge images
   * horizontal edges image
4. Fourier Transformation on black square image on size
   * 10x10 and reversed 45 angles
   * 30x30 and reversed 45 angles

### Image Restoration
1. Wiener Filter(Least Mean Square Filter). 
2. Constrained Least Squares Restoration. 
<br><br>
1. MSE on Blurring images with Gaussian noise


For each function, see help in Matlab

## Prerequisites
MATLAB environment (or any software using language that is mostly compatible with MATLAB, see [GNU Octave](https://www.gnu.org/software/octave/index)

## How to run
Run scripts in matlab. Photos have been used in random. They are chosen essential for the purpose of the projects. 

New pictures can be chosen if wanted

## Acknowledgments
Projects were created for the requirements of the lesson Digital Image Processing













