from abc import abstractmethod
from typing import Optional
from E2EContext import E2EContext
from driver.CurlDriver import CurlDriver
from util.runner import Session


class IHttp(Session):

    def __init__(self, e2e: E2EContext):
        super().__init__(e2e)

    @abstractmethod
    def http_request_as_driver(
        self,
        driver: CurlDriver,
    ):
        """
        HTTP request [as "<http driver instance id>"]

        * <http driver instance id> (optional): a shortcut to this HTTP request, "curl" by default
        """
        pass

    @abstractmethod
    def i_set_header_header_to_value_in_driver(
        self,
        driver: CurlDriver,
        header: str,
        value: str,
    ):
        """
        I set header "<header>" to "<value>" [in "<http driver instance id>"]

        * <header> (required): header name
        * <value> (required): value of header
        * <http driver instance id> (optional): request object to use, "curl" by default
        """
        pass

    @abstractmethod
    def i_set_body_to_value_in_driver(
        self,
        driver: CurlDriver,
        value: str,
    ):
        """
        I set body to "<value>" [in "<http driver instance id>"]

        * <value> (required): value for request body
        * <http driver instance id> (optional): request object to use, "curl" by default
        """
        pass

    @abstractmethod
    def i_set_body_in_driver_to(
        self,
        driver: CurlDriver,
        value: str,
    ):
        """
        I set body [in "<http driver instance id>"] to:

        \"""
        <value>
        \"""

        * <value> (required): value for request body
        * <http driver instance id> (optional): request object to use, "http" by default
        """
        pass

    @abstractmethod
    def i_execute_method_request_for_url_in_driver(
        self,
        driver: CurlDriver,
        method: str,
        url: str,
    ):
        """
        I execute <method> request for "<URL>" [in "<http driver instance id>"]

        * <method> (required): "GET", "POST", "PUT", "DELETE", "HEAD", "OPTIONS"
        * <http driver instance id> (optional): request object to use, "curl" by default
        """
        pass

    @abstractmethod
    def request_in_driver_should_complete_successfully(
        self,
        driver: CurlDriver,
    ):
        """
        request [in "<http driver instance id>"] should complete successfully

        * <http driver instance id> (optional): request object to use, "curl" by default
        """
        pass

    @abstractmethod
    def response_status_in_driver_should_be_value(
        self,
        driver: CurlDriver,
        value: str,
    ):
        """
        response status [in "<http driver instance id>"] should be "<value>"

        * <http driver instance id> (optional): request object to use, "curl" by default
        * <value> (required): numeric HTTP status to compare with
        """
        pass

    @abstractmethod
    def response_header_header_in_driver_should_be_value(
        self,
        driver: CurlDriver,
        header: str,
        value: str,
    ):
        """
        response header "<header>" [in "<http driver instance id>"] should be "<value>"

        * <header> (required): header name
        * <http driver instance id> (optional): request object to use, "curl" by default
        * <value> (required): exact value to compare output with
        """
        pass

    @abstractmethod
    def response_body_in_driver_should_be_value(
        self,
        driver: CurlDriver,
        value: str,
    ):
        """
        response body [in "<http driver instance id>"] should be "<value>"

        * <http driver instance id> (optional): request object to use, "curl" by default
        * <value> (required): exact value to compare output with
        """
        pass

    @abstractmethod
    def value_should_be_in_response_body_of_driver(
        self,
        driver: CurlDriver,
        value: str,
    ):
        """
        "<value>" should be in response body [of "<http driver instance id>"]

        * <value> (required): string to find in commands execution output
        * <http driver instance id> (optional): request object to use, "curl" by default
        """
        pass

    @abstractmethod
    def i_put_the_response_of_driver_into_variable_as_as_type(
        self,
        driver: CurlDriver,
        variable: str,
        as_type: Optional[str],
    ):
        """
        I put the response [of "<http driver instance id>"] into "<variable>" [as <type>]

        * <variable> (required): variable name to store extracted value
        * <http driver instance id> (optional): request object to use, "curl" by default
        * <type> (optional): "json"
        """
        pass
