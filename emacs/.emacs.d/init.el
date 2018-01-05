;;; package --- Summary

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

    info+
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
 '(org-agenda-files (quote ("~/tasks.org")))
 '(package-selected-packages (quote (markdown-mode magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Customizations
(load "ui.el")
(load "misc.el")

;; Coding
(load "dev.el")
(load "web.el")
(load "setup-python.el")
(load "setup-clojure.el")
;; (load "setup-jdee.el")

(provide 'init)
;;; init.el ends here
