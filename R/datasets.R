#' @title Show UDG datasets
#' @description Access the installed user's vocabulary
#' @param pattern Optional. Pattern of the dataset name as passed to function grep.
#' @return The datasets table, in the form of a data.frame
#' @note The function assumes that the user has read permission to the package installation directory
#' @author M Iturbide
#' @export
#' @importFrom utils read.csv
#' @examples
#' # Default built-in datasets
#' str(UDG.datasets())
#' (sets <- UDG.datasets())
#' sets[grep("CORDEX-EUR44.*historical", sets$name), ]
#' # Using argument pattern
#' UDG.datasets(pattern = "CORDEX-EUR44.*historical")$name

UDG.datasets <- function(pattern = "") {
      df <- read.csv(file.path(find.package("loadeR"), "datasets.txt"), stringsAsFactors = FALSE)[ ,1:3]
      df[grep(pattern, df$name),]
}