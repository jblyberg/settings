/**/**
 * Format a form item.
 *
 * @param \$element
 *   An associative array containing the properties of the element.
 *   Properties used:  title, value, description, required, error
 * @return
 *   A themed HTML string representing the form item.
 */
function ${1:phptemplate}_item(\$element) {
  return theme('form_element', \$element, \$element['#value'] . \$element['#children']);
}

$2