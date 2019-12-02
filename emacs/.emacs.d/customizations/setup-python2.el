;;; package --- Summary

;;; Commentary:
;;; Code:
(use-package anaconda-mode
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-to-list 'python-shell-extra-pythonpaths "/opt/dwh/airflow")
  (add-to-list 'python-shell-extra-pythonpaths "/opt/playground/python/jupyter"))

(use-package conda
  :ensure t
  :init
  (setq conda-anaconda-home (expand-file-name "/anaconda3"))
  :config
  (conda-env-initialize-interactive-shells)
  (conda-env-initialize-eshell)
  (conda-env-autoactivate-mode t))

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
  ;; (setq python-shell-interpreter "/Users/leonardo.almeida/.pyenv/shims/python"
  (setq python-shell-interpreter-args "-m IPython -i --simple-prompt")
  :config
  ;; (global-set-key (kbd "C-c C-y") #'elpy-test-pytest-runner)
  (define-key elpy-mode-map (kbd "C-c C-y") 'elpy-test-pytest-runner))

  
(use-package pyenv-mode
  :config
  (pyenv-mode))

(setq flycheck-pylintrc "/opt/dwh/airflow/config/tox.ini")

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

(defun bg-python-mode-hook ()
  (define-key elpy-mode-map (kbd "C-c C-c") 'bg-elpy-shell-send-region-or-buffer))

(add-hook 'python-mode-hook 'bg-python-mode-hook)

(defun bg-elpy-shell-send-region-or-buffer (&optional arg)
  (interactive "P")
  (message "here")
  ;; Force the process to start completely by sitting a bit to avoid this warning:
  ;;
  ;;   Warning (python): Your ‘python-shell-interpreter’ doesn’t seem to support readline, yet ‘python-shell-completion-native-enable’ was t and "python" is not part of the ‘python-shell-completion-native-disabled-interpreters’ list.  Native completions have been disabled locally.
  ;;
  ;; Refer to https://github.com/jorgenschaefer/elpy/issues/887
  ;;
  (elpy-shell-get-or-create-process 1.101)
  (elpy-shell-send-region-or-buffer arg))


;; (use-package pipenv
;;   :hook (python-mode . pipenv-mode)
;;   :init
;;   (setq
;;    pipenv-projectile-after-switch-function
;;    #'pipenv-projectile-after-switch-extended))


(provide 'setup-python2)
;;; setup-python2.el ends here
