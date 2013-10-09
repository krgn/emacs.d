(use-package projectile
  :init 
  (progn 
    ;; keep a list of projects and navigation
    (projectile-global-mode)

    ;; kill all buffers of project before switching to new buffer
    (defadvice projectile-switch-project (before kill-buffers activate)
      (projectile-kill-buffers))
    (let ((root (condition-case nil 
                    (projectile-project-root)
                  (error nil))))
      (if root
          (projectile-kill-buffers)))
    (ad-activate 'projectile-switch-project)))
