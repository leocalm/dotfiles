;;; package --- Summary

;;; Commentary:
;;; Code:

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; Avoid using tab to ident
(setq-default indent-tabs-mode nil)

;; Better Defaults
(use-package better-defaults)

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)

;; Enabling IDO
(ido-mode 1)
(ido-everywhere 1)

;; IDO ubiquitous
(use-package ido-completing-read+
  :config
  (ido-ubiquitous-mode 1))

;; IDO vertical mode
(use-package ido-vertical-mode
  :config
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only)
  (setq ido-vertical-show-count t))

;; SMEX
(use-package smex ; Not needed if you use package.el
  :config
  (smex-initialize)) ; Can be omitted. This might cause a (minimal) delay
                     ; when Smex is auto-initialized on its first run.

;; HELM
(use-package helm
  :config
  (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
  (helm-mode 1))

(use-package helm-ag
  :config
  (global-set-key (kbd "C-x C-a") #'helm-ag))

(use-package helm-projectile
  :config
  (helm-projectile-on))

(use-package helm-fuzzier
  :config
  (helm-fuzzier-mode 1)
  (setq-default helm-M-x-fuzzy-match t))

;; ICICLES
(use-package icicles
  :config
  (icy-mode 1))

;; DASHBOARD
(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents  . 5)
                          (bookmarks . 5)
                          (projects . 5)
                          (agenda . 5)
                          (registers . 5))))


;; WINDOMOVE
(use-package windmove
  :config
  (windmove-default-keybindings))


;;PROJECTILE
(use-package projectile
  :defer t
  :config
  (projectile-discover-projects-in-directory "~/git")
  ;; Workaround to avoid projectile making the editor very slow
  ;; https://github.com/bbatsov/projectile/issues/1183#issuecomment-335569547
  (setq projectile-mode-line
        '(:eval (format " Projectile[%s]"
                        (projectile-project-name))))
  :init (projectile-mode))

;; MAGIT
(use-package magit)

(use-package page-break-lines)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package markdown-preview-mode)

(provide 'misc)
;;; misc.el ends here