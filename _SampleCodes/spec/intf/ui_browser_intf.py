from abc import abstractmethod
from typing import Optional
from E2EContext import E2EContext
from driver.UiBrowserDriver import BrowserDriver, UiDriver, AppDriver
from util.runner import Session
from util.spec import Selector


class IUiBrowser(Session):

    def __init__(self, e2e: E2EContext):
        super().__init__(e2e)

    @abstractmethod
    def browser_browser_version_as_driver(
        self,
        driver: BrowserDriver,
        browser: str,
        version: Optional[str],
    ):
        """
        browser "<browser>" ["<version>"] [as "<ui driver instance id>"]
        Browsers only

        * <browser> (required): "Chrome", "Firefox", "Internet Explorer".
        * <version> (optional): depends on chosen browser, latest stable by default
        * <ui driver instance id> (optional): a shortcut to this connection, "app" by default
        """
        pass

    @abstractmethod
    def ui_connection_to_envhost_as_driver(
        self,
        driver: UiDriver,
        envhost: str,
    ):
        """
        UI connection to "<envhost>" [as "<ui driver instance id>"]
        GUI applications only

        * <envhost> (required): environment where to run the application
        * <ui driver instance id> (optional): application connection, "app" by default
        """
        pass

    @abstractmethod
    def i_open_url_in_driver(
        self,
        driver: BrowserDriver,
        url: str,
    ):
        """
        I open "<URL>" [in "<ui driver instance id>"]
        Browsers only

        * <URL> (required): URL of page to open
        * <ui driver instance id> (optional): application connection, "app" by default
        """
        pass

    @abstractmethod
    def i_run_application_application_in_driver(
        self,
        driver: UiDriver,
        application: str,
    ):
        """
        I run application "<application>" [in "<ui driver instance id>"]
        GUI applications only

        * <application> (required): application path to run
        * <ui driver instance id> (optional): application connection, "app" by default
        """
        pass

    @abstractmethod
    def i_switch_to_main_window_in_driver(
        self,
        driver: AppDriver,
    ):
        """
        I switch to main window [in "<ui driver instance id>"]

        * <ui driver instance id> (optional): application connection, "app" by default
        """
        pass

    @abstractmethod
    def i_switch_to_window_window_name_in_driver(
        self,
        driver: AppDriver,
        window_name: str,
    ):
        """
        I switch to window "<window name>" [in "<ui driver instance id>"]

        * <window name> (required): window name to switch
        * <ui driver instance id> (optional): application connection, "app" by default
        """
        pass

    @abstractmethod
    def i_close_the_main_window_in_driver(
        self,
        driver: AppDriver,
    ):
        """
        I close the main window [in "<ui driver instance id>"]

        <ui driver instance id> (optional): application connection, "app" by default
        """
        pass

    @abstractmethod
    def i_close_the_window_window_name_in_driver(
        self,
        driver: AppDriver,
        window_name: str,
    ):
        """
        I close the window "<window name>" [in "<ui driver instance id>"]

        * <window name> (required): a name for ui window
        * <ui driver instance id> (optional): application connection, "app" by default
        """
        pass

    @abstractmethod
    def i_close_all_windows_in_driver(
        self,
        driver: AppDriver,
    ):
        """
         I close all windows [in "<ui driver instance id>"]

        * <ui driver instance id> (optional): application connection, "app" by default
        """
        pass

    @abstractmethod
    def i_action_on_selector_in_driver(
        self,
        driver: AppDriver,
        action: str,
        selector: Selector,
    ):
        """
        I <action> on "<selector>" [in "<ui driver instance id>"]

        * <action> (required): "click", "double click", "right click", "hover", "focus","tap"
        * <selector> (required): DOM selector id from preconditions
        * <ui driver instance id> (optional): application connection, "app" by default
        """
        pass

    @abstractmethod
    def i_action_value_to_selector_attribute_attribute_in_driver(
        self,
        driver: BrowserDriver,
        action: str,
        value: str,
        selector: Selector,
        attribute: str,
    ):
        """
        I <action> "<value>" to "<selector>" attribute "<attribute>" [in "<ui driver instance id>"]
        Browser only

        * <action> (required): "set", "append", "prepend"
        * <value> (required): value to append
        * <selector> (required): DOM selector id from preconditions
        * <attribute> (required): element attribute name
        * <ui driver instance id> (optional): application connection, "app" by default
        """
        pass

    @abstractmethod
    def i_action_value_to_selector_value_in_driver(
        self,
        driver: BrowserDriver,
        action: str,
        value: str,
        selector: Selector,
    ):
        """
        I <action> "<value>" to "<selector>" value [in "<ui driver instance id>"]
        Browser only

        It's a shortcut for "I <action> "<value>" to "<selector" attribute "value" [in "<ui driver instance id>"]
        """
        pass

    @abstractmethod
    def i_set_selector_value_to_value_in_driver(
        self,
        driver: UiDriver,
        selector: Selector,
        value: str,
    ):
        """
        I set "<selector>" value to "<value>" [in "<ui driver instance id>"]
        GUI applications only

        * <selector> (required): selector id from preconditions
        * <value> (required): value to set
        * <ui driver instance id> (optional): application connection, "app" by default
        """
        pass

    @abstractmethod
    def i_action_value_to_selector_in_driver(
        self,
        driver: UiDriver,
        action: str,
        value: str,
        selector: Selector,
    ):
        """
        I <action> "<value>" to "<selector>" [in "<ui driver instance id>"]
        GUI applications only

        * <action> (required): "append", "prepend"
        * <value> (required): value to append
        * <selector> (required): DOM selector id from preconditions
        * <ui driver instance id> (optional): application connection, "app" by default
        """
        pass

    @abstractmethod
    def i_state_selector_checkbox_in_driver(
        self,
        driver: AppDriver,
        state: str,
        selector: Selector,
    ):
        """
        I "<state>" "<selector>" checkbox [in "<ui driver instance id>"]

        * <state> (required): "check", "uncheck".
        * <selector> (required): DOM selector id from preconditions
        * <ui driver instance id> (optional): application connection, "app" by default
        """
        pass

    @abstractmethod
    def i_wait_while_selector_appears_in_driver(
        self,
        driver: AppDriver,
        selector: Selector,
    ):
        """
        I wait while "<selector>" appears [in "<ui driver instance id>"]

        * <selector> (required): DOM selector id from preconditions
        * <ui driver instance id> (optional): application connection, "app" by default
        """
        pass

    @abstractmethod
    def i_wait_unless_selector_appears_in_driver(
        self,
        driver: AppDriver,
        selector: Selector,
    ):
        """
        I wait unless "<selector>" appears [in "<ui driver instance id>"]

        * <selector> (required): DOM selector id from preconditions
        * <ui driver instance id> (optional): application connection, "app" by default
        """
        pass

    @abstractmethod
    def i_scroll_direction_in_driver(
        self,
        driver: AppDriver,
        direction: str,
    ):
        """
        I scroll "<direction>" [in "<ui driver instance id>"]

        * <direction> (required): "up", "down", "left", "right"
        * <ui driver instance id> (optional): application connection, "app" by default
        """
        pass

    @abstractmethod
    def i_long_press_key_in_driver(
        self,
        driver: AppDriver,
        long: Optional[str],
        key: str,
    ):
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
        pass

    @abstractmethod
    def i_type_keystring_in_driver(
        self,
        driver: AppDriver,
        keystring: str,
    ):
        """
        I type "<keystring>" [in "<ui driver instance id>"]

        * <keystring> (required): a string of keys to press
        * <ui driver instance id> (optional): application connection, "app" by default
        """
        pass

    @abstractmethod
    def i_drag_element_and_drop_it_into_container_in_driver(
        self,
        driver: AppDriver,
        element: Selector,
        container: Selector,
    ):
        """
        I drag "<element>" and drop it into "<container>" [in "<ui driver instance id>"]

        * <element> (required): selector id of element for drag and drop operation
        * <container> (required): selector id of container to drop dragging element
        * <ui driver instance id> (optional): application connection, "app" by default
        """
        pass

    @abstractmethod
    def i_action_in_driver(
        self,
        driver: UiDriver,
        action: str,
    ):
        """
        I "<screen action>" [in "<ui driver instance id>"]
        GUI applications only

        * <screen action> (required): "pull to refresh", "swipe from left", "swipe from right"
        * <ui driver instance id> (optional): application connection, "app" by default
        """
        pass

    @abstractmethod
    def i_should_see_value_in_selector_in_driver(
        self,
        driver: AppDriver,
        value: str,
        selector: Selector,
    ):
        """
        I should see "<value>" in "<selector>" [in "<ui driver instance id>"]

        * <value> (required): expected value of element
        * <selector> (required): Selenium selector for an element
        * <ui driver instance id> (optional): application connection, "app" by default
        """
        pass

    @abstractmethod
    def i_should_see_text_in_selector_in_driver(
        self,
        driver: AppDriver,
        selector: Selector,
        text: str,
    ):
        """
        I should see text in "<selector>" [in "<ui driver instance id>"]:
        \"""
        <text>
        \"""

        * <text> (required): expected value of element
        * <selector> (required): Selenium selector for an element
        * <ui driver instance id> (optional): application connection, "app" by default
        """
        pass

    @abstractmethod
    def selector_should_not_displayed_be_displayed_in_driver(
        self,
        driver: AppDriver,
        selector: Selector,
        not_displayed: Optional[str],
    ):
        """
        "<selector>" should [not] be displayed [in "<ui driver instance id>"]

        * <selector> (required): Selenium selector for an element
        * <ui driver instance id> (optional): ui connection, "app" by default
        """
        pass

    @abstractmethod
    def window_window_should_be_displayed_in_driver(
        self,
        driver: UiDriver,
        window: str,
    ):
        """
        "<window>" window should be displayed [in "<ui driver instance id>"]
        GUI applications only

        Checks that application window has defined title.
        <window> (required): page title
        <ui driver instance id> (optional): application connection, "app" by default
        """
        pass

    @abstractmethod
    def page_page_should_be_displayed_in_driver(
        self,
        driver: BrowserDriver,
        page: str,
    ):
        """
        "<page>" page should be displayed [in "<ui driver instance id>"]
        Browsers only
        Checks that page has defined title.

        * <page> (required): page title
        * <ui driver instance id> (optional): application connection, "app" by default
        """
        pass

    @abstractmethod
    def i_see_window_identified_by_selector_as_window_name_in_driver(
        self,
        driver: AppDriver,
        selector: Selector,
        window_name: str,
    ):
        """
        I see window identified by "<selector>" as "<window name>" [in "<ui driver instance id>"]

        Windows are being switched during while waiting for the window and a window with the selector is activated.

        * <selector> (required): Selenium selector id for an element
        * <window name> (required): variable name to store extracted value
        * <ui driver instance id> (optional): application connection, "app" by default
        """
        pass

    @abstractmethod
    def i_put_a_value_from_attribute_attribute_of_selector_in_driver_into_variable(
        self,
        driver: AppDriver,
        attribute: Optional[str],
        selector: Selector,
        variable: str,
    ):
        """
        I put a value from ["<attribute>" attribute of] "<selector>" [in "<ui driver instance id>"] into "<variable>"

        * <attribute> (optional): element attribute name
        * <selector> (required): Selenium selector id for an element
        * <variable> (required): variable name to store extracted value
        * <ui driver instance id> (optional): application connection, "app" by default
        """
        pass
