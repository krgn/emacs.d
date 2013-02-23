(require 'erc)

(erc :server "irc.freenode.net" :port "6667" :nick "krgn"))

(setq erc-hide-list '("JOIN" "PART" "QUIT"))

(setq erc-autojoin-channels-alist '(("freenode.net" "#chicken" "#couchdb")))

(provide 'krgn-erc)
