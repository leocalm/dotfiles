;;; package --- Summary

;;; Commentary:
;;; Code:
;; (use-package anaconda-mode
;;   :config
;;   (add-hook 'python-mode-hook 'anaconda-mode)
;;   (setq flycheck-pylintrc "/opt/dwh/airflow/config/tox.ini")
;;   (setq flycheck-python-mypy-ini "/opt/dwh/airflow/config/tox.ini")
;;   (flycheck-add-next-checker 'python-pylint 'python-mypy)
;;   (add-to-list 'python-shell-extra-pythonpaths "/opt/dwh/airflow"))

(use-package auto-virtualenv
  :config
  (add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv)
  (add-hook 'window-configuration-change-hook 'auto-virtualenv-set-virtualenv)
  (add-hook 'focus-in-hook 'auto-virtualenv-set-virtualenv))

(use-package company-anaconda
  :config
  (defvar company-backends)
  (eval-after-load "company"
    '(add-to-list 'company-backends 'company-anaconda)))

(use-package elpy
  :init
  (elpy-enable)
  (setq flycheck-pylintrc "/opt/dwh/airflow/config/tox.ini")
  (setq flycheck-python-mypy-ini "/opt/dwh/airflow/config/tox.ini")
  (flycheck-add-next-checker 'python-pylint 'python-mypy)
  (add-to-list 'python-shell-extra-pythonpaths "/opt/dwh/airflow")
  (setq python-shell-interpreter "/home/leonardo/.pyenv/shims/python"
        python-shell-interpreter-args "-m IPython -i --simple-prompt"))

(use-package pyenv-mode
  :config
  (pyenv-mode))

(use-package pyenv-mode-auto)

(use-package py-isort)
  ;; :config
  ;; (add-hook 'before-save-hook 'py-isort-before-save))

(setenv "PYTHONPATH"
  (concat
   "/opt/dwh/airflow" ":"
   (getenv "PYTHONPATH")
  )
)

(provide 'setup-python2)
;;; setup-python2.el ends here
