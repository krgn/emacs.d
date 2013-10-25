;; set up elpa
(setq relative-config-dir "~/.emacs.d/")
(setq setup-files-dir "config/")

(load-file (concat relative-config-dir "elpa.el"))

;; use use-package :)
(require 'use-package)
;; massage list of file-names
(setq dot-files 
      (mapcar (lambda (item) (concat relative-config-dir setup-files-dir item))
           (list "setup-evil.el"        ;vimim (vi much improved)
                 "setup-path.el"        ;path
                 "setup-font.el"        ;font
                 "setup-aliases.el"     ;cmd aliases
                 "setup-utilities.el"   ;functions
                 "setup-general.el"     ;general
                 "setup-mu.el"          ;mail
                 "setup-projectile.el"  ;projects
                 "setup-keychain.el"    ;keychain
                 "setup-magit.el"       ;magit
                 "setup-nxml.el"
                 "setup-auto-complete.el"
                 "setup-win.el"
                 "setup-yaml.el"
                 "setup-compile.el"
                 "setup-org.el"
                 "setup-ruby.el"
                 "setup-android.el"     ;java
                 "setup-jdee.el"        ;java
                 "setup-eclim.el"       ;java
                 "setup-html.el"
                 "setup-js.el"
                 "setup-yasnippet.el"
                 "setup-erc.el"
                 "setup-scheme.el"
                 "setup-clojure.el"
                 "setup-md.el"
                 "setup-ido.el"
                 "setup-ace-jump.el"
                 "setup-dired.el"
                 "setup-workgroups.el"
                 "setup-shell.el"
                 "setup-theme.el"
                 "setup-supercollider.el")))

(dolist (file dot-files) (load-file file))
