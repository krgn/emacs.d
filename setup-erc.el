(require 'erc)

(setq erc-hide-list '("JOIN" "PART" "QUIT"))
(setq erc-nick "krgn")
(setq erc-nick-uniquifier "$")
(setq erc-autojoin-channels-alist '(("freenode.net" "#chicken" "#couchdb")))

(provide 'setup-erc)
