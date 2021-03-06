% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/miner-research-miner.R
\name{research_miner}
\alias{research_miner}
\title{Find entities based on keyword searches of their research profiles}
\usage{
research_miner(..., author = NULL)
}
\arguments{
\item{...}{Search string(s)}

\item{author}{Optionally, include an entity ID of a prospect researcher to only
look at notes written by that researcher.}
}
\value{
A discoveryengine list definition of type \code{entity_id}
}
\description{
Searches through research notes for the given keywords/phrases, and returns
the relevant entities. Searches the "Text" of a research note along with the
"Brief Note" and the "Description." Enter one
or more search strings. If you enter multiple search strings, the search will
be for notes that contain any one of the searches. Wildcards (*)
are allowed at the beginning or end of each search term (but not in the
middle). For advanced searches, use the \code{ora}
function to use an arbitrary Oracle-style regex as the search term.
}
\examples{
research_miner("education")

## broad search for education supporters
research_miner("education") \%or\%
    has_interest(education) \%or\%
    has_philanthropic_affinity(higher_education, secondary_education)

}
