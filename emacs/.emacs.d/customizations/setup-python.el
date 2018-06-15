;;; package --- Summary

;;; Commentary:
;;; Code:
;; (use-package elpy
;;   :config
;;   (elpy-enable)
;;   (setq python-shell-interpreter "ipython"
;;         python-shell-interpreter-args "-i --simple-prompt"))

(use-package anaconda-mode
  :config
  (add-to-list 'python-shell-extra-pythonpaths "/home/leonardo/workbench/cyclops")
  (add-hook 'python-mode-hook 'anaconda-mode))

(use-package company-anaconda
  :config
  (eval-after-load "company"
 '(add-to-list 'company-backends 'company-anaconda)))

(use-package pyenv-mode
  :config
  (pyenv-mode))

(use-package pyenv-mode-auto)

(provide 'setup-python)
;;; setup-python.el ends here
