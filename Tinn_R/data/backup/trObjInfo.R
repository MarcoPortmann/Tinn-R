
trObjInfo <-
function (id, path,  sep = "\t")
{

    describe <- function(name, parent) {
        sobj <- parent[name]
        res <- c(Name = name, Dims = if (is.null(Dim <- dim(sobj))) length(sobj) else paste(Dim,
            collapse = "x"), Class = class(sobj[[1]]))
        return(res)
    }

    res <- c()
    id <- as.character(id)[1]
    if (exists(id)){
        obj <- get(id)
        Items <- names(obj)
        #parent <- obj
        if (length(Items) != 0)
           res <- data.frame(t(sapply(Items, describe, parent = obj)))

    }
    write.table(res, file = path, row.names = FALSE, col.names = FALSE, quote = FALSE, sep =sep)
}
