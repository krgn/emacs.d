;; eclim config

(require 'eclim)
(require 'eclimd)
(global-eclim-mode)

(setq eclim-executable "/usr/share/eclipse/eclim")
(setq eclimd-executable "/usr/share/eclipse/eclimd")

;; don't wait for eclimd to start
(setq eclimd-wait-for-process nil)

;; regular auto-complete initialization
(require 'auto-complete-config)
(ac-config-default)

;; add the emacs-eclim source
(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)

(provide 'krgn-eclim)
