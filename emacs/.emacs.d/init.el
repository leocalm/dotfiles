;;open agenda in current window
(setq org-agenda-window-setup (quote current-window));;; package --- Summary

;;; Commentary:
;;; Code:

;; No need for ~ files when editing
(setq create-lockfiles nil)

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

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
 '(jdee-server-dir "~/jdee_server")
 '(package-selected-packages
   (quote
    (info+ icicles vue-mode pyenv multiple-cursors markdown-mode magit)))
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
(load "setup-python.el")
(load "setup-clojure.el")
;; (load "setup-jdee.el")

(provide 'init)
;;; init.el ends here
