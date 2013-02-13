(require 'magit)
(require 'magit-blame)
(require 'magit-bisect)

(setq magit-commit-signoff t)
(setq magit-completing-read-function (quote magit-ido-completing-read))
(setq magit-repo-dirs (quote ("$HOME/src")))

(provide 'krgn-magit)
