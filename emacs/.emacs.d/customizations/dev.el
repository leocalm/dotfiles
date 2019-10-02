;;; package --- Summary

;;; Commentary:
;;; Code:

;; RAINBOW DELIMITERS
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;;SMARTPARENS
(use-package smartparens
  :config
  (add-hook 'prog-mode-hook #'smartparens-mode))

;; FLYCHECK
(use-package flycheck
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

;; COMPANY
(use-package company
  :config
  (setq company-tooltip-limit 20)
  (setq company-idle-delay .3)
  (setq company-echo-delay 0)
  (setq company-begin-commands '(self-insert-command))
  (setq-default company-dabbrev-downcase nil)
  (defvar company-backends)
  (eval-after-load "company"
    '(add-to-list 'company-backends 'company-files))

  :init
  (global-company-mode))

;; RAINBOW-MODE
(use-package rainbow-mode
  :config
  (add-hook 'web-mode-hook 'rainbow-mode))

;; YAML mode
(use-package yaml-mode
  :defer t
  :config
  (add-hook 'yaml-mode-hook
        (lambda ()
            (define-key yaml-mode-map "\C-m" 'newline-and-indent))))

;; Ansible minor mode
(use-package ansible
  :defer t
)

;; SQL-MODE
(defvar sql-mysql-options '("-A"))
(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)))

;; (defvar sql-connection-alist
;;       '((ebdb-local (sql-product 'mysql)
;;                     (sql-server "localhost")
;;                     (sql-user "quintoandar")
;;                     (sql-database "ebdb"))))

(defun my-sql-connect (connection)
  "Connect to the input server using sql_CONNECTION connection-alist."
  (interactive
   (helm-comp-read "Select server: " (mapcar (lambda (item)
                                               (list
                                                (symbol-name (nth 0 item))
                                                (nth 0 item)))
                                             sql-connection-alist)))
  
  ;; load the password
  (require 'pass "pass.el.gpg")

  (let* ((connection-info (assoc connection sql-connection-alist))
         (connection-product (nth 1 (nth 1 (assoc 'sql-product connection-info))))
         (sql-password (nth 1 (assoc connection my-sql-password))))
    ;; delete the connection info from the sql-connection-alist
    (setq sql-connection-alist (assq-delete-all connection sql-connection-alist))
    ;; delete the old password from the connection-info
    (setq connection-info (assq-delete-all 'sql-password connection-info))
    ;; add the password to the connection-info
    (nconc connection-info `((sql-password ,sql-password)))
    ;; add back the connection info to the beginning of sql-connection-alist
    ;; (last used server will appear first for the next prompt)
    (add-to-list 'sql-connection-alist connection-info)
    ;; override the sql-product by the product of this connection
    (defvar sql-product connection-product)
    ;; connect
    (if current-prefix-arg
        (sql-connect connection connection)
      (sql-connect connection))))

(provide 'dev)
;;; dev.el ends here
