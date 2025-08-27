;; extends

; fix <style lang="postcss">
((style_element
  (start_tag
    (attribute
      (attribute_name) @attr
      (quoted_attribute_value
        (attribute_value) @value)))
  (raw_text) @injection.content)
 (#eq? @attr "lang")
 (#any-of? @value "postcss" "pcss")
 (#set! injection.language "css"))
