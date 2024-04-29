# Method 1 ----

# before upgrading to new version of R ----

tmp <- installed.packages()
installedpkgs <- as.vector(tmp[is.na(tmp[,"Priority"]), 1])
save(installedpkgs, file = "installed_old.rda")

# after upgrading to new version of R ----

load("installed_old.rda")
tmp <- installed.packages()
installedpkgs.new <- as.vector(tmp[is.na(tmp[,"Priority"]), 1])
missing <- setdiff(installedpkgs, installedpkgs.new)
install.packages(missing)
update.packages()

# Method 2 ----

# before upgrading to new version of R ----

mypks <- pacman::p_lib()
saveRDS(mypks, "~/mypks.rds")

# after upgrading to new version of R ----

mypks <- readRDS("~/mypks.rds")
install.packages(mypks)
