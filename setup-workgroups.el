(require 'workgroups2)

(setq wg-prefix-key (kbd "C-c w")
      wg-restore-associated-buffers nil ; all buffers opened in current WG
      wg-use-default-session-file nil   ; turn off for "emacs --daemon"
      wg-default-session-file "~/.emacs.d/workgroups"
      wg-use-faces nil
      wg-morph-on nil)

(workgroups-everywhere)

;; <prefix> c    - create workgroup
;; <prefix> k    - kill workgroup
;; <prefix> v    - switch to workgroup
;; <prefix> C-s  - save session
;; <prefix> C-f  - load session

(provide 'krgn-workgroups)
