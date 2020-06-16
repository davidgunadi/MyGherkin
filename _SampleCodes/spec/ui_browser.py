from driver.UiBrowserDriver import BrowserDriver, AppDriver, UiDriver
from util.spec import Spec, UseDriverArgument, EnumArgument, Argument, InitDriverArgument, MultilineTextArgument, \
    SelectorArgument, AnonymousBooleanArgument

spec = Spec('Browser/GUI',
            spec_id='UiBrowser',
            imports="""
                from typing import Optional
                from driver.UiBrowserDriver import BrowserDriver, UiDriver, AppDriver
                from util.spec import Selector
            """)
given = spec.given
when = spec.when
then = spec.then


def app_driver_arg():
    return UseDriverArgument('application connection, "app" by default', AppDriver)


def browser_driver_arg():
    return UseDriverArgument('application connection, "app" by default', BrowserDriver)


def ui_driver_arg():
    return UseDriverArgument('application connection, "app" by default', UiDriver)


given(
    'browser "<browser>" ["<version>"] [as "<ui driver instance id>"]',
    args={
        'browser': Argument('for example, "Chrome", "Firefox", "Internet Explorer".'),
        'version': Argument('depends on chosen browser, latest stable by default'),
        'ui driver instance id': InitDriverArgument('a shortcut to this connection, "app" by default', BrowserDriver),
    },
    doc="""
        browser "<browser>" ["<version>"] [as "<ui driver instance id>"]
        Browsers only

        * <browser> (required): for example, "Chrome", "Firefox", "Internet Explorer".
        * <version> (optional): depends on chosen browser, latest stable by default
        * <ui driver instance id> (optional): a shortcut to this connection, "app" by default
        """
)


given(
    'UI connection to "<endpoint>" [as "<ui driver instance id>"]',
    args={
        'endpoint': Argument('environment where to run the application'),
        'ui driver instance id': InitDriverArgument('application connection, "app" by default', UiDriver),
    },
    doc="""
        UI connection to "<endpoint>" [as "<ui driver instance id>"]
        GUI applications only

        * <endpoint> (required): environment where to run the application
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


when(
    'I open "<URL>" [in "<ui driver instance id>"]',
    args={
        'URL': Argument('URL of page to open', 'url'),
        'ui driver instance id': browser_driver_arg(),
    },
    doc="""
        I open "<URL>" [in "<ui driver instance id>"]
        Browsers only

        * <URL> (required): URL of page to open
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


when(
    'I run application "<application>" [in "<ui driver instance id>"]',
    args={
        'application': Argument('application path to run'),
        'ui driver instance id': ui_driver_arg(),
    },
    doc="""
        I run application "<application>" [in "<ui driver instance id>"]
        GUI applications only

        * <application> (required): application path to run
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


when(
    'I switch to window "<window name>" [in "<ui driver instance id>"]',
    args={
        'window name': Argument('window name to switch', 'window_name'),
        'ui driver instance id': app_driver_arg(),
    },
    doc="""
        I switch to window "<window name>" [in "<ui driver instance id>"]

        * <window name> (required): window name to switch
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


when(
    'I <action> <window_index> window [and close <others>] [in "<ui driver instance id>"]',
    args={
        'action': EnumArgument('', ['switch to', 'close']),
        'window_index': EnumArgument('', ['main', 'first', 'second', 'third', 'fourth', 'fifth']),
        'others': EnumArgument('', ['others']),
        'ui driver instance id': browser_driver_arg()
    },
    doc="""
        I switch to <window_index> window [in "<ui driver instance id>"]
        switch to window by index, and optionally close other windows.

        * <action> (required): 'switch to', 'close'
        * <window_index> (required): the index of the window to switch to: first, second, ..., fifth.
        * <others> (optional): other windows to close.
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


when(
    'I close the main window [in "<ui driver instance id>"]',
    args={
        'ui driver instance id': app_driver_arg(),
    },
    doc="""
        I close the main window [in "<ui driver instance id>"]

        <ui driver instance id> (optional): application connection, "app" by default
        """
)


when(
    'I close the window "<window name>" [in "<ui driver instance id>"]',
    args={
        'window name': Argument('a name for ui window', 'window_name'),
        'ui driver instance id': app_driver_arg(),
    },
    doc="""
        I close the window "<window name>" [in "<ui driver instance id>"]

        * <window name> (required): a name for ui window
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


when(
    'I close all windows [in "<ui driver instance id>"]',
    args={
        'ui driver instance id': app_driver_arg(),
    },
    doc="""
         I close all windows [in "<ui driver instance id>"]

        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


when(
    'I <action> on "<selector>" [in "<ui driver instance id>"]',
    args={
        'action': EnumArgument(
            '',
            ['click', 'double click', 'right click', 'hover', 'focus', 'tap', 'mouse down', 'mouse up']
        ),
        'selector': SelectorArgument('DOM selector id from preconditions'),
        'ui driver instance id': app_driver_arg(),
    },
    doc="""
        I <action> on "<selector>" [in "<ui driver instance id>"]

        * <action> (required): "click", "double click", "right click", "hover", "focus","tap", "mouse down", "mouse up"
        * <selector> (required): DOM selector id from preconditions
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


when(
    'I <action> "<value>" to "<selector>" attribute "<attribute>" [in "<ui driver instance id>"]',
    args={
        'action': EnumArgument('', ['set', 'append', 'prepend']),
        'value': Argument('value to append', can_be_empty=True),
        'selector': SelectorArgument('DOM selector id from preconditions'),
        'attribute': Argument('element attribute name'),
        'ui driver instance id': browser_driver_arg(),
    },
    doc="""
        I <action> "<value>" to "<selector>" attribute "<attribute>" [in "<ui driver instance id>"]
        Browser only

        * <action> (required): "set", "append", "prepend"
        * <value> (required): value to append
        * <selector> (required): DOM selector id from preconditions
        * <attribute> (required): element attribute name
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


when(
    'I <action> "<value>" to "<selector>" value [in "<ui driver instance id>"]',
    args={
        'action': EnumArgument('', ['set', 'append', 'prepend']),
        'value': Argument('value to append', can_be_empty=True),
        'selector': SelectorArgument('DOM selector id from preconditions'),
        'ui driver instance id': browser_driver_arg(),
    },
    doc="""
        I <action> "<value>" to "<selector>" value [in "<ui driver instance id>"]
        Browser only

        It's a shortcut for "I <action> "<value>" to "<selector" attribute "value" [in "<ui driver instance id>"]
        """
)


when(
    'I set "<selector>" value to "<value>" [in "<ui driver instance id>"]',
    args={
        'selector': SelectorArgument('selector id from preconditions'),
        'value': Argument('value to set', can_be_empty=True),
        'ui driver instance id': app_driver_arg(),
    },
    doc="""
        I set "<selector>" value to "<value>" [in "<ui driver instance id>"]

        * <selector> (required): selector id from preconditions
        * <value> (required): value to set
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


when(
    'I <action> "<value>" to "<selector>" [in "<ui driver instance id>"]',
    args={
        'action': EnumArgument('', ['append', 'prepend']),
        'value': Argument('value to append'),
        'selector': SelectorArgument('DOM selector id from preconditions'),
        'ui driver instance id': ui_driver_arg(),
    },
    doc="""
        I <action> "<value>" to "<selector>" [in "<ui driver instance id>"]
        GUI applications only

        * <action> (required): "append", "prepend"
        * <value> (required): value to append
        * <selector> (required): DOM selector id from preconditions
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


when(
    'I "<state>" "<selector>" checkbox [in "<ui driver instance id>"]',
    args={
        'state': EnumArgument('', ['check', 'uncheck']),
        'selector': SelectorArgument('DOM selector id from preconditions'),
        'ui driver instance id': app_driver_arg(),
    },
    doc="""
        I "<state>" "<selector>" checkbox [in "<ui driver instance id>"]

        * <state> (required): "check", "uncheck".
        * <selector> (required): DOM selector id from preconditions
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


when(
    'I wait while "<selector>" appears [in "<ui driver instance id>"]',
    args={
        'selector': SelectorArgument('DOM selector id from preconditions'),
        'ui driver instance id': app_driver_arg(),
    },
    doc="""
        I wait while "<selector>" appears [in "<ui driver instance id>"]

        * <selector> (required): DOM selector id from preconditions
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


when(
    'I wait unless "<selector>" appears [in "<ui driver instance id>"]',
    args={
        'selector': SelectorArgument('DOM selector id from preconditions'),
        'ui driver instance id': app_driver_arg(),
    },
    doc="""
        I wait unless "<selector>" appears [in "<ui driver instance id>"]

        * <selector> (required): DOM selector id from preconditions
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


when(
    'I scroll "<direction>" [in "<ui driver instance id>"]',
    args={
        'direction': EnumArgument('', ['up', 'down', 'left', 'right']),
        'ui driver instance id': app_driver_arg(),
    },
    doc="""
        I scroll "<direction>" [in "<ui driver instance id>"]

        * <direction> (required): "up", "down", "left", "right"
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


when(
    'I scroll to the element "<selector>" [in "<ui driver instance id>"]',
    args={
        'selector': SelectorArgument('DOM selector id from preconditions'),
        'ui driver instance id': app_driver_arg(),
    },
    doc="""
        I scroll to the element "<selector>" [in "<ui driver instance id>"]

        * <selector> (required): DOM selector id from preconditions
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


when(
    'I [<long>] press "<key>" [in "<ui driver instance id>"]',
    args={
        'long': EnumArgument('indicates a long press. Single valued: “long”', ['long']),
        'key': Argument('a key'),
        'ui driver instance id': app_driver_arg(),
    },
    doc="""
        I [<long>] press "<key>" [in "<ui driver instance id>"]

        * <long> (optional): indicates a long press. Single valued: “long”
        * <key> (required): a key (use + to combine several keys) to emulate pressing; for special keys please use:
            * UP, DOWN, LEFT, RIGHT - arrow keys
            * SHIFT, ALT, CTRL - common special keys
            * WIN, CMD, OPTION - OS specific special keys
            * if it's possible to differentiate key side (left or right), add L or R prefix (LALT, RSHIFT)
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


when(
    'I type [slowly] "<keystring>" [in "<ui driver instance id>"]',
    args={
        'slowly': AnonymousBooleanArgument('a flag to add delay after sending each character'),
        'keystring': Argument('a string of keys to press'),
        'ui driver instance id': app_driver_arg(),
    },
    doc="""
        I type [slowly] "<keystring>" [in "<ui driver instance id>"]

        * <slowly> (optional): a flag to add delay after sending each character
        * <keystring> (required): a string of keys to press
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


when(
    'I drag "<element>" and drop it into "<container>" [in "<ui driver instance id>"]',
    args={
        'element': SelectorArgument('selector id of element for drag and drop operation'),
        'container': SelectorArgument('selector id of container to drop dragging element'),
        'ui driver instance id': app_driver_arg(),
    },
    doc="""
        I drag "<element>" and drop it into "<container>" [in "<ui driver instance id>"]

        * <element> (required): selector id of element for drag and drop operation
        * <container> (required): selector id of container to drop dragging element
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


when(
    'I handle captcha in "<selector>" [in "<ui driver instance id>"]',
    manual_execution=True,
    args={
        'selector': SelectorArgument('selector id of element for drag and drop operation'),
        'ui driver instance id': app_driver_arg(),
    },
    doc="""
        I handle captcha in "<selector>" [in "<ui driver instance id>"]

        NB: there is no way to handle captcha automatically, automatic execution will always fail and scenario should
        be marked for manual testing explicitly

        * <selector> (required): selector id of captcha container
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


when(
    'I "<screen action>" [in "<ui driver instance id>"]',
    args={
        'screen action': EnumArgument('', ['pull to refresh', 'swipe from left', 'swipe from right'], 'action'),
        'ui driver instance id': ui_driver_arg(),
    },
    doc="""
        I "<screen action>" [in "<ui driver instance id>"]
        GUI applications only

        * <screen action> (required): "pull to refresh", "swipe from left", "swipe from right"
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


when(
    'I copy file from "<source_file>" to "<destination_file>" [in "<ui driver instance id>"]',
    args={
        'source_file': Argument('source file name'),
        'destination_file': Argument('destination file name'),
        'ui driver instance id': app_driver_arg()
    },
    manual_execution=True,
    doc="""
        I copy file from "<source_file>" to "<destination_file>" [in "<ui driver instance id>"]

        * <source_file> (required): source file name
        * <destination_file> (required): destination file name
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


when(
    'I move file from "<source_file>" to "<destination_file>" [in "<ui driver instance id>"]',
    args={
        'source_file': Argument('source file name'),
        'destination_file': Argument('destination file name'),
        'ui driver instance id': app_driver_arg()
    },
    manual_execution=True,
    doc="""
        I move file from "<source_file>" to "<destination_file>" [in "<ui driver instance id>"]

        * <source_file> (required): source file name
        * <destination_file> (required): destination file name
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


when(
    'I delete file "<file>" [in "<ui driver instance id>"]',
    manual_execution=True,
    args={
        'file': Argument('file name to delete'),
        'ui driver instance id': app_driver_arg()
    },
    doc="""
        I delete file "<file>" [in "<ui driver instance id>"]

        * <file> (required): file name to delete
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)

when(
    'I accept the alert box [by clicking on "<value>"] [in "<ui driver instance id>"]',
    args={
        'value': Argument('text displayed on the button to be clicked to accept the alert box'),
        'ui driver instance id': app_driver_arg()
    },
    doc="""
        I accept the alert box [by clicking on "<value>"] [in "<ui driver instance id>"]

        * <value> (optional): text displayed on the button to be clicked to accept the alert box
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)

when(
    'I dismiss the alert box [by clicking on "<value>"] [in "<ui driver instance id>"]',
    args={
        'value': Argument('text displayed on the button to be clicked to dismiss the alert box'),
        'ui driver instance id': app_driver_arg()
    },
    doc="""
        I dismiss the alert box [by clicking on "<value>"] [in "<ui driver instance id>"]

        * <value> (optional): text displayed on the button to be clicked to dismiss the alert box
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)

then(
    'I should see "<value>" in "<selector>" [in "<ui driver instance id>"]',
    args={
        'value': Argument('expected value of element', can_be_empty=True),
        'selector': SelectorArgument('Selenium selector for an element'),
        'ui driver instance id': app_driver_arg(),
    },
    doc="""
        I should see "<value>" in "<selector>" [in "<ui driver instance id>"]

        * <value> (required): expected value of element
        * <selector> (required): Selenium selector for an element
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)

then(
    'I should see value matches "<value>" in "<selector>" [in "<ui driver instance id>"]',
    args={
        'value': Argument('expected regex pattern of element', can_be_empty=True),
        'selector': SelectorArgument('Selenium selector for an element'),
        'ui driver instance id': browser_driver_arg(),
    },
    doc="""
        I should see value matches "<value>" in "<selector>" [in "<ui driver instance id>"]

        * <value> (required): expected regex pattern of element value
        * <selector> (required): Selenium selector for an element
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


then(
    'I should see text in "<selector>" [in "<ui driver instance id>"]:',
    args={
        'selector': SelectorArgument('Selenium selector for an element'),
        'ui driver instance id': app_driver_arg(),
        'text': MultilineTextArgument('expected value of element')
    },
    doc="""
        I should see text in "<selector>" [in "<ui driver instance id>"]:
        \"""
        <text>
        \"""

        * <text> (required): expected value of element
        * <selector> (required): Selenium selector for an element
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


then(
    '"<selector>" should [not] be displayed [in "<ui driver instance id>"]',
    args={
        'selector': SelectorArgument('Selenium selector id for an element'),
        'not': AnonymousBooleanArgument('negates the sentence. Single valued: “not”', name='is_not'),
        'ui driver instance id': app_driver_arg(),
    },
    doc="""
        "<selector>" should [not] be displayed [in "<ui driver instance id>"]

        * <selector> (required): Selenium selector for an element
        * <ui driver instance id> (optional): ui connection, "app" by default
        """
)


then(
    '"<window>" window should [<not>] be displayed [in "<ui driver instance id>"]',
    args={
        'window': Argument('page title'),
        'not': EnumArgument('negates the sentence. Single valued: “not”', ['not'], name='not_displayed'),
        'ui driver instance id': ui_driver_arg(),
    },
    doc="""
        "<window>" window should [not] be displayed [in "<ui driver instance id>"]
        GUI applications only

        Checks that application window has defined title.
        <window> (required): page title
        <ui driver instance id> (optional): application connection, "app" by default
        """
)


then(
    '"<page>" page should be displayed [in "<ui driver instance id>"]',
    args={
        'page': Argument('page title', can_be_empty=True),
        'ui driver instance id': browser_driver_arg(),
    },
    doc="""
        "<page>" page should be displayed [in "<ui driver instance id>"]
        Browsers only
        Checks that page has defined title.

        * <page> (required): page title
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


then(
    '"<URL>" URL should be displayed [in "<ui driver instance id>"]',
    args={
        'URL': Argument('URL of page to open', 'url'),
        'ui driver instance id': browser_driver_arg(),
    },
    doc="""
        "<URL>" URL should be displayed [in "<ui driver instance id>"]
        Browsers only

        Checks that the page has a defined URL.
        * <URL> (required): an URL of the page
        * <ui driver instance id> (optional): ui connection, "app" by default
        """
)


then(
    'I see window identified by "<selector>" as "<window name>" [in "<ui driver instance id>"]',
    args={
        'selector': SelectorArgument('Selenium selector id for an element'),
        'window name': Argument('variable name to store extracted value', name='window_name'),
        'ui driver instance id': app_driver_arg(),
    },
    doc="""
        I see window identified by "<selector>" as "<window name>" [in "<ui driver instance id>"]

        Windows are being switched during while waiting for the window and a window with the selector is activated.

        * <selector> (required): Selenium selector id for an element
        * <window name> (required): variable name to store extracted value
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


then(
    'the file "<filename>" should be downloaded [in "<ui driver instance id>"]',
    args={
        'filename': Argument('name of file which should be downloaded'),
        'ui driver instance id': browser_driver_arg(),
    },
    manual_execution=True,
    doc="""
        the file "<filename>" should be downloaded [in "<ui driver instance id>"]
        Browsers only
        N.B. Sentence doesn't download the file, only checks it in the download folder according to the current browser
        (identified by ui driver instance id).

        * <filename> (required): name of file which should be downloaded
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


then(
    'I see simple notification "<title>" [in "<ui driver instance id>"]',
    args={
        'title': Argument('the title of simple notification'),
        'ui driver instance id': browser_driver_arg(),
    },
    manual_execution=True,
    doc="""
        I see simple notification "<title>" [in "<ui driver instance id>"]
        Mobile only

        https://medium.com/appium-tips/how-to-handle-push-notification-in-appium-2a038885ad01

        * <title> (required): the title of simple notification
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


then(
    'I put a value from ["<attribute>" attribute of] "<selector>" [in "<ui driver instance id>"] into "<variable>"',
    args={
        'attribute': Argument('element attribute name'),
        'selector': SelectorArgument('Selenium selector id for an element'),
        'ui driver instance id': app_driver_arg(),
        'variable': Argument('variable name to store extracted value'),
    },
    doc="""
        I put a value from ["<attribute>" attribute of] "<selector>" [in "<ui driver instance id>"] into "<variable>"

        * <attribute> (optional): element attribute name
        * <selector> (required): Selenium selector id for an element
        * <variable> (required): variable name to store extracted value
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)

then(
    'I remember a value from ["<attribute>" attribute of] "<selector>" [in "<ui driver instance id>"] as "<variable>"',
    args={
        'attribute': Argument('element attribute name'),
        'selector': SelectorArgument('Selenium selector id for an element'),
        'ui driver instance id': app_driver_arg(),
        'variable': Argument('variable name to store extracted value'),
    },
    doc="""
        I remember a value from ["<attribute>" attribute of] "<selector>" [in "<ui driver instance id>"] as "<variable>"

        * <attribute> (optional): element attribute name
        * <selector> (required): Selenium selector id for an element
        * <variable> (required): variable name to store extracted value
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)

then(
    'I remember current url [in "<ui driver instance id>"] as "<variable>"',
    args={
        'ui driver instance id': browser_driver_arg(),
        'variable': Argument('variable name to store url value'),
    },
    doc="""
        I remember current url [in "<ui driver instance id>"] as "<variable>"
        Remember current url and store its value in a variable with the given name.
        * <ui driver instance id> (optional): application connection, "app" by default
        * <variable> (required): variable name to store extracted value
        """
)


when(
    'I set window size to "<dimension>" [in "<ui driver instance id>"]',
    args={
        'dimension': Argument('dimension of window to set'),
        'ui driver instance id': browser_driver_arg(),
    },
    doc="""
        I set window size to "<dimension>" [in "<ui driver instance id>"]

        Sets window size to the specified dimension

        * <dimension> (required): dimension of window to set
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)

then(
    'Window size should be equal to "<dimension>" [in "<ui driver instance id>"]',
    args={
        'dimension': Argument('dimension of window to set'),
        'ui driver instance id': browser_driver_arg(),
    },
    doc="""
        Window size should be equal to "<dimension>" [in "<ui driver instance id>"]

        Verify window size is equal to the specified dimension

        * <dimension> (required): dimension of window
        * <ui driver instance id> (optional): application connection, "app" by default
        """
)


when(
    'I refresh the page [in "<ui driver instance id>"]',
    args={
        'ui driver instance id': browser_driver_arg(),
    },
    doc="""
        I refresh the page [in "<ui driver instance id>"]

        Makes a full reload of the current page

        * <ui driver instance id> (optional): ui connection, "app" by default
        """
)


when(
    'I navigate "<action>" [in "<ui driver instance id>"]',
    args={
        'action': EnumArgument('', ['back', 'forward']),
        'ui driver instance id': browser_driver_arg(),
    },
    doc="""
        I navigate "<action>" [in "<ui driver instance id>"]

        Helps in navigating forward and backward from current page

        * <action> (required): 'back', 'forward'
        * <ui driver instance id> (optional): ui connection, "app" by default
        """
)


when(
    'I upload a file "<file path>" to "<selector>" [in "<ui driver instance id>"]',
    args={
        'file path': Argument('Relative file path to upload', name='file_path'),
        'selector': SelectorArgument('Selenium selector id for an element'),
        'ui driver instance id': browser_driver_arg(),
    },
    doc="""
        I upload a file "<file path>" with "<selector>" [in "<ui driver instance id>"]

        * <file path> (required): Relative file path to upload
        * <selector> (required): Selenium selector where file needs to be uploaded
        * <ui driver instance id> (optional): ui connection, "app" by default
        """
)
