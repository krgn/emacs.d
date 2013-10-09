;; set up elpa
(setq relative-config-dir "~/.emacs.d/")

(load-file (concat relative-config-dir "elpa.el"))

;; use use-package :)
(require 'use-package)
;; massage list of file-names
(setq dot-files 
      (mapcar (lambda (item) (concat relative-config-dir item))
           (list "setup-path.el"
                 "setup-font.el"
                 "setup-nxml.el"
                 "setup-aliases.el"
                 "setup-utilities.el"
                 "setup-general.el"
                 "setup-evil.el"
                 "setup-auto-complete.el"
                 "setup-win.el"
                 "setup-yaml.el"
                 "setup-compile.el"
                 "setup-magit.el"
                 "setup-org.el"
                 "setup-ruby.el"
                 "setup-android.el"
                 "setup-java.el"
                 "setup-smartparens.el"
                 "setup-projectile.el"
                 "setup-js.el"
                 "setup-yasnippet.el"
                 "setup-erc.el"
                 "setup-scheme.el"
                 "setup-clojure.el"
                 "setup-keychain.el"
                 "setup-md.el"
                 "setup-ido-imenu.el"
                 "setup-bindings.el"
                 "setup-ace-jump.el"
                 "setup-dired.el"
                 "setup-workgroups.el"
                 "setup-shell.el"
                 "setup-theme.el"
                 "setup-mu.el"
                 "setup-supercollider.el")))

(dolist (file dot-files) (load-file file))
