;;; package --- Summary

;;; Commentary:
;;; Code:

;; set key for agenda
(global-set-key (kbd "C-c a") 'org-agenda)

;;file to save todo items
(setq org-agenda-files (quote ("~/org/tasks.org" "~/org/personal.org")))

;; Recording close time
(setq org-log-done 'time)

(setq org-todo-keywords
      '((sequence "TODO" "BLOCKED"  "DOING" "REVIEW" "|" "DONE" "CANCELED")))

(setq org-todo-keyword-faces
      '(("TODO" . org-warning)
        ("BLOCKED" . "red")
        ("DOING" . "yellow")
        ("REVIEW" . "blue")
        ("CANCELED" . (:foreground "orange" :weight bold))))

(use-package org-jira
  :config
  (setq jiralib-url "https://emesadev.atlassian.net"))

(provide 'org-config)
;;; org-config.el ends here
