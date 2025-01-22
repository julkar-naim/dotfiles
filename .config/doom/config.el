
(setq doom-font (font-spec :family "Monaco" :size 15 :weight 'semi-light)
     doom-variable-pitch-font (font-spec :family "DejaVu Sans Mono" :size 14)
     doom-symbol-font (font-spec :family "Symbols Nerd Font" :size 14))
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/notes/")

(after! org
  ;; Resize Org headings
  (dolist (face '((org-level-1 . 1.35)
                  (org-level-2 . 1.3)
                  (org-level-3 . 1.2)
                  (org-level-4 . 1.1)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "Monaco" :weight 'bold :height (cdr face)))

  ;; Make the document title a bit bigger
  (set-face-attribute 'org-document-title nil :font "Monaco" :weight
                      'bold :height 1.8)
  ;; set org download dir
  )


(after! org-download
  (setq org-download-method 'directory)
  (setq org-download-image-dir (concat (file-name-sans-extension (buffer-file-name)) "-img"))
  ;; (setq org-download-image-org-width 600)
  (setq org-download-link-format "[[file:%s]]\n"
        org-download-abbreviate-filename-function #'file-relative-name)
  (setq org-download-link-format-function #'org-download-link-format-function-default))

(add-to-list 'default-frame-alist '(width . 160))
(add-to-list 'default-frame-alist '(height . 48))


