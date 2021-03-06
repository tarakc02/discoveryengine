% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/converter-proposal-entity.R
\name{proposal_entity}
\alias{proposal_entity}
\title{Retrieve the relevant entities from a list of proposals}
\usage{
proposal_entity(proposals, include_inactive = TRUE)
}
\arguments{
\item{proposals}{A definition of type \code{assignment_id}, which are built
using proposal widgets}

\item{include_inactive}{Should inactive proposals/assignments be considered?
Defaults to \code{TRUE}}
}
\description{
This widget allows you to take an existing definition of type
\code{assignment_id} (from the proposal widgets) and convert it to a
definition of type \code{entity_id},
by finding the entities connected to the proposals (via the prospect records).
}
