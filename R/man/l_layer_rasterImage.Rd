% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/l_layer_rasterImage.R
\name{l_layer_rasterImage}
\alias{l_layer_rasterImage}
\title{Layer a Raster Image}
\usage{
l_layer_rasterImage(widget, image, xleft, ybottom, xright, ytop,
  angle = 0, interpolate = FALSE, parent = "root", index = "end",
  ...)
}
\arguments{
\item{widget}{widget path as a string or as an object handle}

\item{image}{a \code{raster} object, or an object that can be
    coerced to one by \code{\link{as.raster}}.}

\item{xleft}{a vector (or scalar) of left x positions.}

\item{ybottom}{a vector (or scalar) of bottom y positions.}

\item{xright}{a vector (or scalar) of right x positions.}

\item{ytop}{a vector (or scalar) of top y positions.}

\item{angle}{angle of rotation (in degrees, anti-clockwise
    from positive x-axis, about the bottom-left corner).}

\item{interpolate}{a logical vector (or scalar) indicating
    whether to apply linear interpolation to the image when drawing. }

\item{parent}{parent widget path}

\item{index}{position among its siblings. valid values are 0, 1, 2, ...,
'end'}

\item{...}{argumnets forwarded to \code{\link{l_layer_line}}}
}
\value{
layer id of group or rectangles layer
}
\description{
This function is very similar to the 
  \code{\link[graphics]{rasterImage}} function. It works with every loon plot
  which is based on the cartesian coordinate system.
}
\details{
For more information run: \code{l_help("learn_R_layer.html#countourlines-heatimage-rasterimage")}
}
\examples{
plot(1,1, xlim = c(0,1), ylim=c(0,1))
mat <- matrix(c(0,0,0,0, 1,1), ncol=2)
rasterImage(mat, 0,0,1,1, interpolate = FALSE)

p <- l_plot()
l_layer_rasterImage(p, mat, 0,0,1,1)
l_scaleto_world(p)

image <- as.raster(matrix(0:1, ncol = 5, nrow = 3))
p <- l_plot(showScales=TRUE, background="thistle", useLoonInspector=FALSE)
l_layer_rasterImage(p, image, 100, 300, 150, 350, interpolate = FALSE)
l_layer_rasterImage(p, image, 100, 400, 150, 450)
l_layer_rasterImage(p, image, 200, 300, 200 + 10, 300 + 10,
   interpolate = FALSE)
l_scaleto_world(p)

# from examples(rasterImage)

# set up the plot region:
op <- par(bg = "thistle")
plot(c(100, 250), c(300, 450), type = "n", xlab = "", ylab = "")
rasterImage(image, 100, 300, 150, 350, interpolate = FALSE)
rasterImage(image, 100, 400, 150, 450)
rasterImage(image, 200, 300, 200 + 10, 300 + 10,
           interpolate = FALSE)
}
