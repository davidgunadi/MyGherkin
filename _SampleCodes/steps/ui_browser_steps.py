from behave import when, then, given
from behave.runner import Context

from spec.ui_browser import spec
from util.runner import invoke_step
from util.spec import ManualExecutionError


@given(r'browser ([^\sa-zA-Z0-9])(?P<browser>Chrome|Firefox|Internet Explorer)(\1)(?: ([^\sa-zA-Z0-9])(?P<version>(?:(?!\4).)*)(\4))?(?: as ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\7).)*)(\7))?')
@spec.behave_step
def browser_browser_version_as_driver(context: Context, *args, **kwargs):
    """
        browser "<browser>" ["<version>"] [as "<ui driver instance id>"]
        Browsers only

        * <browser> (required): "Chrome", "Firefox", "Internet Explorer".
        * <version> (optional): depends on chosen browser, latest stable by default
        * <ui driver instance id> (optional): a shortcut to this connection, "app" by default
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].browser_browser_version_as_driver, **kwargs)


@given(r'UI connection to ([^\sa-zA-Z0-9])(?P<envhost>(?:(?!\1).)*)(\1)(?: as ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def ui_connection_to_envhost_as_driver(context: Context, *args, **kwargs):
    """
        UI connection to "<envhost>" [as "<ui driver instance id>"]
        GUI applications only

        * <envhost> (required): environment where to run the application
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].ui_connection_to_envhost_as_driver, **kwargs)


@when(r'I open ([^\sa-zA-Z0-9])(?P<url>(?:(?!\1).)*)(\1)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def i_open_url_in_driver(context: Context, *args, **kwargs):
    """
        I open "<URL>" [in "<ui driver instance id>"]
        Browsers only

        * <URL> (required): URL of page to open
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].i_open_url_in_driver, **kwargs)


@when(r'I run application ([^\sa-zA-Z0-9])(?P<application>(?:(?!\1).)*)(\1)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def i_run_application_application_in_driver(context: Context, *args, **kwargs):
    """
        I run application "<application>" [in "<ui driver instance id>"]
        GUI applications only

        * <application> (required): application path to run
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].i_run_application_application_in_driver, **kwargs)


@when(r'I switch to main window(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\1).)*)(\1))?')
@spec.behave_step
def i_switch_to_main_window_in_driver(context: Context, *args, **kwargs):
    """
        I switch to main window [in "<ui driver instance id>"]

        * <ui driver instance id> (optional): application connection, "app" by default
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].i_switch_to_main_window_in_driver, **kwargs)


@when(r'I switch to window ([^\sa-zA-Z0-9])(?P<window_name>(?:(?!\1).)*)(\1)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def i_switch_to_window_window_name_in_driver(context: Context, *args, **kwargs):
    """
        I switch to window "<window name>" [in "<ui driver instance id>"]

        * <window name> (required): window name to switch
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].i_switch_to_window_window_name_in_driver, **kwargs)


@when(r'I close the main window(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\1).)*)(\1))?')
@spec.behave_step
def i_close_the_main_window_in_driver(context: Context, *args, **kwargs):
    """
        I close the main window [in "<ui driver instance id>"]

        <ui driver instance id> (optional): application connection, "app" by default
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].i_close_the_main_window_in_driver, **kwargs)


@when(r'I close the window ([^\sa-zA-Z0-9])(?P<window_name>(?:(?!\1).)*)(\1)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def i_close_the_window_window_name_in_driver(context: Context, *args, **kwargs):
    """
        I close the window "<window name>" [in "<ui driver instance id>"]

        * <window name> (required): a name for ui window
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].i_close_the_window_window_name_in_driver, **kwargs)


@when(r'I close all windows(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\1).)*)(\1))?')
@spec.behave_step
def i_close_all_windows_in_driver(context: Context, *args, **kwargs):
    """
         I close all windows [in "<ui driver instance id>"]

        * <ui driver instance id> (optional): application connection, "app" by default
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].i_close_all_windows_in_driver, **kwargs)


@when(r'I (?P<action>click|double click|right click|hover|focus|tap) on ([^\sa-zA-Z0-9])(?P<selector>(?:(?!\2).)*)(\2)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\5).)*)(\5))?')
@spec.behave_step
def i_action_on_selector_in_driver(context: Context, *args, **kwargs):
    """
        I <action> on "<selector>" [in "<ui driver instance id>"]

        * <action> (required): "click", "double click", "right click", "hover", "focus","tap"
        * <selector> (required): DOM selector id from preconditions
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].i_action_on_selector_in_driver, **kwargs)


@when(r'I (?P<action>set|append|prepend) ([^\sa-zA-Z0-9])(?P<value>(?:(?!\2).)*)(\2) to ([^\sa-zA-Z0-9])(?P<selector>(?:(?!\5).)*)(\5) attribute ([^\sa-zA-Z0-9])(?P<attribute>(?:(?!\8).)*)(\8)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\11).)*)(\11))?')
@spec.behave_step
def i_action_value_to_selector_attribute_attribute_in_driver(context: Context, *args, **kwargs):
    """
        I <action> "<value>" to "<selector>" attribute "<attribute>" [in "<ui driver instance id>"]
        Browser only

        * <action> (required): "set", "append", "prepend"
        * <value> (required): value to append
        * <selector> (required): DOM selector id from preconditions
        * <attribute> (required): element attribute name
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].i_action_value_to_selector_attribute_attribute_in_driver, **kwargs)


@when(r'I (?P<action>set|append|prepend) ([^\sa-zA-Z0-9])(?P<value>(?:(?!\2).)*)(\2) to ([^\sa-zA-Z0-9])(?P<selector>(?:(?!\5).)*)(\5) value(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\8).)*)(\8))?')
@spec.behave_step
def i_action_value_to_selector_value_in_driver(context: Context, *args, **kwargs):
    """
        I <action> "<value>" to "<selector>" value [in "<ui driver instance id>"]
        Browser only

        It's a shortcut for "I <action> "<value>" to "<selector" attribute "value" [in "<ui driver instance id>"]
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].i_action_value_to_selector_value_in_driver, **kwargs)


@when(r'I set ([^\sa-zA-Z0-9])(?P<selector>(?:(?!\1).)*)(\1) value to ([^\sa-zA-Z0-9])(?P<value>(?:(?!\4).)*)(\4)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\7).)*)(\7))?')
@spec.behave_step
def i_set_selector_value_to_value_in_driver(context: Context, *args, **kwargs):
    """
        I set "<selector>" value to "<value>" [in "<ui driver instance id>"]
        GUI applications only

        * <selector> (required): selector id from preconditions
        * <value> (required): value to set
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].i_set_selector_value_to_value_in_driver, **kwargs)


@when(r'I (?P<action>append|prepend) ([^\sa-zA-Z0-9])(?P<value>(?:(?!\2).)*)(\2) to ([^\sa-zA-Z0-9])(?P<selector>(?:(?!\5).)*)(\5)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\8).)*)(\8))?')
@spec.behave_step
def i_action_value_to_selector_in_driver(context: Context, *args, **kwargs):
    """
        I <action> "<value>" to "<selector>" [in "<ui driver instance id>"]
        GUI applications only

        * <action> (required): "append", "prepend"
        * <value> (required): value to append
        * <selector> (required): DOM selector id from preconditions
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].i_action_value_to_selector_in_driver, **kwargs)


@when(r'I ([^\sa-zA-Z0-9])(?P<state>check|uncheck)(\1) ([^\sa-zA-Z0-9])(?P<selector>(?:(?!\4).)*)(\4) checkbox(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\7).)*)(\7))?')
@spec.behave_step
def i_state_selector_checkbox_in_driver(context: Context, *args, **kwargs):
    """
        I "<state>" "<selector>" checkbox [in "<ui driver instance id>"]

        * <state> (required): "check", "uncheck".
        * <selector> (required): DOM selector id from preconditions
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].i_state_selector_checkbox_in_driver, **kwargs)


@when(r'I wait while ([^\sa-zA-Z0-9])(?P<selector>(?:(?!\1).)*)(\1) appears(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def i_wait_while_selector_appears_in_driver(context: Context, *args, **kwargs):
    """
        I wait while "<selector>" appears [in "<ui driver instance id>"]

        * <selector> (required): DOM selector id from preconditions
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].i_wait_while_selector_appears_in_driver, **kwargs)


@when(r'I wait unless ([^\sa-zA-Z0-9])(?P<selector>(?:(?!\1).)*)(\1) appears(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def i_wait_unless_selector_appears_in_driver(context: Context, *args, **kwargs):
    """
        I wait unless "<selector>" appears [in "<ui driver instance id>"]

        * <selector> (required): DOM selector id from preconditions
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].i_wait_unless_selector_appears_in_driver, **kwargs)


@when(r'I scroll ([^\sa-zA-Z0-9])(?P<direction>up|down|left|right)(\1)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def i_scroll_direction_in_driver(context: Context, *args, **kwargs):
    """
        I scroll "<direction>" [in "<ui driver instance id>"]

        * <direction> (required): "up", "down", "left", "right"
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].i_scroll_direction_in_driver, **kwargs)


@when(r'I(?: (?P<long>long))? press ([^\sa-zA-Z0-9])(?P<key>(?:(?!\2).)*)(\2)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\5).)*)(\5))?')
@spec.behave_step
def i_long_press_key_in_driver(context: Context, *args, **kwargs):
    """
        I [<long>] press "<key>" [in "<ui driver instance id>"]

        * <long> (optional): indicates a long press. Single valued: “long”
        * <key> (required): a key (use + to combine several keys) to emulate pressing; for special keys please use:
            * UP, DOWN, LEFT, RIGHT - arrow keys
            * SHIFT, ALT, CTRL - common special keys
            * WIN, CMD, OPTION - OS specific special keys
            * if it's possible to differentiate key side (left or right), add L or R prefix (LALT, RSHIFT)
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].i_long_press_key_in_driver, **kwargs)


@when(r'I type ([^\sa-zA-Z0-9])(?P<keystring>(?:(?!\1).)*)(\1)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def i_type_keystring_in_driver(context: Context, *args, **kwargs):
    """
        I type "<keystring>" [in "<ui driver instance id>"]

        * <keystring> (required): a string of keys to press
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].i_type_keystring_in_driver, **kwargs)


@when(r'I drag ([^\sa-zA-Z0-9])(?P<element>(?:(?!\1).)*)(\1) and drop it into ([^\sa-zA-Z0-9])(?P<container>(?:(?!\4).)*)(\4)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\7).)*)(\7))?')
@spec.behave_step
def i_drag_element_and_drop_it_into_container_in_driver(context: Context, *args, **kwargs):
    """
        I drag "<element>" and drop it into "<container>" [in "<ui driver instance id>"]

        * <element> (required): selector id of element for drag and drop operation
        * <container> (required): selector id of container to drop dragging element
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].i_drag_element_and_drop_it_into_container_in_driver, **kwargs)


@when(r'I handle captcha in ([^\sa-zA-Z0-9])(?P<selector>(?:(?!\1).)*)(\1)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def i_handle_captcha_in_selector_in_driver(context: Context, *args, **kwargs):
    """
        I handle captcha in "<selector>" [in "<ui driver instance id>"]

        NB: there is no way to handle captcha automatically, automatic execution will always fail and scenario should
        be marked for manual testing explicitly

        * <selector> (required): selector id of captcha container
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    raise ManualExecutionError()


@when(r'I ([^\sa-zA-Z0-9])(?P<action>pull to refresh|swipe from left|swipe from right)(\1)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def i_action_in_driver(context: Context, *args, **kwargs):
    """
        I "<screen action>" [in "<ui driver instance id>"]
        GUI applications only

        * <screen action> (required): "pull to refresh", "swipe from left", "swipe from right"
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].i_action_in_driver, **kwargs)


@when(r'I copy file from ([^\sa-zA-Z0-9])(?P<source_file>(?:(?!\1).)*)(\1) to ([^\sa-zA-Z0-9])(?P<destination_file>(?:(?!\4).)*)(\4)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\7).)*)(\7))?')
@spec.behave_step
def i_copy_file_from_source_file_to_destination_file_in_driver(context: Context, *args, **kwargs):
    """
        I copy file from "<source_file>" to "<destination_file>" [in "<ui driver instance id>"]

        * <source_file> (required): source file name
        * <destination_file> (required): destination file name
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    raise ManualExecutionError()


@when(r'I move file from ([^\sa-zA-Z0-9])(?P<source_file>(?:(?!\1).)*)(\1) to ([^\sa-zA-Z0-9])(?P<destination_file>(?:(?!\4).)*)(\4)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\7).)*)(\7))?')
@spec.behave_step
def i_move_file_from_source_file_to_destination_file_in_driver(context: Context, *args, **kwargs):
    """
        I move file from "<source_file>" to "<destination_file>" [in "<ui driver instance id>"]

        * <source_file> (required): source file name
        * <destination_file> (required): destination file name
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    raise ManualExecutionError()


@when(r'I delete file ([^\sa-zA-Z0-9])(?P<file>(?:(?!\1).)*)(\1)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def i_delete_file_file_in_driver(context: Context, *args, **kwargs):
    """
        I delete file "<file>" [in "<ui driver instance id>"]

        * <file> (required): file name to delete
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    raise ManualExecutionError()


@then(r'I should see ([^\sa-zA-Z0-9])(?P<value>(?:(?!\1).)*)(\1) in ([^\sa-zA-Z0-9])(?P<selector>(?:(?!\4).)*)(\4)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\7).)*)(\7))?')
@spec.behave_step
def i_should_see_value_in_selector_in_driver(context: Context, *args, **kwargs):
    """
        I should see "<value>" in "<selector>" [in "<ui driver instance id>"]

        * <value> (required): expected value of element
        * <selector> (required): Selenium selector for an element
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].i_should_see_value_in_selector_in_driver, **kwargs)


@then(r'I should see text in ([^\sa-zA-Z0-9])(?P<selector>(?:(?!\1).)*)(\1)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?[:]?')
@spec.behave_step
def i_should_see_text_in_selector_in_driver(context: Context, *args, **kwargs):
    """
        I should see text in "<selector>" [in "<ui driver instance id>"]:
        \"""
        <text>
        \"""

        * <text> (required): expected value of element
        * <selector> (required): Selenium selector for an element
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    kwargs['text'] = context.text
    invoke_step(context.e2e, context.spec['UiBrowser'].i_should_see_text_in_selector_in_driver, **kwargs)


@then(r'([^\sa-zA-Z0-9])(?P<selector>(?:(?!\1).)*)(\1) should(?: (?P<not_displayed>not))? be displayed(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\5).)*)(\5))?')
@spec.behave_step
def selector_should_not_displayed_be_displayed_in_driver(context: Context, *args, **kwargs):
    """
        "<selector>" should [not] be displayed [in "<ui driver instance id>"]

        * <selector> (required): Selenium selector for an element
        * <ui driver instance id> (optional): ui connection, "app" by default
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].selector_should_not_displayed_be_displayed_in_driver, **kwargs)


@then(r'([^\sa-zA-Z0-9])(?P<window>(?:(?!\1).)*)(\1) window should be displayed(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def window_window_should_be_displayed_in_driver(context: Context, *args, **kwargs):
    """
        "<window>" window should be displayed [in "<ui driver instance id>"]
        GUI applications only

        Checks that application window has defined title.
        <window> (required): page title
        <ui driver instance id> (optional): application connection, "app" by default
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].window_window_should_be_displayed_in_driver, **kwargs)


@then(r'([^\sa-zA-Z0-9])(?P<page>(?:(?!\1).)*)(\1) page should be displayed(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def page_page_should_be_displayed_in_driver(context: Context, *args, **kwargs):
    """
        "<page>" page should be displayed [in "<ui driver instance id>"]
        Browsers only
        Checks that page has defined title.

        * <page> (required): page title
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].page_page_should_be_displayed_in_driver, **kwargs)


@then(r'I see window identified by ([^\sa-zA-Z0-9])(?P<selector>(?:(?!\1).)*)(\1) as ([^\sa-zA-Z0-9])(?P<window_name>(?:(?!\4).)*)(\4)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\7).)*)(\7))?')
@spec.behave_step
def i_see_window_identified_by_selector_as_window_name_in_driver(context: Context, *args, **kwargs):
    """
        I see window identified by "<selector>" as "<window name>" [in "<ui driver instance id>"]

        Windows are being switched during while waiting for the window and a window with the selector is activated.

        * <selector> (required): Selenium selector id for an element
        * <window name> (required): variable name to store extracted value
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].i_see_window_identified_by_selector_as_window_name_in_driver, **kwargs)


@then(r'the file ([^\sa-zA-Z0-9])(?P<filename>(?:(?!\1).)*)(\1) should be downloaded(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def the_file_filename_should_be_downloaded_in_driver(context: Context, *args, **kwargs):
    """
        the file "<filename>" should be downloaded [in "<ui driver instance id>"]
        Browsers only
        N.B. Sentence doesn't download the file, only checks it in the download folder according to the current browser
        (identified by ui driver instance id).

        * <filename> (required): name of file which should be downloaded
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    raise ManualExecutionError()


@then(r'I see simple notification ([^\sa-zA-Z0-9])(?P<title>(?:(?!\1).)*)(\1)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def i_see_simple_notification_title_in_driver(context: Context, *args, **kwargs):
    """
        I see simple notification "<title>" [in "<ui driver instance id>"]
        Mobile only

        https://medium.com/appium-tips/how-to-handle-push-notification-in-appium-2a038885ad01

        * <title> (required): the title of simple notification
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    raise ManualExecutionError()


@then(r'I put a value from(?: ([^\sa-zA-Z0-9])(?P<attribute>(?:(?!\1).)*)(\1) attribute of)? ([^\sa-zA-Z0-9])(?P<selector>(?:(?!\4).)*)(\4)(?: in ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\7).)*)(\7))? into ([^\sa-zA-Z0-9])(?P<variable>(?:(?!\10).)*)(\10)')
@spec.behave_step
def i_put_a_value_from_attribute_attribute_of_selector_in_driver_into_variable(context: Context, *args, **kwargs):
    """
        I put a value from ["<attribute>" attribute of] "<selector>" [in "<ui driver instance id>"] into "<variable>"

        * <attribute> (optional): element attribute name
        * <selector> (required): Selenium selector id for an element
        * <variable> (required): variable name to store extracted value
        * <ui driver instance id> (optional): application connection, "app" by default
        """
    invoke_step(context.e2e, context.spec['UiBrowser'].i_put_a_value_from_attribute_attribute_of_selector_in_driver_into_variable, **kwargs)
