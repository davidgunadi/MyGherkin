from abc import abstractmethod
from E2EContext import E2EContext
from util.runner import Session


class IVariables(Session):

    def __init__(self, e2e: E2EContext):
        super().__init__(e2e)

    @abstractmethod
    def environment(
        self,
        json: str,
    ):
        """
        environment
        \"""
        <json>
        \"""
        Defines environment hosts.

        "<id>": {
            "host": "<host>",
            "credentials": "<credentials>"
        }[,
        ...]

        :param json: JSON
        """
        pass

    @abstractmethod
    def credentials(
        self,
        json: str,
    ):
        """
        credentials
        \"""
        <json>
        \"""

        Defines credentials.

        "<id>": {
            "username": "<string>",
            "password": "<string>"
        }[,
        ...]

        :param json: JSON
        """
        pass

    @abstractmethod
    def selectors(
        self,
        json: str,
    ):
        """
        credentials
        \"""
        <json>
        \"""
        Defines selectors.

        "<id>": "<xpath>"[,
        ...]

        :param json: JSON
        """
        pass

    @abstractmethod
    def variables(
        self,
        json: str,
    ):
        """
        variables
        \"""
        <json>
        \"""
        Defines variables.

        "<id>": "<value>"[,
        ...]
        """
        pass

    @abstractmethod
    def variable_value_is_value(
        self,
        variable: str,
        value: str,
    ):
        """
        "<variable>" value is "<value>"

        * <variable> (required): variable name to store a value
        * <value> (required): the value of variable
        """
        pass

    @abstractmethod
    def variable_value_is(
        self,
        variable: str,
        value: str,
    ):
        """
        "<variable>" value is:
        \"""
        <value>
        \"""

        * <variable> (required): variable name to store a value
        * <value> (required): the value of variable
        """
        pass

    @abstractmethod
    def destination_variable_is_a_jsonpath_selected_value_expression_from_source_variable(
        self,
        destination_variable: str,
        expression: str,
        source_variable: str,
    ):
        """
        "<destination_variable>" is a jsonpath selected value "<expression>" from "<source_variable>"

        * <destination_variable> (required): variable name to store a value
        * <expression> (required): the jsonpath expression to select a value
        * <source_variable> (required): variable name of an object to apply the jsonpath to

        JsonPath spec: https://github.com/json-path/JsonPath
        JsonPath online evaluator: https://jsonpath.herokuapp.com/
        """
        pass

    @abstractmethod
    def the_value_of_variable_comparison(
        self,
        variable: str,
        comparison: str,
    ):
        """
        the value of "<variable>" <comparison>

        * <comparison> (required):
            * should be empty
            * should not be empty
            * should be "<value>"
            * should not be "<value>"
            * should equal to "<value>"
            * should not equal to "<value>"
            * should be less than "<value>"
            * should be greater than "<value>"
            * should be less than or equal to "<value>"
            * should be greater than or equal to "<value>"
            * should be between "<from value>" and "<to value>"
            * should contain "<value>"
            * should not contain "<value>"

        * <value>, <from value>, <to value>: expected value of the variable
        """
        pass
