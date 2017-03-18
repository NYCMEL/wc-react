# ########################################################################### #
# TERMINAL TEXT COLORS
# ########################################################################### #
# Description:
#  This script contains console color codes defined in variables of a
#  namespace named 'ccolor'.
#  Additionally, it contains a procedure which replaces certain tags in a 
#  text with their corresponding color codes, making the resulting string 
#  suitable for dumping to a console supporting colors.
#  As a reference, the following table lists the escape codes used and their 
#  corresponding effect on the text (note: the '\e' sequence represents 
#  the '0x1b' hexadecimal number:
#  |-------------------|--------------------|------------------|
#  |Effects            |Foreground Colors   |Background Colors |
#  |-------------------|--------------------|------------------|
#  |bold       : \e[1m |black      : \e[30m |black   : \e[40m  |
#  |-------------------|--------------------|------------------|
#  |dim        : \e[2m |red        : \e[31m |red     : \e[41m  |
#  |-------------------|--------------------|------------------|
#  |underlined : \e[4m |green      : \e[32m |green   : \e[42m  |
#  |-------------------|--------------------|------------------|
#  |blink      : \e[5m |yellow     : \e[33m |yellow  : \e[43m  |
#  |-------------------|--------------------|------------------|
#  |reverse    : \e[7m |blue       : \e[34m |blue    : \e[44m  |
#  |-------------------|--------------------|------------------|
#  |invisible  : \e[8m |magenta    : \e[35m |magenta : \e[45m  |
#  |-------------------|--------------------|------------------|
#  |                   |cyan       : \e[36m |cyan    : \e[46m  |
#  |-------------------|--------------------|------------------|
#  |                   |white      : \e[37m |white   : \e[47m  |
#  |-------------------|--------------------|------------------|
#  |                   |default    : \e[39m |default : \e[49m  |
#  |-------------------|--------------------|------------------|
#
#  To reset the color codes:
#  - reset      : \e[0
#
# Examples:
#  puts [ccolor::replace "<b>Blue on a <by>yellow background</>."]
#  puts [ccolor::replace "<u><gb>Underline</> and <v><r>reverse</>."]
# ########################################################################### #
namespace eval ccolor {
  # To be used when the console has no color support #
  variable empty ""
  # The color reset code #
  variable reset   [binary format a4 \x1b\x5b\x30\x6d]
  # Helpful control characters #
  variable backspace [binary format a1 \x08]
  variable home      [binary format a1 \x0d]
  # Foreground #
  variable bold       [binary format a4 \x1b\x5b\x31\x6d]
  variable dim        [binary format a4 \x1b\x5b\x32\x6d]
  variable underlined [binary format a4 \x1b\x5b\x34\x6d]
  variable blink      [binary format a4 \x1b\x5b\x35\x6d]
  variable reverse    [binary format a4 \x1b\x5b\x37\x6d]
  variable invisible  [binary format a4 \x1b\x5b\x39\x6d]
  # Foreground colors #
  variable black   [binary format a5 \x1b\x5b\x33\x30\x6d]
  variable red     [binary format a5 \x1b\x5b\x33\x31\x6d]
  variable green   [binary format a5 \x1b\x5b\x33\x32\x6d]
  variable yellow  [binary format a5 \x1b\x5b\x33\x33\x6d]
  variable blue    [binary format a5 \x1b\x5b\x33\x34\x6d]
  variable magenta [binary format a5 \x1b\x5b\x33\x35\x6d]
  variable cyan    [binary format a5 \x1b\x5b\x33\x36\x6d]
  variable white   [binary format a5 \x1b\x5b\x33\x37\x6d]
  variable def     [binary format a5 \x1b\x5b\x33\x39\x6d]
  # Background colors #
  variable bblack   [binary format a5 \x1b\x5b\x34\x30\x6d]
  variable bred     [binary format a5 \x1b\x5b\x34\x31\x6d]
  variable bgreen   [binary format a5 \x1b\x5b\x34\x32\x6d]
  variable byellow  [binary format a5 \x1b\x5b\x34\x33\x6d]
  variable bblue    [binary format a5 \x1b\x5b\x34\x34\x6d]
  variable bmagenta [binary format a5 \x1b\x5b\x34\x35\x6d]
  variable bcyan    [binary format a5 \x1b\x5b\x34\x36\x6d]
  variable bwhite   [binary format a5 \x1b\x5b\x34\x37\x6d]
  variable bdef     [binary format a5 \x1b\x5b\x34\x39\x6d]
  # Variables for tags replacement and escaping #
  variable replacements
  variable escapes

  # ########################################################################### #
  # Description:
  #  This procedure checks if the console seems to have color support by 
  #  checking the 'tput' program.
  #  Additionally, it will set the 'escapes' and 'replacements' namespace 
  #  variables for later use by the 'ccolor::replace' procedure.
  # Parameters:
  #  None.
  # Returns:
  #  true : The console supports colors.
  #  flase : The console does not support colors.
  # ########################################################################### #
  proc initialize {} {
    variable replacements
    variable escapes

    # Make sure the namespace variables are reset in case this procedure is called more than once #
    set replacements [list]; set escapes [list];
    # If the 'tput' program does not exist or the shell does not seem to support colors #
    if {![file exists "/usr/bin/tput"] || [catch {exec /usr/bin/tput setaf 1}]} {
      # The tag letters will all be replaced by an empty string #
      set tagLettersAndVars {"e"  empty "s"  empty "u"  empty "f"  empty \
                             "v"  empty "i"  empty "k"  empty "r"  empty \
                             "g"  empty "y"  empty "b"  empty "m"  empty \
                             "c"  empty "w"  empty "d"  empty "kb" empty \
                             "rb" empty "gb" empty "yb" empty "bb" empty \
                             "mb" empty "cb" empty "wb" empty "db" empty \
                             "/"  empty "bs" empty "cr" empty}
      # Un-set the flag which indicates the console supports colors #
      set isColorSupported "false"
    # If colors are supported #
    } else {
      # The tag letters will be replaced by the values in the corresponding namespace variables #
      set tagLettersAndVars {"e"  bold      "s" dim       "u"  underlined "f"  blink   \
                             "v"  reverse  "i"  invisible "k"  black      "r"  red     \
                             "g"  green    "y"  yellow    "b"  blue       "m"  magenta \
                             "c"  cyan     "w"  white     "d"  def        "kb" bblack  \
                             "rb" bred     "gb" bgreen    "yb" byellow    "bb" bblue   \
                             "mb" bmagenta "cb" bcyan     "wb" bwhite     "db" bdef    \
                             "/"  reset    "bs" backspace "cr" home}
      # Set the flag which indicates the console supports colors #
      set isColorSupported "true"
    }
    # Go through each pair of <tag variable> values #
    foreach {tagLetters colorVar} $tagLettersAndVars {
      # Create a local variable linked to the namespace one #
      variable $colorVar
      # Append the escape pair to the list to be used when replacing escaped tags #
      lappend escapes "<<$tagLetters>" "<$tagLetters>"
      # Append the tag pair to the list to be used replacing tags by their codes #
      lappend replacements "<$tagLetters>" [set $colorVar]
    }
    # Return the flag indicating whether the console supports colors or not #
    return $isColorSupported
  }

  # ########################################################################### #
  # Description:
  #  This procedure will parse the given input text and will replace all tags 
  #  with the corresponding color code. The tags are:
  #    |---------------------|------------------|--------------------------|
  #    |Effects              |Foreground Colors |Background Colors         |
  #    |---------------------|------------------|--------------------------|
  #    |<e> : bold (Emphasis)|<k> : black       |<kb> : black background   |
  #    |---------------------|------------------|--------------------------|
  #    |<u> : underlined     |<r> : red         |<rb> : red background     |
  #    |---------------------|------------------|--------------------------|
  #    |<s> : dim (Shadow)   |<g> : green       |<gb> : green background   |
  #    |---------------------|------------------|--------------------------|
  #    |<f> : blink (Flash)  |<y> : yellow      |<yb> : yellow background  |
  #    |---------------------|------------------|--------------------------|
  #    |<v> : reVerse        |<b> : blue        |<bb> : blue background    |
  #    |---------------------|------------------|--------------------------|
  #    |<i> : invisible      |<m> : magenta     |<mb> : magenta background |
  #    |---------------------|------------------|--------------------------|
  #    |                     |<c> : cyan        |<cb> : cyan background    |
  #    |---------------------|------------------|--------------------------|
  #    |                     |<w> : white       |<wb> : white background   |
  #    |---------------------|------------------|--------------------------|
  #    |                     |<d> : default     |<db> : default background |
  #    |---------------------|------------------|--------------------------|
  #
  #  To reset text printing to its normal behavior, use:
  #   </> : reset
  #  If you want to keep one of these tags unchanged in your text, please 
  #  escape them by pre-pending an additional '<' character. For example:
  #   "The <<r> tag sets the text color to <r>red</>"
  #   "The <</> tag resets printed text to its normal behavior."
  #  Additional helpful control tags:
  #   <bs> : backspace
  #   <cr> : carriage return
  #  Examples of legal tagged text:
  #   "This text is <r>red</> and this one is <e><g>bold green</>."
  #   "<b>Blue on a <yb>yellow background</>."
  # ########################################################################### #
  proc replace {taggedText} {
    variable replacements
    variable escapes

    # Make sure the escaped tags do not get replaced #
    regsub -all -- "<<" $taggedText "<< " taggedText
    # Replace the tags by their color codes #
    set taggedText [string map $replacements $taggedText]
    # Re-establish the escaped tags #
    regsub -all -- "<< " $taggedText "<<" taggedText
    # Un-escape them and return the resulting text #
    return [string map $escapes $taggedText]
  }

  # Call the initialization procedure #
  initialize
}
