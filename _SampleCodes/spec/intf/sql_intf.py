from abc import abstractmethod
from typing import Optional
from E2EContext import E2EContext
from driver.SqlDriver import SqlDriver
from util.runner import Session


class ISql(Session):

    def __init__(self, e2e: E2EContext):
        super().__init__(e2e)

    @abstractmethod
    def db_db_type_version_connection_to_envhost_as_driver(
        self,
        driver: SqlDriver,
        db_type: Optional[str],
        version: Optional[str],
        envhost: str,
    ):
        """
        DB ["<type>"] ["<version>"] connection to "<envhost>" [as "<db driver instance id>"]

        * <type> (optional): MySQL, SQL Server, PostgreSQL, etc., type from environment by default
        * <version> (optional): exact client library version to use, version from environment by default
        * <envhost> (required): host definition from environment to connect to
        * <db driver instance id> (optional): a shortcut to this connection, "db" by default
        """
        pass

    @abstractmethod
    def i_execute_query_query_on_driver(
        self,
        driver: SqlDriver,
        query: str,
    ):
        """
        I execute query "<query>" [on "<db driver instance id>"]

        * <query> (required): SQL queries to execute
        * <db driver instance id> (optional): SQL connection to use, "db" by default
        """
        pass

    @abstractmethod
    def i_wait_while_query_on_driver_returns_empty_set(
        self,
        driver: SqlDriver,
        query: str,
    ):
        """
        I wait while "<query>" [on "<db driver instance id>"] returns empty set

        * <query> (required): SQL queries to execute
        * <db driver instance id> (optional): SQL connection to use, "db" by default
        """
        pass

    @abstractmethod
    def i_wait_unless_query_on_driver_returns_empty_set(
        self,
        driver: SqlDriver,
        query: str,
    ):
        """
        I wait unless "<query>" [on "<db driver instance id>"] returns empty set

        * <query> (required): SQL queries to execute
        * <db driver instance id> (optional): SQL connection to use, "db" by default
        """
        pass

    @abstractmethod
    def queries_on_driver_should_complete_successfully(
        self,
        driver: SqlDriver,
    ):
        """
        queries [on "<db driver instance id>"] should complete successfully

        * <db driver instance id> (optional): SQL connection to use, "db" by default
        """
        pass

    @abstractmethod
    def result_set_on_driver_should_be_results(
        self,
        driver: SqlDriver,
        results: str,
    ):
        """
        result set [on "<db driver instance id>"] should be "<results>"

        * <db driver instance id> (optional): SQL connection to use, "db" by default
        * <results> (required): referenced result set table - fixme: needs to be defined somehow
        """
        pass

    @abstractmethod
    def value_should_be_in_output_from_driver(
        self,
        driver: SqlDriver,
        value: str,
    ):
        """
        "<value>" should be in output [from "<db driver instance id>"]

        * <value> (required): string to find in query result
        * <db driver instance id> (optional): SQL connection to use, "db" by default
        """
        pass

    @abstractmethod
    def i_put_the_result_set_from_driver_into_variable_as_as_type(
        self,
        driver: SqlDriver,
        variable: str,
        as_type: Optional[str],
    ):
        """
        I put the result set [from "<db driver instance id>"] into "<variable>" [as <type>]

        * <variable> (required): variable name to store extracted value
        * <db driver instance id> (optional): SQL connection to use, "db" by default
        * <type> (optional): "json"
        """
        pass
