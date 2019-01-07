;;; package --- Summary

;;; Commentary:
;;; Code:

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; Set some shortcuts
(global-set-key (kbd "C-c r s") 'replace-string)
(global-set-key (kbd "C-c r r") 'replace-regexp)

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
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-create-new-buffer 'always)
(ido-mode 1)

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
  (global-set-key (kbd "C-c C-a") #'helm-ag))

(use-package helm-projectile
  :config
  (setq helm-projectile-fuzzy-match t)
  (helm-projectile-on))

(use-package helm-fuzzier
  :config
  (helm-fuzzier-mode 1)
  (setq-default helm-M-x-fuzzy-match t))

;; ICICLES
;; (use-package icicles
;;   :config
;;   (icy-mode 1))

;; DASHBOARD
(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq show-week-agenda-p t)
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-items '((recents  . 5)
                          (projects . 5)
                          (agenda . 10)
                          (bookmarks . 5)
                          (registers . 5))))


;; WINDOMOVE
(use-package windmove
  :config
  (windmove-default-keybindings))


;;PROJECTILE
(use-package projectile
  :defer t
  :config
  (projectile-discover-projects-in-directory "/home/leonardo/workbench")
  (setq projectile-enable-caching t)
  ;; (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  ;; Workaround to avoid projectile making the editor very slow
  ;; https://github.com/bbatsov/projectile/issues/1183#issuecomment-335569547
  (setq projectile-mode-line
        '(:eval (format " Projectile[%s]"
                        (projectile-project-name))))
  :init (projectile-mode))

;; MAGIT
(use-package magit
  :init
  (global-set-key (kbd "C-c m s") 'magit-status))

(use-package page-break-lines)

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package markdown-preview-mode)

(use-package multiple-cursors
  :init
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

;; (use-package info+)

(defun move-line-up ()
  "Move the current line up."
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun move-line-down ()
  "Move the current line down."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

;; Keybindings for moving lines up and down
(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)


;; Fill column indicator
(use-package fill-column-indicator
  :defer t
  :config
  (setq fci-rule-column 120)
  (setq fci-rule-width 1)
  (setq fci-rule-color "darkblue"))


;; Set to the location of your Org files on your local system
(setq org-directory "~/org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/tasks.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/Aplicativos/MobileOrg")
(setq org-agenda-files '("~/org/tasks.org"))

(setq org-todo-keyword-faces
      '(("TODO" . org-warning) ("STARTED" . "yellow")
        ("CANCELED" . (:foreground "blue" :weight bold))))

;; server
(server-start)

;; Spotify
(use-package spotify
  :init
  (global-set-key (kbd "C-c C-n") 'spotify-next)
  (global-set-key (kbd "C-c C-p") 'spotify-previous)
  (global-set-key (kbd "C-c C-SPC") 'spotify-playpause))

(use-package spaceline-config :ensure spaceline
  :config
  (spaceline-helm-mode 1)
  (spaceline-define-segment spotify
    "Bla"
    (spotify-current))

  (spaceline-install
    'main
    '((anzu :priority 95)
      (auto-compile)
      (major-mode :priority 79)
      (process :when active)
      ((flycheck-error flycheck-warning flycheck-info)
       :when active
       :priority 89)
      (minor-modes :when active
                   :priority 9)
      (mu4e-alert-segment :when active)
      (erc-track :when active)
      (version-control :when active
                       :priority 78)
      (org-pomodoro :when active)
      (org-clock :when active))
    '((spotify)
      (python-pyvenv :fallback python-pyenv)
      (purpose :priority 94)
      (battery :when active)
      (selection-info :priority 95)
      (input-method)
      ((buffer-encoding-abbrev
        point-position
        line-column)
       :separator " | "
       :priority 96)
      (global :when active)
      (buffer-position :priority 99)
      (hud :priority 99))))


(setq display-time-day-and-date t)
(setq display-time-format "%Y-%m-%d %H:%M")
(setq display-time-default-load-average nil)
(display-time-mode 1)

(provide 'misc)
;;; misc.el ends here
