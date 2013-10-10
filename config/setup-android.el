;; <--- default keymap --->
;; (defconst android-mode-keys
;;   '(("d" . android-start-ddms)
;;     ("e" . android-start-emulator)
;;     ("l" . android-logcat)
;;     ("C" . android-ant-clean)
;;     ("c" . android-ant-debug)
;;     ("i" . android-ant-installd)
;;     ("r" . android-ant-reinstall)
;;     ("u" . android-ant-uninstall)
;;     ("a" . android-start-app)))

(use-package android-mode
  :init
  (progn
    (setq android-mode-sdk-dir "/opt/android-sdk/")
    (add-hook 'android-mode-hook 'highlight-todo)))
