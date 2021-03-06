\name{mutualInfo}
\alias{mutualInfo}
\alias{mutualInfo,matrix-method}
\alias{mutualInfo,ExpressionSet-method}
\alias{MIdist}
\alias{MIdist,matrix-method}
\alias{MIdist,ExpressionSet-method}
\title{Mutual Information} 
\description{
Calculate mutual information via binning
}
\usage{
mutualInfo(x, \dots)
MIdist(x, \dots)
}
\arguments{
  \item{x}{an n by p matrix or ExpressionSet; if x is an ExpressionSet, then the function uses its 'exprs' slot.}
  \item{\dots}{arguments passed to \code{mutualInfo} and \code{MIdist}:
    \itemize{
      \item{nbin}{number of bins to calculate discrete probabilities; default
      is 10.} 
      \item{diag}{if TRUE, then the diagonal of the distance matrix will be
      displayed; default is FALSE.} 
      \item{upper}{if TRUE, then the upper triangle of the distance matrix
      will be displayed; default is FALSE.} 
      \item{sample}{for ExpressionSet methods, if TRUE, then distances are
      computed between samples, otherwise, between genes.}   
    }
  }
}
\details{
 For \code{mutualInfo} each row of \code{x} is divided into 
 \code{nbin} groups and then the mutual information is computed, treating 
 the data as if they were discrete.

For \code{MIdist} we use the transformation proposed by Joe (1989),
\eqn{\delta^* = (1 - \exp(-2 \delta))^{1/2}}{delta* = (1 - exp(-2 delta))^.5}
where \eqn{\delta}{delta} is the mutual information. The \code{MIdist} is 
then \eqn{1 = \delta^*}{1-delta*}. Joe argues that this measure is then 
similar to Kendall's tau, \code{\link{tau.dist}}.
}
\value{
 An object of class \code{dist} which contains the pairwise distances.
}
\references{H. Joe, Relative Entropy Measures of Multivariate Dependence,
JASA, 1989, 157-164.}
\author{Robert Gentleman}
\seealso{\code{\link{dist}}, \code{\link{KLdist.matrix}},
  \code{\link{cor.dist}}, \code{\link{KLD.matrix}}}
\examples{
 x <- matrix(rnorm(100), nrow = 5)
 mutualInfo(x, nbin = 3)
}
\keyword{manip}
