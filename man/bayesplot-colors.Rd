% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bayesplot-colors.R
\name{bayesplot-colors}
\alias{bayesplot-colors}
\alias{color_scheme_get}
\alias{color_scheme_set}
\alias{color_scheme_view}
\title{Set, get, or view color schemes}
\usage{
color_scheme_set(scheme = "blue")

color_scheme_get(scheme)

color_scheme_view(scheme)
}
\arguments{
\item{scheme}{For \code{color_scheme_set}, either a string naming one of the
  available color schemes or a character vector of \emph{exactly six} colors
  specifying a custom scheme (see the \strong{Custom Color Schemes} section,
  below, for more on specifying a custom scheme).

  For \code{color_scheme_get}, \code{scheme} can be missing (to get the
  current color scheme) or a string naming one of the preset schemes.

  For \code{color_scheme_view}, \code{scheme} can be missing (to use the
  current color scheme) or a character vector containing a subset of the
  available scheme names.

  Currently, the available preset color schemes are:
  \itemize{
   \item \code{"blue"}
   \item \code{"brightblue"}
   \item \code{"gray"}
   \item \code{"green"}
   \item \code{"pink"}
   \item \code{"purple"}
   \item \code{"red"}
   \item \code{"teal"}
   \item \code{"yellow"}
   \item \code{"mix-x-y"}, replacing \code{x} and \code{y} with any two of
   the scheme names listed above (e.g. "mix-teal-pink", "mix-blue-red",
   etc.). The order of \code{x} and \code{y} matters, i.e., the color schemes
   "mix-blue-red" and "mix-red-blue" are not identical. There is no gaurantee
   that every possible mixed scheme will look good with every possible plot.
  }}
}
\value{
\code{color_scheme_set} has the side effect of setting the color
  scheme used for plotting. It also returns
  (\code{\link[=invisible]{invisibly}}) a list of the hexidecimal color
  values used in \code{scheme}.

  \code{color_scheme_get} returns a \code{list} of the hexadecimal color
  values (without changing the current scheme). If the \code{scheme} argument
  is not specified the returned values correspond to the current color
  scheme.

  \code{color_scheme_view} returns a ggplot object if only a single scheme is
  specified and a gtable object if multiple schemes names are specified.
}
\description{
Set, get, or view color schemes. Choose from a preset scheme or create a
custom scheme.
}
\section{Custom Color Schemes}{
 A \pkg{bayesplot} color scheme consists of six
  colors. To specify a custom color scheme simply pass a character vector
  containing either the names of six \code{\link[grDevices]{colors}} or six
  hexidecimal color values (or a mix of names and hex values). The colors
  should be in order from lightest to darkest. See the end of the
  \strong{Examples} section for a demonstration.
}
\examples{
color_scheme_set("blue")
color_scheme_get()
color_scheme_view()

color_scheme_get("brightblue")
color_scheme_view("brightblue")

# compare multiple schemes
color_scheme_view(c("pink", "gray", "teal"))

color_scheme_set("pink")
x <- example_mcmc_draws()
mcmc_intervals(x)

color_scheme_set("teal")
color_scheme_view()
mcmc_intervals(x)

color_scheme_set("red")
mcmc_areas(x, regex_pars = "beta")

color_scheme_set("purple")
color_scheme_view()
y <- example_y_data()
yrep <- example_yrep_draws()
ppc_stat(y, yrep, stat = "mean") + legend_none()
\donttest{
color_scheme_set("mix-teal-pink")
ppc_stat(y, yrep, stat = "sd") + legend_none()
mcmc_areas(x, regex_pars = "beta")
}
###########################
### custom color scheme ###
###########################
orange_scheme <- c("#ffebcc", "#ffcc80",
                   "#ffad33", "#e68a00",
                   "#995c00", "#663d00")
color_scheme_set(orange_scheme)
mcmc_areas(x, regex_pars = "alpha")
mcmc_dens_overlay(x)
ppc_stat(y, yrep, stat = "var") + legend_none()

}
\seealso{
\code{\link{theme_default}} for the default ggplot theme used by
  \pkg{bayesplot}.
}

