;;; package --- Summary

;;; Commentary:
;;; Code:
(use-package elpy
  :config
  (elpy-enable)
  (setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")
  )

(use-package pyenv-mode
  :config
  (pyenv-mode))

(use-package pyenv-mode-auto)

(provide 'setup-python)
;;; setup-python.el ends here
