from typing import Optional

from Assert import Assert
from driver.SqlDriver import SqlDriver, ISqlConnectionFactory
from driver.sql.my_sql import MySqlConnectionFactory
from runtime.E2EContext import E2EContext
from spec.intf.sql_intf import ISql
from spec.sql import spec

FACTORY_CLASSES = {
    'mysql': MySqlConnectionFactory,
}


def create_factory(e2e: E2EContext, endpoint_name: str) -> ISqlConnectionFactory:
    try:
        endpoint = e2e.get_endpoint(endpoint_name)
        credentials = e2e.get_credentials(endpoint.credentials_id)

        factory_class = FACTORY_CLASSES[endpoint.type]

        return factory_class(endpoint, credentials)
    except Exception as e:
        raise RuntimeError(f'Failed to create SQL connection factory {endpoint_name}', e)


class SqlImpl(ISql):

    @spec.impl
    def db_type_version_connection_to_endpoint_as_driver(
            self,
            driver: SqlDriver,
            db_type: Optional[str],
            version: Optional[str],
            endpoint: str,
    ):
        connection_factory = create_factory(self.e2e, endpoint)
        driver.initialize(connection_factory)

    @spec.impl
    def i_execute_query_on_driver(
            self,
            driver: SqlDriver,
            query: str,
    ):
        driver.execute_query(query)

    @spec.impl
    def i_wait_while_query_on_driver_returns_empty_set(
            self,
            driver: SqlDriver,
            query: str,
    ):
        if not driver.execute_query_while(query, lambda _: driver.results):
            raise AssertionError('Timed-out while waiting for an empty set')

    @spec.impl
    def i_wait_unless_query_on_driver_returns_empty_set(
            self,
            driver: SqlDriver,
            query: str,
    ):
        if not driver.execute_query_while(query, lambda _: not driver.results):
            raise AssertionError('Timed-out while waiting for a non-empty set')

    @spec.impl
    def queries_on_driver_should_complete_successfully(
            self,
            driver: SqlDriver,
    ):
        Assert.should_be_empty(driver.exception)

    @spec.impl
    def result_set_on_driver_should_be_results(
            self,
            driver: SqlDriver,
            results: str,
    ):
        Assert.should_be_value(driver.results, results)

    @spec.impl
    def value_should_be_in_output_from_driver(
            self,
            driver: SqlDriver,
            value: str,
    ):
        Assert.should_contain_value(driver.results, value)

    @spec.impl
    def i_put_the_result_set_from_driver_into_variable_as_type(
            self,
            driver: SqlDriver,
            variable: str,
            as_type: Optional[str],
    ):
        self.i_remember_the_result_set_from_driver_as_variable_as_type(driver, variable, as_type)

    @spec.impl
    def i_remember_the_result_set_from_driver_as_variable_as_type(
            self,
            driver: SqlDriver,
            variable: str,
            as_type: Optional[str],
    ):
        self.e2e.variables[variable] = driver.results
