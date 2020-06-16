from typing import Optional
from Assert import Assert
from driver.CurlDriver import CurlDriver
from spec.curl import spec
from spec.intf.curl_intf import IHttp


class HttpImpl(IHttp):

    @spec.impl
    def http_request_as_driver(
            self,
            driver: CurlDriver
    ):
        driver.initialize()

    @spec.impl
    def i_set_header_to_value_in_driver(
            self,
            driver: CurlDriver,
            header: str,
            value: str
    ):
        driver.set_header(header, value)

    @spec.impl
    def i_set_body_to_value_in_driver(
            self,
            driver: CurlDriver,
            value: str
    ):
        driver.set_body(value)

    @spec.impl
    def i_set_body_in_driver_to(
            self,
            driver: CurlDriver,
            value: str
    ):
        driver.set_body(value)

    @spec.impl
    def i_execute_method_request_for_url_in_driver(
            self,
            driver: CurlDriver,
            method: str,
            url: str
    ):
        driver.execute_method_with_url(method, url)

    @spec.impl
    def request_in_driver_should_complete_successfully(
            self,
            driver: CurlDriver
    ):
        Assert.should_be_empty(driver.exception)

    @spec.impl
    def response_status_in_driver_should_be_value(
            self,
            driver: CurlDriver,
            value: str
    ):
        Assert.should_be_equal_to_value(driver.response.status_code, value)

    @spec.impl
    def response_header_in_driver_should_be_value(
            self,
            driver: CurlDriver,
            header: str,
            value: str
    ):
        Assert.should_be_equal_to_value(driver.response.headers[header], value)

    @spec.impl
    def response_body_in_driver_should_be_value(
            self,
            driver: CurlDriver,
            value: str):
        Assert.should_be_equal_to_value(driver.response.content, value)

    @spec.impl
    def value_should_be_in_response_body_of_driver(
            self,
            driver: CurlDriver,
            value: str
    ):
        Assert.should_contain_value(driver.response.content, value)

    @spec.impl
    def i_put_the_response_of_driver_into_variable_as_type(
            self,
            driver: CurlDriver,
            variable: str,
            as_type: Optional[str]
    ):
        self.i_remember_the_response_of_driver_as_variable_as_type(driver, variable, as_type)

    @spec.impl
    def i_remember_the_response_of_driver_as_variable_as_type(
            self,
            driver: CurlDriver,
            variable: str,
            as_type: Optional[str]
    ):
        if as_type == 'json':
            self.e2e.variables[variable] = driver.response.json()
        else:
            self.e2e.variables[variable] = driver.response

    @spec.impl
    def i_set_pre_encoded_query_param_key_to_value_in_driver(
        self,
        driver: CurlDriver,
        pre_encoded: bool,
        key: str,
        value: str,
    ):
        driver.set_query_parameter(key, value, pre_encoded)
