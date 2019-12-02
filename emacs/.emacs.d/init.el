;;open agenda in current window
(setq org-agenda-window-setup (quote current-window));;; package --- Summary

;;; Commentary:
;;; Code:

(setq debug-on-error t)

;; No need for ~ files when editing
(setq create-lockfiles nil)

(require 'package)
(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/"))
 package-archive-priorities '(("melpa-stable" . 1)))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(
    use-package
    ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-completing-read-handlers-alist
   (quote
    ((describe-function . helm-completing-read-symbols)
     (describe-variable . helm-completing-read-symbols)
     (describe-symbol . helm-completing-read-symbols)
     (debug-on-entry . helm-completing-read-symbols)
     (find-function . helm-completing-read-symbols)
     (disassemble . helm-completing-read-symbols)
     (trace-function . helm-completing-read-symbols)
     (trace-function-foreground . helm-completing-read-symbols)
     (trace-function-background . helm-completing-read-symbols)
     (find-tag . helm-completing-read-default-find-tag)
     (org-capture . helm-org-completing-read-tags)
     (org-set-tags . helm-org-completing-read-tags)
     (ffap-alternate-file)
     (tmm-menubar)
     (find-file)
     (find-file-at-point . helm-completing-read-sync-default-handler)
     (ffap . helm-completing-read-sync-default-handler)
     (execute-extended-command)
     (dired-do-copy . helm-read-file-name-handler-1)
     (dired-do-symlink . helm-read-file-name-handler-1)
     (dired-do-relsymlink . helm-read-file-name-handler-1)
     (dired-do-hardlink . helm-read-file-name-handler-1))))
 '(jdee-server-dir "~/jdee_server")
 '(org-agenda-files (quote ("~/org/personal.org")))
 '(package-selected-packages
   (quote
    (pipenv ansible conda company-terraform terraform-mode elpy ensime groovy-mode fancy-battery yaml-mode fill-column-indicator py-isort auto-virtualenv pythonic anaconda-mode highlight-indent-guides company-anaconda org-jira playerctl helm-projectile cider clojure-mode-extra-font-locking clojure-mode paredit pyenv-mode-auto pyenv-mode js2-mode web-mode rainbow-mode company flycheck smartparens rainbow-delimiters markdown-preview-mode dashboard helm-fuzzier helm-ag helm smex ido-vertical-mode ido-completing-read+ better-defaults mode-icons spaceline flymd info+ icicles vue-mode pyenv multiple-cursors markdown-mode magit)))
 '(sql-postgres-login-params
   (quote
    ((user :default "leonardo")
     password server
     (database :default "leonardo")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'use-package)
;; Automatic install all packages declared using use-package
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Customizations
(load "ui.el")
(load "misc.el")
(load "org-config.el")

;; Coding
(load "dev.el")
(load "web.el")
(load "setup-python2.el")
(load "setup-clojure.el")
(load "setup-scala.el")
(load "setup-terraform.el")

(provide 'init)
;;; init.el ends here
