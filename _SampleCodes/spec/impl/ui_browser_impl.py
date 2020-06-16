from typing import Optional

from selenium.common.exceptions import TimeoutException
from selenium.webdriver.remote.webelement import WebElement

from driver.UiBrowserDriver import BrowserDriver, UiDriver, AppDriver
from spec.intf.ui_browser_intf import IUiBrowser
from spec.ui_browser import spec
from util.spec import Selector
from Assert import Assert


def to_implement_gui(jira: str):
    def impl(func):
        return spec.partially_implemented("Need to add GUI support", jira=jira)(func)
    return impl


class UiBrowserImpl(IUiBrowser):

    @spec.impl
    def browser_version_as_driver(
            self,
            driver: BrowserDriver,
            browser: str,
            version: Optional[str],
    ):
        driver.initialize(browser, version)
        self.e2e.variables['windows'] = dict()
        self.e2e.variables['frames'] = dict()

    @spec.not_implemented(jira='E2EPLTFRM-58')
    def ui_connection_to_endpoint_as_driver(
            self,
            driver: UiDriver,
            endpoint: str,
    ):
        raise NotImplementedError()

    @spec.impl
    def i_open_url_in_driver(
            self,
            driver: BrowserDriver,
            url: str,
    ):
        driver.open_page(url)
        self.e2e.variables['windows']['main'] = driver.get_current_window()

    @spec.not_implemented(jira='E2EPLTFRM-59')
    def i_run_application_in_driver(
            self,
            driver: UiDriver,
            application: str,
    ):
        raise NotImplementedError()

    @to_implement_gui(jira='E2EPLTFRM-61')
    def i_switch_to_window_name_in_driver(
            self,
            driver: AppDriver,
            window_name: str,
    ):
        driver.switch_to_window(self.e2e.variables['windows'][window_name])

    @spec.impl
    def i_action_window_index_window_and_close_others_in_driver(
            self,
            driver: BrowserDriver,
            action: str,
            window_index: str,
            others: Optional[str],
    ):
        {
            'switch to': driver.switch_to_window_and_close_others,
            'close': driver.close_window_by_map_index
        }[action](window_index, others)

    @to_implement_gui(jira='E2EPLTFRM-62')
    def i_close_the_main_window_in_driver(
            self,
            driver: AppDriver
    ):
        driver.close_window(self.e2e.variables['windows']['main'])

    @to_implement_gui(jira='E2EPLTFRM-63')
    def i_close_the_window_name_in_driver(
            self,
            driver: AppDriver,
            window_name: str
    ):
        driver.close_window(self.e2e.variables['windows'][window_name])

    @to_implement_gui(jira='E2EPLTFRM-64')
    def i_close_all_windows_in_driver(
            self,
            driver: AppDriver
    ):
        driver.close_all_windows()

    @to_implement_gui(jira='E2EPLTFRM-65')
    def i_action_on_selector_in_driver(
            self,
            driver: AppDriver,
            action: str,
            selector: Selector,
    ):
        {
            'click': driver.selector_click,
            'double click': driver.selector_double_click,
            'right click': driver.selector_right_click,
            'hover': driver.selector_hover,
            'focus': driver.selector_focus,
            'mouse down': driver.selector_mouse_down,
            'mouse up': driver.selector_mouse_up,
            'tap': driver.selector_tap
        }[action](selector)

    @spec.impl
    def i_action_value_to_selector_attribute_in_driver(
            self,
            driver: BrowserDriver,
            action: str,
            value: str,
            selector: Selector,
            attribute: str,
    ):
        {
            'set': driver.selector_set_attribute,
            'append': driver.selector_append_attribute,
            'prepend': driver.selector_prepend_attribute
        }[action](selector, attribute, value)

    @spec.impl
    def i_action_value_to_selector_value_in_driver(
            self,
            driver: BrowserDriver,
            action: str,
            value: str,
            selector: Selector,
    ):
        {
            'set': driver.selector_set_attribute,
            'append': driver.selector_append_attribute,
            'prepend': driver.selector_prepend_attribute
        }[action](selector, 'value', value)

    @spec.not_implemented(jira='E2EPLTFRM-66')
    def i_set_selector_value_to_value_in_driver(
            self,
            driver: AppDriver,
            selector: Selector,
            value: str,
    ):
        driver.set_value_by_selector(selector, value)

    @spec.not_implemented(jira='E2EPLTFRM-67')
    def i_action_value_to_selector_in_driver(
            self,
            driver: UiDriver,
            action: str,
            value: str,
            selector: Selector,
    ):
        raise NotImplementedError()

    @to_implement_gui(jira='E2EPLTFRM-68')
    def i_state_selector_checkbox_in_driver(
            self,
            driver: AppDriver,
            state: str,
            selector: Selector,
    ):
        {
            'check': driver.selector_checkbox_check,
            'uncheck': driver.selector_checkbox_uncheck
        }[state](selector)

    @to_implement_gui(jira='E2EPLTFRM-69')
    def i_wait_while_selector_appears_in_driver(
            self,
            driver: AppDriver,
            selector: Selector,
    ):
        driver.wait_until_displayed(selector)

    @to_implement_gui(jira='E2EPLTFRM-70')
    def i_wait_unless_selector_appears_in_driver(
            self,
            driver: AppDriver,
            selector: Selector,
    ):
        driver.wait_until_not_visible(selector)

    @to_implement_gui(jira='E2EPLTFRM-71')
    def i_scroll_direction_in_driver(
            self,
            driver: AppDriver,
            direction: str,
    ):
        {
            'up': driver.scroll_up,
            'down': driver.scroll_down,
            'left': driver.scroll_left,
            'right': driver.scroll_right
        }[direction]()

    @to_implement_gui(jira='E2EPLTFRM-72')
    def i_scroll_to_the_element_selector_in_driver(
            self, driver: AppDriver,
            selector: Selector
    ):
        driver.scroll_to(selector)

    @to_implement_gui(jira='E2EPLTFRM-73')
    def i_long_press_key_in_driver(
            self,
            driver: AppDriver,
            long: Optional[str],
            key: str,
    ):
        driver.press_key(key)

    @to_implement_gui(jira='E2EPLTFRM-74')
    def i_type_slowly_keystring_in_driver(
            self,
            driver: AppDriver,
            slowly: bool,
            keystring: str,
    ):
        driver.type(keystring, slowly)

    @to_implement_gui(jira='E2EPLTFRM-75')
    def i_drag_element_and_drop_it_into_container_in_driver(
            self,
            driver: AppDriver,
            element: Selector,
            container: Selector,
    ):
        driver.drag_and_drop(element, container)

    @spec.not_implemented(jira='E2EPLTFRM-77')
    def i_action_in_driver(
            self,
            driver: UiDriver,
            action: str,
    ):
        raise NotImplementedError()

    @spec.impl
    def i_accept_the_alert_box_by_clicking_on_value_in_driver(
            self,
            driver: AppDriver,
            value: Optional[str]
    ):
        driver.accept_alert()

    @spec.impl
    def i_dismiss_the_alert_box_by_clicking_on_value_in_driver(
            self,
            driver: AppDriver,
            value: Optional[str]
    ):
        driver.dismiss_alert()

    @to_implement_gui(jira='E2EPLTFRM-81')
    def i_should_see_value_in_selector_in_driver(
            self,
            driver: AppDriver,
            value: str,
            selector: Selector,
    ):
        self._should_see_value_in_selector(driver, selector, value)

    @spec.impl
    def i_should_see_value_matches_value_in_selector_in_driver(
            self,
            driver: BrowserDriver,
            value: str,
            selector: Selector,
    ):
        try:
            driver.wait_until_value_matches(selector, value)
        except TimeoutException as err:
            raise AssertionError(err, "Selector isn't still visible", selector)

    @to_implement_gui(jira='E2EPLTFRM-82')
    def i_should_see_text_in_selector_in_driver(
            self,
            driver: AppDriver,
            selector: Selector,
            text: str,
    ):
        self._should_see_value_in_selector(driver, selector, text)

    @staticmethod
    def _should_see_value_in_selector(driver: AppDriver, selector: Selector, value: str):
        try:
            driver.wait_until_value_visible(selector, value)
        except TimeoutException as err:
            raise AssertionError(err, "Selector isn't still visible", selector)

    @to_implement_gui(jira='E2EPLTFRM-83')
    def selector_should_not_be_displayed_in_driver(
            self,
            driver: AppDriver,
            selector: Selector,
            is_not: bool):
        try:
            if is_not:
                driver.wait_until_not_visible(selector)
            else:
                driver.wait_until_displayed(selector)
        except TimeoutException as err:
            raise AssertionError(err, "Selector is still visible", selector)

    @spec.not_implemented(jira='E2EPLTFRM-84')
    def window_should_not_displayed_be_displayed_in_driver(
        self,
        driver: UiDriver,
        window: str,
        not_displayed: Optional[str],
    ):
        raise NotImplementedError()

    @spec.impl
    def page_should_be_displayed_in_driver(
        self,
        driver: BrowserDriver,
        page: str,
    ):
        try:
            driver.wait_until_title(page)
        except TimeoutException as err:
            raise AssertionError(err, "Unexpected page title", page, driver.session.title)

    @spec.impl
    def url_should_be_displayed_in_driver(
            self,
            driver: BrowserDriver,
            url: str
    ):
        try:
            driver.wait_until_url(url)
        except TimeoutException as err:
            raise AssertionError(err, "Unexpected URL", url, driver.session.current_url)

    @to_implement_gui(jira='E2EPLTFRM-85')
    def i_see_window_identified_by_selector_as_window_name_in_driver(
        self,
        driver: AppDriver,
        selector: Selector,
        window_name: str,
    ):
        handle = driver.wait_until_window_present(selector)
        self.e2e.variables['windows'][window_name] = handle

    @to_implement_gui(jira='E2EPLTFRM-88')
    def i_put_a_value_from_attribute_of_selector_in_driver_into_variable(
        self,
        driver: AppDriver,
        attribute: Optional[str],
        selector: Selector,
        variable: str,
    ):
        self.i_remember_a_value_from_attribute_of_selector_in_driver_as_variable(driver, attribute, selector, variable)

    @to_implement_gui(jira='E2EPLTFRM-88')
    def i_remember_a_value_from_attribute_of_selector_in_driver_as_variable(
            self, driver: AppDriver,
            attribute: Optional[str],
            selector: Selector,
            variable: str,
    ):
        element: WebElement = driver.wait_until_present(selector)
        value = element.get_attribute(attribute) if attribute else element.text
        self.e2e.variables[variable] = value

    @spec.impl
    def i_remember_current_url_in_driver_as_variable(
        self,
        driver: BrowserDriver,
        variable: str,
    ):
        value = driver.get_current_url()
        self.e2e.variables[variable] = value

    @spec.impl
    def i_set_window_size_to_dimension_in_driver(
            self,
            driver: BrowserDriver,
            dimension: str,
    ):
        width, height = dimension.split('x')
        driver.set_window_size(width, height)

    @spec.impl
    def i_refresh_the_page_in_driver(
            self,
            driver: BrowserDriver,
    ):
        driver.refresh_page()

    @spec.impl
    def i_navigate_action_in_driver(
            self,
            driver: BrowserDriver,
            action: str,
    ):
        {
            'back': driver.navigate_back,
            'forward': driver.navigate_forward,
        }[action]()

    @spec.impl
    def i_upload_a_file_path_to_selector_in_driver(
            self,
            driver: BrowserDriver,
            file_path: str,
            selector: Selector,
    ):
        driver.upload_file(selector, file_path)

    @spec.impl
    def window_size_should_be_equal_to_dimension_in_driver(
            self,
            driver: BrowserDriver,
            dimension: str,
    ):
        size = driver.get_window_size()
        Assert.should_be_equal_to_value(dimension, f"{size['width']}x{size['height']}")
